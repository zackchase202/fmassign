$ = require 'jquery'

GetSummaryData = (data) ->
	route = '/summary-data'
	$.ajax
	  type: 'POST'
	  contentType: 'application/json'
	  url: route
	  data: JSON.stringify data
	  dataType: 'json'
	  success: (response) ->
	    return response
	  error: (error) ->
	    return error

module.exports = GetSummaryData