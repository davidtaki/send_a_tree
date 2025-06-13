#!/usr/bin/env bash

# Alapértelmezett könyvtár, ahol a day_* fájlok találhatók historikus egyszeri adatbetöltéshez
RAW_DATA_DIR="/home/davidtaki/raw_data_tree"

# Cél könyvtárak a különböző kimeneti fájloknak
FREE_DIR="${RAW_DATA_DIR}/free_tree"
REG_DIR="${RAW_DATA_DIR}/registration"
PAID_DIR="${RAW_DATA_DIR}/paid_tree"

# A fájlok feldolgozása day_1-től day_159-ig
for i in {1..159}; do
    INPUT_FILE="${RAW_DATA_DIR}/day_$i"
    
    # Ellenőrizzük, hogy az aktuális fájl létezik-e
    if [[ ! -f "$INPUT_FILE" ]]; then
        echo "A $INPUT_FILE fájl nem található, kihagyva."
        continue
    fi

    # Kiválogatjuk a "free" tartalmú sorokat
    grep 'free' "$INPUT_FILE" > "${RAW_DATA_DIR}/free_day_$i"
    # Kiválogatjuk a "registration" tartalmú sorokat
    grep 'registration' "$INPUT_FILE" > "${RAW_DATA_DIR}/reg_day_$i"
    # Kiválogatjuk a "super" tartalmú sorokat
    grep 'super' "$INPUT_FILE" > "${RAW_DATA_DIR}/paid_day_$i"

    # Áthelyezzük a kimeneti fájlokat a megfelelő könyvtárakba
    mv "${RAW_DATA_DIR}/free_day_$i" "$FREE_DIR/"
    mv "${RAW_DATA_DIR}/reg_day_$i" "$REG_DIR/"
    mv "${RAW_DATA_DIR}/paid_day_$i" "$PAID_DIR/"
done

echo "Feldolgozás kész!"
