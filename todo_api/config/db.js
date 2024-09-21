const mongoose = require("mongoose");

const connectDB = async function () {
  try {
    await mongoose.connect(process.env.DATABASE_URI);
    console.log("Connected to MongoDB");
  } catch {
    console.log("Error connecting to MongoDB");
  }
};

module.exports = connectDB;
