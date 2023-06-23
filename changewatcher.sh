#!/bin/bash

# Указываем путь к директории, за которой нужно следить
watch_dir="/path/to/watch/directory"

# Указываем webhook URL для Slack
slack_webhook_url="https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXX"

# Запускаем бесконечный цикл для мониторинга изменений в директории
while true; do
    # Ожидаем, пока произойдет изменение в директории
    change=$(inotifywait -r -e modify,create,delete $watch_dir)

    # Отправляем уведомление в Slack
    curl -X POST --data-urlencode "payload={\"text\": \"Файл был изменен: ${change}\"}" $slack_webhook_url
done
