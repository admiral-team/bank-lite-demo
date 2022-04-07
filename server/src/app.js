var os = require('os');
var path = require('path');
var ngrok = require('ngrok');
var logger = require('morgan');
var express = require('express');
var cookieParser = require('cookie-parser');

// Create app
var app = express();
var port = 8080;
var app_folder = path.join(__dirname, '../../build/web');

// User helpers
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(app_folder));

// Listen request
app.listen(port, async function () {
    //const url = await ngrok.connect(port);
    //console.log(`Ngrok public-url ${url}`)
    console.log('Server start ' + os.hostname + ":" + port);
});

// Base endpoint
app.get('/start', (req, res) => {
    res.send('Server working!')
});