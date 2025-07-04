#!/bin/bash

# Matrix size: 7 rows (Sun–Sat), N columns (weeks)
WEEKS=52

# Initialize an empty matrix with 7 rows and WEEKS columns
declare -A MATRIX

source ./text.sh

# Fill matrix with empty cells (.)
for ((week=0; week<WEEKS; week++)); do
  for ((day=0; day<7; day++)); do
    MATRIX["$day,$week"]="."
  done
done

# Mark active cells (with "#")
for cell in "${COMMITS[@]}"; do
  week=${cell%%:*}
  day=${cell##*:}
  MATRIX["$day,$week"]="#"
done

# Print matrix
echo "GitHub-style contribution matrix:"
echo "(Cols = weeks →, Rows = days ↓)"
for ((day=0; day<7; day++)); do
  for ((week=0; week<WEEKS; week++)); do
    printf "%s " "${MATRIX["$day,$week"]}"
  done
  echo
done
