express = require("express")
bodyParser = require("body-parser")
app = express()

# code for forwarding the sms in the right
# format for our mongoose server
forwardMessage = (req, res) ->
  message = req.body.Body
  console.log message
  return


# this parses the body of the post request
app.use bodyParser.urlencoded(extended: false)

# this is the endpoint Twilio will hit
app.post "/message", forwardMessage

# this allows for local port of 8080 and 
# for a hosting service to inject their port
app.listen process.env.PORT or 8080