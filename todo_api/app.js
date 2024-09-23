const express = require('express');
const connectDB = require("./config/db");
const todoRoutes = require('./routes/todoRoutes');
require("dotenv").config();
connectDB();

const app = express();

app.use(express.json());

app.use('/api/todos', todoRoutes);

app.listen(5000)
