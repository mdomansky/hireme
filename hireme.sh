#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/text.sh"

# Перебираем каждую координату
for coord in "${COMMITS[@]}"; do
  WEEK=${coord%%:*}
  DAY=${coord##*:}

  # Найдём первое воскресенье года и прибавим WEEK * 7 + DAY дней
  START_DATE="2025-07-06" #sunday
  COMMIT_DATE=$(date -d "$START_DATE + $((WEEK * 7 + DAY)) days" +%Y-%m-%d)

  # Проверяем: если сегодня эта дата — делаем коммиты
  TODAY=$(date +%Y-%m-%d)

  if [[ "$COMMIT_DATE" == "$TODAY" ]]; then
      git pull origin main
    for i in {1..25}; do
      echo "$RANDOM" > random.txt
      git add random.txt
      git commit -m "hire me"
    done
    git push --force
    break
  fi
done
