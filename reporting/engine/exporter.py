from pathlib import Path
import csv
from datetime import datetime, timezone


# ------------------------------------------------------------
# Project paths
# ------------------------------------------------------------

PROJECT_ROOT = Path(__file__).resolve().parents[2]
REPORTS_ROOT = PROJECT_ROOT / "reports"


# ------------------------------------------------------------
# Formatting helpers
# ------------------------------------------------------------

def format_value(value):
    """Convert database values into readable text."""

    if value is None:
        return "NULL"

    return str(value)


def escape_markdown(value):
    """Escape special characters in Markdown table cells."""

    return (
        format_value(value)
        .replace("|", r"\|")
        .replace("\n", "<br>")
        .replace("\r", "")
    )


# ------------------------------------------------------------
# CSV export
# ------------------------------------------------------------

def export_csv(result, output_path):
    """Export query results to a CSV file."""

    output_path.parent.mkdir(parents=True, exist_ok=True)

    with output_path.open(
        mode="w",
        encoding="utf-8-sig",
        newline="",
    ) as file:

        writer = csv.writer(file)

        writer.writerow(result["columns"])
        writer.writerows(result["rows"])


# ------------------------------------------------------------
# Markdown report generation
# ------------------------------------------------------------

def generate_markdown_report(result, output_path):
    """Generate a readable Markdown report from query results."""

    output_path.parent.mkdir(parents=True, exist_ok=True)

    generated_at = datetime.now(timezone.utc).strftime(
        "%Y-%m-%d %H:%M:%S UTC"
    )

    lines = [
        f"# SQL Execution Report — Module {result['module_id']}",
        "",
        f"**Module:** {result['module_name']}",
        f"**SQL file:** `{result['sql_file']}`",
        f"**Generated:** {generated_at}",
        f"**Rows returned:** {result['row_count']}",
        (
            "**Execution time:** "
            f"{result['execution_time_seconds']:.6f} seconds"
        ),
        "",
        "## Query Results",
        "",
    ]

    columns = result["columns"]
    rows = result["rows"]

    if not columns:
        lines.append("The query returned no columns.")

    elif not rows:
        lines.append("The query returned zero rows.")

    else:
        # Table header
        lines.append(
            "| " + " | ".join(
                escape_markdown(column)
                for column in columns
            ) + " |"
        )

        # Markdown separator
        lines.append(
            "| " + " | ".join("---" for _ in columns) + " |"
        )

        # Table data
        for row in rows:
            lines.append(
                "| " + " | ".join(
                    escape_markdown(value)
                    for value in row
                ) + " |"
            )

    lines.extend([
        "",
        "---",
        "",
        "*Generated automatically by the Enterprise SQL Analytics reporting engine.*",
        "",
    ])

    output_path.write_text(
        "\n".join(lines),
        encoding="utf-8",
    )


# ------------------------------------------------------------
# Export both formats
# ------------------------------------------------------------

def export_result(result):
    """Save one query result as CSV and Markdown."""

    module_folder = (
        REPORTS_ROOT / f"module_{result['module_id']}"
    )

    sql_filename = Path(result["sql_file"]).stem

    csv_path = module_folder / f"{sql_filename}.csv"
    markdown_path = module_folder / f"{sql_filename}.md"

    export_csv(result, csv_path)

    generate_markdown_report(
        result,
        markdown_path,
    )

    return {
        "csv_path": csv_path,
        "markdown_path": markdown_path,
    }