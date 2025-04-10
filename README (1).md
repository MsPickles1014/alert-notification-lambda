# 📣 Alert Notification Service (Slack + AWS Lambda + SNS)

This project sends alert messages to a Slack channel using AWS SNS and a Lambda function. Messages are triggered via SNS and forwarded to Slack using an incoming webhook.

---

## 🚀 Features

- Trigger alerts from AWS SNS
- Automatically forward alerts to Slack
- Serverless deployment to AWS
- Supports custom alert messages from CLI

---

## 📁 Project Structure

```
.
├── handler.js           # Lambda handler function
├── serverless.yml       # Serverless Framework config
├── .env                 # Contains your Slack webhook URL
├── send-alert.sh        # Shell script to manually trigger a test alert
└── README.md
```

---

## ⚙️ Prerequisites

- Node.js + npm
- AWS account with permissions for SNS and Lambda
- Slack account & workspace
- [Serverless Framework](https://www.serverless.com/framework/docs/getting-started) installed globally:
  ```bash
  npm install -g serverless
  ```

---

## 🛠 Setup

### 1. Clone this repo and install dependencies

```bash
git clone https://github.com/your-username/alert-notification-lambda.git
cd alert-notification-lambda
npm install
```

### 2. Create a `.env` file with your Slack webhook

```
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/XXX/YYY/ZZZ
```

> [Create your webhook here](https://api.slack.com/messaging/webhooks)

### 3. Deploy to AWS

```bash
sls deploy
```

This sets up:
- An SNS topic (`ALERT_NOTIFICATIONS`)
- A Lambda function that listens for SNS messages and posts to Slack

---

## 💡 Usage

### ✅ Publish a test alert to SNS

You can use the AWS CLI or Console:

```bash
aws sns publish   --topic-arn arn:aws:sns:us-east-1:YOUR_ACCOUNT_ID:ALERT_NOTIFICATIONS   --message "🔥 Critical server memory alert!"
```

### ✅ Or run locally with:

```bash
./send-alert.sh "🚨 High CPU detected on server!"
```

> If no message is passed, it sends a default alert with timestamp.

---

## 🧪 Example Slack Output

> 🔔 High CPU detected on server!  
> _(posted by your Lambda or CLI script)_

---

## 📌 Notes

- Make sure the webhook URL is correct and the Slack App has access to the channel.
- You can enhance this with multiple severity levels, rich formatting, or Discord support.

---

## 📜 License

MIT

