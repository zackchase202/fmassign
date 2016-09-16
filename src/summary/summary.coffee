### 
StepFour of Sample Workflow
 Requirements:
 	Confirmation
 	Once the entire form is submitted to the server render a confirmation page which shows all the info submitted on prior pages
 	The page should be formatted as an order form, with each uploaded creative appearing as a line item.
 	The state should be retrieved from the server even though this is a single page react app which will have most of the state locally
###

React = require 'react'
ReactDOM = require 'react-dom'
{div,h3,p,form,input,label,a} = React.DOM

GetSummaryData = require '../functions/get-summary-data.js'

SummaryData = require './summary-data.js'

Summary = React.createClass

	getInitialState: ->
		{
			data: false
		}

	handleDone: ->
		@props.changeStep(0)

	handleBack: ->
		@props.changeStep(4)

	componentDidMount: ->
		_this = @
		GetSummaryData(@props.data).then (rsp) ->
			_this.setState { data: rsp }, () ->
				console.log _this.state.data
				_this.forceUpdate()

	render: ->
		div
			className: 'container'
			id: 'summary-container'
			div
				className: 'row'
				div
					className: 'col-sm-2'
					a
						className: 'btn btn-primary'
						onClick: this.handleBack
						'Back'
				div
					className: 'col-sm-8 summary-main-title'
					h3 {},
						"Summary"
					p {},
						"A summary of your order is below. Once you made sure everything is correct, confirm your order at the bottom."
				div
					className: 'col-sm-2'
			React.createElement SummaryData, {data: @state.data}
			a
				className: 'btn btn-primary'
				onClick: this.handleDone
				'Done'


module.exports = Summary