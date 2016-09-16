### 
StepThree of Sample Workflow
 Requirements:
 	Set target bids
		For each image uploaded display a small thumbnail of the image
		require a user to enter a CPM bid for each of the images
		require a user to enter a max impressions for this line item.
		extra credit: display the dimensions of the image right next to the thumbnail
		extra extra credit: dynamicaly resize the image on the server for a smaller thumbnail
###

React = require 'react'
ReactDOM = require 'react-dom'
{div,h3,p,form,input,label,a} = React.DOM

AdTargetForm = require './ad-target-form.js'

Submit = require('../functions/submit.js').StepThree

StepThree = React.createClass

	handleBack: ->
		@props.changeStep(2)

	submitData: (step, formValues) ->
		_this = @
		Submit(formValues).then (rsp) ->
			_this.props.updateData(rsp, 3)
			_this.props.changeStep(step)
	
	render: ->
		div
			className: 'container'
			id: 'step-three-container'
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
						"Bid and Max Impressions"
					p {},
						"Please set your CPM and Max Impressions for each ad."
				div
					className: 'col-sm-2'
			React.createElement AdTargetForm, {changeStep: @submitData, data: @props.data}



module.exports = StepThree




