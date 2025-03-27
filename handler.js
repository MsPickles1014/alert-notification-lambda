const https = require('https');

module.exports.alertHandler = async (event) => {
  const message = event.Records[0].Sns.Message;

  const webhookUrl = process.env.SLACK_WEBHOOK_URL;
  const data = JSON.stringify({ text: `🔔 ALERT: ${message}` });

  const options = new URL(webhookUrl);

  return new Promise((resolve, reject) => {
    const req = https.request({
      hostname: options.hostname,
      path: options.pathname,
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': data.length
      }
    }, (res) => {
      res.on('data', () => {});
      res.on('end', () => resolve());
    });

    req.on('error', reject);
    req.write(data);
    req.end();
  });
};
