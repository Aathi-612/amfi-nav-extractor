#!/bin/bash

# Download the data file
curl -s "https://www.amfiindia.com/spages/NAVAll.txt" -o NAVAll.txt

# Extract Scheme Name and Net Asset Value and save as TSV
awk -F ';' '
    BEGIN { OFS="\t" }
    /^[0-9]/ && NF >= 6 {
        print $4, $5
    }
' NAVAll.txt > nav_data.tsv

echo "✅ Scheme Name & NAV saved in nav_data.tsv"
