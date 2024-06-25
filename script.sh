#!/bin/bash

TOKEN="7462221057:AAFXxdxxP9h_cdudtwREq9WdVlS7pBdTkYw"
CHAT_ID="7299407396"
URL="https://backdor.pages.dev/index/index.html"
SEARCH_TEXT="16341"
TEMP_FILE="/tmp/website_content.txt"

send_telegram_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d chat_id="$CHAT_ID" \
        -d text="$message" \
        -d parse_mode="HTML" > /dev/null
}

curl -s "$URL" > "$TEMP_FILE"

if grep -q "$SEARCH_TEXT" "$TEMP_FILE"; then
    DATE="$(date +'%d.%b.%Y -- %H:%M')"
    MESSAGE="<b>Om Shingare</b> you tool is working fine, current time is: <b>$DATE</b>"
    send_telegram_message "$MESSAGE"
fi
rm "$TEMP_FILE"
exit 0
