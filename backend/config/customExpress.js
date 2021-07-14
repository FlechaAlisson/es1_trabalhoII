const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const consign = require("consign");

module.exports = () => {
  const app = express();

  app.use(express.json());
  app.use(express.urlencoded({ extended: false }));
  app.use(cors());

  consign()
    .include("controller")
    .into(app);

  return app;
};
