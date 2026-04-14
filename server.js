// SmartGlass Accounts Backend
// Step 1: Install dependencies before running:
// npm init -y
// npm install express cors

const express = require('express');
const cors = require('cors');

const app = express();
const PORT = 5000;

app.use(cors());
app.use(express.json());

// Temporary in-memory storage (later replace with MySQL)
let products = [
    { id: 1, name: "Sample Glass", quantity: 100, price: 500 }
];

// Get all products
app.get('/api/products', (req, res) => {
    res.json(products);
});

// Add new product
app.post('/api/products', (req, res) => {
    const { name, quantity, price } = req.body;

    if (!name || !quantity || !price) {
        return res.status(400).json({ message: "All fields are required" });
    }

    const newProduct = {
        id: products.length + 1,
        name,
        quantity,
        price
    };

    products.push(newProduct);
    res.status(201).json(newProduct);
});

// Start server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
