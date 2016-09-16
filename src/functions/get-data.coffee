$ = require 'jquery'

getData = (data) ->
	route = '/get-data/'
	$.ajax
	  type: 'POST'
	  contentType: 'application/json'
	  url: route
	  data: JSON.stringify {key: data}
	  dataType: 'json'
	  success: (response) ->
	    return response
	  error: (error) ->
	    return error

module.exports = getData