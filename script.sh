#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Multi Search
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🛩
# @raycast.packageName Search Google Drive & Teacme Biz
# @raycast.argument1 { "type": "text", "placeholder": "search word"}

# Google Drive でキーワードを検索する
open "https://drive.google.com/drive/search?q=$1"

# Teachme Biz を一度開き、グループIDを取得する
tmb_url="https://teachme.jp/"
open "$tmb_url"
sleep 0.2
current_url=$(osascript -e 'tell application "Google Chrome" to get URL of active tab of front window')
group_id=$(echo $current_url | awk -F'/' '{print $4}')
osascript -e 'tell application "Google Chrome" to close active tab of front window'

# Teachme Biz でキーワードを検索する
open "$tmb_url$group_id/manuals?sortKey=score&displayType=published&keyword=$1"
