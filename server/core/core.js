const express = require("express");
const multer = require("multer");
const helmet = require("helmet");
const morgan =require("morgan");
require("../config/db")();


const app = express();







const server = app;

module.exports = {server , helmet , morgan};
