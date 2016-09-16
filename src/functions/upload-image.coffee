$ = require 'jquery'

ajax = (formData) ->
	$.ajax {
		url: '/upload-image'
		type: 'POST'
		success: (rsp) ->
			return rsp
		error: ->
			return 'Something went wrong!'
		data: formData
		cache: false
		contentType: false
		processData: false
	}, 'text'

UploadImage = () ->
	return new Promise (resolve, reject) ->
		comp = $('#image-input')
		file = comp[0].files[0]
		name = file.name;
		size = file.size;
		type = file.type;

		if file.name.length < 1
			reject 'no file name'
		else if file.size > 100000
			reject 'file size is too big'
		else if file.type != 'image/png' && file.type != 'image/jpg' && file.type != 'image/gif' && file.type != 'image/jpeg'
			reject 'not an image'
		else
			formData = new FormData()
			formData.append( 'file', file )
			ajax(formData).done (m) ->
				resolve m
			

module.exports = UploadImage