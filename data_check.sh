#!/usr/bin/env bash


# Alapértelmezett könyvtár, ahol a day_* fájlok találhatók
RAW_DATA_DIR="/home/davidtaki/raw_data_tree"

# Cél könyvtárak a különböző kimeneti fájloknak
FREE_DIR="${RAW_DATA_DIR}/free_tree"
REG_DIR="${RAW_DATA_DIR}/registration"
PAID_DIR="${RAW_DATA_DIR}/paid_tree"

for i in {1..159}; do
    INPUT_FILE="${RAW_DATA_DIR}/day_$i"
    TOTAL=$(wc -l < "$INPUT_FILE")
    FREE_COUNT=$(wc -l < "${FREE_DIR}/free_day_$i")
    PAID_COUNT=$(wc -l < "${PAID_DIR}/paid_day_$i")
    REG_COUNT=$(wc -l < "${REG_DIR}/reg_day_$i")

    if (( FREE_COUNT + PAID_COUNT + REG_COUNT == TOTAL)); then
        echo "$INPUT_FILE fájl szegmentálása sikeres volt"
    else
        echo "ERROR"
    fi
done



