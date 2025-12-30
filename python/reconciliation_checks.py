import pandas as pd
from pathlib import Path

data_dir = Path("data")
output_dir = Path("outputs")
output_dir.mkdir(exist_ok=True)

system_a = pd.read_csv(data_dir / "system_a.csv")
system_b = pd.read_csv(data_dir / "system_b.csv")

missing_in_b = system_a[~system_a["transaction_id"].isin(system_b["transaction_id"])]
missing_in_a = system_b[~system_b["transaction_id"].isin(system_a["transaction_id"])]

merged = system_a.merge(
    system_b,
    on="transaction_id",
    how="inner",
    suffixes=("_a", "_b")
)

mismatched_amounts = merged[merged["toll_amount_a"] != merged["toll_amount_b"]]

duplicate_in_b = system_b[system_b.duplicated(subset=["transaction_id"], keep=False)]

missing_in_b.to_csv(output_dir / "missing_in_system_b.csv", index=False)
missing_in_a.to_csv(output_dir / "missing_in_system_a.csv", index=False)
mismatched_amounts.to_csv(output_dir / "mismatched_amounts.csv", index=False)
duplicate_in_b.to_csv(output_dir / "duplicate_transactions_system_b.csv", index=False)

print("Reconciliation checks completed.")
