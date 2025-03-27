#  (alert message)
# source .env
# curl -X POST -H 'Content-type: application/json' \
#   --data '{"text":"🔔 Alert from send-alert.sh!"}' \
#   "$SLACK_WEBHOOK_URL"

#  (timestamped message)
# source .env

# curl -X POST -H "Content-type: application/json" \
#   --data "{\"text\":\"🔔 Alert from Noela send-alert.sh at $(date)!\"}" \
#   "$SLACK_WEBHOOK_URL"

#!/bin/bash
source .env

# Use all arguments as the message or fall back to default
MESSAGE="${*:-🔔 Default alert from send-alert.sh at $(date)!}"


curl -X POST -H "Content-type: application/json" \
  --data "{\"text\":\"$MESSAGE\"}" \
  "$SLACK_WEBHOOK_URL"

