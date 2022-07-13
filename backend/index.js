const express=require('express');
const http = require('http');
const bodyParser = require("body-parser");
const mongoose = require("mongoose");
const cors = require('cors');
const helmet = require('helmet');
var useragent = require('express-useragent');
var path = require('path');

//route intialisation

var app=express();
app.use(cors());
app.use(helmet());
app.options('*',cors());
app.use(useragent.express());

var server= http.createServer(app);

const port=process.env.PORT || 8080;

mongoose.Promise = global.Promise;

mongoose.connect('')