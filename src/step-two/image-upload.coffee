React = require 'react'
ReactDOM = require 'react-dom'
$ = require 'jquery'
{div,h3,p,form,input,label,a,span} = React.DOM

ImageView = require './image-view.js'

UploadImage = require '../functions/upload-image.js'
RemoveImage = require '../functions/remove-img.js'

ErrorAlert = React.createClass

	render: ->
		div
			className: 'alert alert-danger image-input-alert'
			role: 'alert'
			p
				className: 'text-input-alert-text'
				"You must upload at least 1 image"

ImageInput = React.createClass

	handleUpload: ->
		@props.submitImage()

	render: ->
		console.log @props.image_amount
		if @props.image_amount != 5
			div
				className: 'upload-image-input-container btn btn-primary'
				"Add Image"
					input
						type: 'file'
						onChange: @handleUpload
						id: @props.id
		else
			div
				className: 'upload-image-input-container btn btn-primary disabled'
				"Add Image"

ImageUpload = React.createClass

	getInitialState: ->
		{
			image_amount: ['z'],
			images: [],
			error: false
		}

	componentDidMount: ->
		if @props.data
			@setState {images: @props.data.images}

	deleteImage: (img) ->
		_this = @
		RemoveImage(img).then (rsp) ->
			console.log rsp
			rm = _this.state.images.indexOf(img)
			_this.state.images.splice(rm,1)
			_this.forceUpdate()

	submitImage: ->
		@setState {error: false}
		_this = @
		UploadImage().then (rsp) ->
			_this.state.images.push rsp
			$('#image-input').val('')
			_this.forceUpdate()

	nextStep: ->
		if @state.images.length == 0
			@setState {error: true}
			return
		@props.changeStep(@state.images,@state.images.length)
	
	render: ->
		div
			className: 'container'
			if @state.error
				React.createElement ErrorAlert
			div
				className: 'row'
				div
					className: 'col-sm-6 upload-btn-container'
					React.createElement ImageInput, {id: 'image-input', submitImage: @submitImage, image_amount: @state.images.length}
				div
					className: 'col-sm-6'
					p 
						String @state.images.length + "/5"

			React.createElement ImageView, {images: @state.images, deleteImage: @deleteImage}

			div
				className: 'container'
				a
					className: 'btn btn-primary image-submit-btn'
					onClick: @nextStep
					'Submit Images'



module.exports = ImageUpload



