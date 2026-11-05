from pathlib import Path
import csv
import os
import time

import psycopg
import sqlparse
from dotenv import load_dotenv


# ------------------------------------------------------------
# Project paths and configuration
# ------------------------------------------------------------

PROJECT_ROOT = Path(__file__).resolve().parents[2]
MANIFEST_PATH = (
    PROJECT_ROOT / "reporting" / "config" / "execution_manifest.csv"
)

load_dotenv(PROJECT_ROOT / ".env")


# ------------------------------------------------------------
# Database connection
# ------------------------------------------------------------

def get_connection():
    """Create a connection to the project PostgreSQL database."""

    return psycopg.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        dbname=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        connect_timeout=5,
    )


# ------------------------------------------------------------
# Manifest loading
# ------------------------------------------------------------

def load_manifest():
    """Read the SQL execution manifest."""

    if not MANIFEST_PATH.exists():
        raise FileNotFoundError(
            f"Execution manifest not found: {MANIFEST_PATH}"
        )

    with MANIFEST_PATH.open(
        mode="r",
        encoding="utf-8-sig",
        newline="",
    ) as file:
        return list(csv.DictReader(file))


# ------------------------------------------------------------
# SQL safety checks
# ------------------------------------------------------------

def validate_sql_file(sql_path):
    """
    Validate a SQL file before execution.

    Only one SELECT or WITH statement is accepted.
    PostgreSQL read-only transactions provide an
    additional database-level protection.
    """

    sql = sql_path.read_text(encoding="utf-8")

    statements = [
        statement.strip()
        for statement in sqlparse.split(sql)
        if statement.strip()
    ]

    if len(statements) != 1:
        raise ValueError(
            f"Expected exactly one SQL statement; "
            f"found {len(statements)}."
        )

    statement = statements[0]

    parsed = sqlparse.parse(statement)

    if not parsed:
        raise ValueError("The SQL statement could not be parsed.")

    first_keyword = parsed[0].get_type()

    if first_keyword != "SELECT":
        raise ValueError(
            "Only SELECT queries are allowed. "
            f"Detected statement type: {first_keyword}."
        )

    return statement


# ------------------------------------------------------------
# SQL execution
# ------------------------------------------------------------

def execute_query(sql_path):
    """Execute one approved query in a read-only transaction."""

    statement = validate_sql_file(sql_path)

    start_time = time.perf_counter()

    with get_connection() as connection:

        with connection.transaction():

            with connection.cursor() as cursor:

                # Database-level protection:
                # modifications are not allowed in this transaction.
                cursor.execute("SET TRANSACTION READ ONLY")

                cursor.execute(statement)

                if cursor.description is None:
                    raise ValueError(
                        "The query did not return a result set."
                    )

                columns = [
                    column.name
                    for column in cursor.description
                ]

                rows = cursor.fetchall()

    execution_time = time.perf_counter() - start_time

    return {
        "columns": columns,
        "rows": rows,
        "row_count": len(rows),
        "execution_time_seconds": round(execution_time, 6),
    }


# ------------------------------------------------------------
# Manifest entry execution
# ------------------------------------------------------------

def execute_manifest_entry(entry):
    """Validate and execute one manifest entry."""

    if entry.get("execution_mode") != "read_only":
        raise ValueError(
            "This SQL file is not approved for automatic execution."
        )

    if entry.get("export_results", "").lower() != "true":
        raise ValueError(
            "Result export is disabled for this manifest entry."
        )

    relative_path = Path(entry["sql_file"])

    sql_path = (PROJECT_ROOT / relative_path).resolve()

    # Prevent manifest paths from escaping the project directory.
    if not sql_path.is_relative_to(PROJECT_ROOT.resolve()):
        raise ValueError("SQL file path is outside the project directory.")

    if not sql_path.is_file():
        raise FileNotFoundError(
            f"SQL file not found: {sql_path}"
        )

    result = execute_query(sql_path)

    return {
        "module_id": entry["module_id"],
        "module_name": entry["module_name"],
        "sql_file": entry["sql_file"],
        **result,
    }