express = require("express")
request = require("request")
bodyParser = require("body-parser")
app = express()

# code for forwarding the sms in the right
# format for our mongoose server
forwardMessage = (req, res) ->
  message = req.body.Body
  url = "#{process.env.FORWARD_URL}?#{process.env.FORWARD_ATTR}=#{message}"
  request.post(url)
  res.sendStatus 200

# setter for our url to forward an sms to
setUrl = (req, res) ->
  process.env.FORWARD_URL = req.body.forwardUrl
  process.env.FORWARD_ATTR = req.body.forwardAttr
  res.sendStatus 200

# this parses the body of the post request
app.use bodyParser.urlencoded(extended: false)

# this is the endpoint Twilio will hit
app.post "/message", forwardMessage

# this is where we register the embedded server's
# localtunnel url and the attribute we are posting 
# to change
app.post "/url", setUrl

# this allows for local port of 8080 and 
# for a hosting service to inject their port
app.listen process.env.PORT or 8080