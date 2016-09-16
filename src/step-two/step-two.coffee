### 
StepTwo of Sample Workflow
 Requirements:
 	Upload Creative
	 	Allow uploading multiple images
	 	one image at a time is fine
	 	user should have the option to upload up to 5 images
	 	user should be able to delete an image and upload a different one before proceeding
	 	uploaded images can just be stored in the hash
	 	Extra credit: Show a progress bar when uploading images
###

React = require 'react'
ReactDOM = require 'react-dom'
{div,h3,p,form,input,label,a} = React.DOM

ImageUpload = require './image-upload.js'


StepTwo = React.createClass
	
	changeStep: (data,image_amount) ->
		new_data = {
			images: data,
			image_amount: image_amount
		}
		@props.updateData(new_data,2)
		@props.changeStep(3)

	handleBack: ->
		@props.changeStep(1)

	render: ->
		div
			className: 'container'
			id: 'step-two-container'
			div
				className: 'row'
				div
					className: 'col-sm-2'
					a
						className: 'btn btn-primary'
						onClick: this.handleBack
						'Back'
				div
					className: 'col-sm-8'
					h3 {},
						"Image Upload"
					p {},
						"Upload the images for your ad here. You may upload up to five images"
				div
					className: 'col-sm-2'
			React.createElement ImageUpload, {changeStep: @changeStep}
			



module.exports = StepTwo