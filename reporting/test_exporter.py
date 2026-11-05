from reporting.engine.exporter import export_result


sample_result = {
    "module_id": "TEST",
    "module_name": "Exporter Verification",
    "sql_file": "test_exporter.sql",
    "columns": [
        "customer_id",
        "customer_name",
        "total_premium",
    ],
    "rows": [
        (1, "Luna Andersson", 1470.50),
        (2, "Kai Tanaka", 1380.00),
        (3, "Elena Petrova", None),
    ],
    "row_count": 3,
    "execution_time_seconds": 0.012345,
}


exported_files = export_result(sample_result)

print("Exporter test successful!")
print(f"CSV: {exported_files['csv_path']}")
print(f"Markdown: {exported_files['markdown_path']}")