var express = require('express');
var bodyParser = require('body-parser');
var app = express();

// code for forwarding the sms in the right
// format for our mongoose server
forwardMessage = function(req, res) {
  var message = req.body.Body;
  console.log(message);
}

// this parses the body of the post request
app.use(bodyParser.urlencoded({ extended: false }));

// this is the endpoint Twilio will hit
app.post('/message', forwardMessage);

// this allows for local port of 8080 and 
// for a hosting service to inject their port
app.listen(process.env.PORT || 8080);

