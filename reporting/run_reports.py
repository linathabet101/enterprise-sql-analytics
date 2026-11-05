import argparse
import csv
from datetime import datetime, timezone
from pathlib import Path

from reporting.engine.executor import (
    load_manifest,
    execute_manifest_entry,
)
from reporting.engine.exporter import export_result


# ------------------------------------------------------------
# Project paths
# ------------------------------------------------------------

PROJECT_ROOT = Path(__file__).resolve().parents[1]
REPORTS_ROOT = PROJECT_ROOT / "reports"
LOG_PATH = REPORTS_ROOT / "execution_log.csv"


# ------------------------------------------------------------
# Execution logging
# ------------------------------------------------------------

def log_execution(entry, status, row_count="", error=""):
    """Record the outcome of each SQL execution."""

    LOG_PATH.parent.mkdir(parents=True, exist_ok=True)

    file_exists = LOG_PATH.exists()

    with LOG_PATH.open(
        mode="a",
        encoding="utf-8-sig",
        newline="",
    ) as file:

        writer = csv.writer(file)

        if not file_exists:
            writer.writerow([
                "execution_timestamp_utc",
                "module_id",
                "sql_file",
                "status",
                "row_count",
                "error",
            ])

        writer.writerow([
            datetime.now(timezone.utc).isoformat(),
            entry.get("module_id", ""),
            entry.get("sql_file", ""),
            status,
            row_count,
            error,
        ])


# ------------------------------------------------------------
# Reporting pipeline
# ------------------------------------------------------------

def run_reports(module_id=None):
    """Execute approved SQL queries and export their results."""

    manifest = load_manifest()

    if module_id:
        manifest = [
            entry
            for entry in manifest
            if entry["module_id"] == module_id
        ]

    if not manifest:
        print("No matching SQL scripts found in the manifest.")
        return 1

    successful = 0
    failed = 0
    skipped = 0

    print("=" * 65)
    print("ENTERPRISE SQL ANALYTICS — REPORTING ENGINE")
    print("=" * 65)

    print(f"Scripts selected: {len(manifest)}")
    print()

    for entry in manifest:

        sql_file = entry.get("sql_file", "")
        execution_mode = entry.get("execution_mode", "")

        print(f"Module {entry['module_id']} | {sql_file}")

        if execution_mode != "read_only":
            print("  SKIPPED: Script is not approved for execution.")
            skipped += 1
            continue

        try:
            result = execute_manifest_entry(entry)

            exported_files = export_result(result)

            log_execution(
                entry,
                status="SUCCESS",
                row_count=result["row_count"],
            )

            successful += 1

            print("  SUCCESS")
            print(f"  Rows returned: {result['row_count']}")
            print(
                "  Execution time: "
                f"{result['execution_time_seconds']:.6f} seconds"
            )
            print(f"  CSV: {exported_files['csv_path']}")
            print(f"  Markdown: {exported_files['markdown_path']}")

        except Exception as error:

            failed += 1

            log_execution(
                entry,
                status="FAILED",
                error=str(error),
            )

            print(f"  FAILED: {error}")

        print()

    # --------------------------------------------------------
    # Final summary
    # --------------------------------------------------------

    print("=" * 65)
    print("EXECUTION SUMMARY")
    print("=" * 65)

    print(f"Successful: {successful}")
    print(f"Failed:     {failed}")
    print(f"Skipped:    {skipped}")
    print(f"Total:      {len(manifest)}")
    print()
    print(f"Execution log: {LOG_PATH}")
    print(f"Reports directory: {REPORTS_ROOT}")

    return 1 if failed else 0


# ------------------------------------------------------------
# Command-line interface
# ------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        description=(
            "Execute approved read-only SQL queries "
            "and generate reproducible reports."
        )
    )

    selection = parser.add_mutually_exclusive_group(required=True)

    selection.add_argument(
        "--all",
        action="store_true",
        help="Execute all approved SQL scripts.",
    )

    selection.add_argument(
        "--module",
        type=str,
        help="Execute approved SQL scripts for one module, e.g. 01.",
    )

    args = parser.parse_args()

    module_id = args.module if args.module else None

    raise SystemExit(run_reports(module_id))


if __name__ == "__main__":
    main()