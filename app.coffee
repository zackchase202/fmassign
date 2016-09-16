# use express for server/middleware
express = require 'express'
bodyParser = require 'body-parser'
multer  = require 'multer'
fs = require 'fs'
upload = multer { dest: 'public/uploads/' }

secret_key = 'this is a really really secret key, oooohhhhhh'
 
encryptor = require('simple-encryptor')(secret_key)

# create new instance of express
app = express()

# Set Template Engine
app.use express.static(__dirname + '/public')
app.set 'view engine', 'pug'
app.use bodyParser.urlencoded({ extended: true })
app.use bodyParser.json()


# Render Pug Template for '/' GET
app.get '/', (req, res) ->
  res.render 'index.pug'

app.post '/step-one', (req,res) ->
	res.send encryptor.encrypt(req.body)

app.post '/step-three', (req,res) ->
	console.log req.body
	res.send encryptor.encrypt(req.body)

app.post '/step-four', (req,res) ->
	console.log req.body
	res.send encryptor.encrypt(req.body)

app.post '/upload-image', upload.single("file"), (req,res) ->
	res.send String(req.file.path.replace('public/',''))

app.get '/remove-image/:id', (req,res) ->
	fs.unlink 'public/uploads/' + req.params.id, (err) ->
	  if err
	    res.send err
	  res.send 'File deleted successfully!'

app.post '/summary-data', (req,res) ->
	summary_data = req.body
	new_summary_data = {}
	new_summary_data.stepOne = encryptor.decrypt summary_data['stepOne']
	new_summary_data.stepTwo = summary_data['stepTwo']
	new_summary_data.stepThree = encryptor.decrypt summary_data['stepThree']
	new_summary_data.stepFour = encryptor.decrypt summary_data['stepFour']
	console.log new_summary_data
	res.send new_summary_data


# run the application on port 9000
app.listen 3000
console.log "Express server listening on port 3000"











