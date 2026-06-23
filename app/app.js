const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send(`
    <h1>🚀 Multi-Cloud Retail Platform</h1>
    <p><strong>Status:</strong> Running Successfully</p>
    <p><strong>Cloud:</strong> Deployed via GitHub Actions + Kubernetes / VM</p>
    <p><strong>Experience Level:</strong> 3+ Years DevOps</p>
    <hr>
    <p>Endpoints: <a href="/health">/health</a> | <a href="/api/orders">/api/orders</a></p>
  `);
});

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'healthy', timestamp: new Date().toISOString() });
});

app.get('/api/orders', (req, res) => {
  res.json([
    { id: 1, item: "Laptop", status: "processed" },
    { id: 2, item: "Mobile", status: "pending" }
  ]);
});

app.listen(PORT, () => {
  console.log(`Retail App running on port ${PORT}`);
});
