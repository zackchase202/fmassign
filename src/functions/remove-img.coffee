$ = require 'jquery'

RemoveImage = (img) ->
	return new Promise (resolve,reject) ->
		route = '/remove-image/' + img.replace('uploads/','')
		$.get route, (data) ->
		  resolve data



module.exports = RemoveImage