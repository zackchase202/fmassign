$ = require 'jquery'

exports = module.exports = {}

exports.StepOne = (data) ->
	route = '/step-one'
	$.ajax
	  type: 'POST'
	  contentType: 'application/json'
	  url: route
	  data: JSON.stringify data
	  dataType: 'text'
	  success: (response) ->
	    return response
	  error: (error) ->
	    return error

exports.StepThree = (data) ->
	route = '/step-three'
	$.ajax
	  type: 'POST'
	  contentType: 'application/json'
	  url: route
	  data: JSON.stringify data
	  dataType: 'text'
	  success: (response) ->
	    return response
	  error: (error) ->
	    return error

exports.StepFour = (data) ->
	route = '/step-four'
	$.ajax
	  type: 'POST'
	  contentType: 'application/json'
	  url: route
	  data: JSON.stringify data
	  dataType: 'text'
	  success: (response) ->
	    return response
	  error: (error) ->
	    return error