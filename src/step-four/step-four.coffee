### 
StepFour of Sample Workflow
 Requirements:
 	Payment Information
	 	Credit Card Number
	 	Expiration Date
	 	CVC
	 	Name
###

React = require 'react'
ReactDOM = require 'react-dom'
{div,h3,p,form,input,label,a} = React.DOM

Input = require '../global/input.js'

getValues = require '../functions/form-values.js'
Submit = require('../functions/submit.js').StepFour

ErrorAlert = React.createClass

	render: ->
		div
			className: 'alert alert-danger text-input-alert'
			role: 'alert'
			p
				className: 'text-input-alert-text'
				"Please enter a " + @props.text

PaymentForm = React.createClass

	render: ->
		div
			className: 'container'
			form
				div
					className: 'form-group billing-form-container'
					id: 'billing-form-container'
					React.createElement Input, { id: 'credit-card', text: 'Card Number' }
					if @props.error == 'credit-card'
						React.createElement ErrorAlert, {text: 'Credit Card Number'}
					React.createElement Input, { id: 'exp-date', text: 'Expiration Date' }
					if @props.error == 'exp-date'
						React.createElement ErrorAlert, {text: 'Expiration Date'}
					React.createElement Input, { id: 'cvc', text: 'CVC' }
					if @props.error == 'cvc'
						React.createElement ErrorAlert, {text: 'CVC Number'}
					React.createElement Input, { id: 'card-name', text: 'Name on Card' }
					if @props.error == 'card-name'
						React.createElement ErrorAlert, {text: 'Card Name'}


StepFour = React.createClass

	getInitialState: ->
		{
			error: false
		}

	handleSubmit: ->
		console.log 'submitting payment info'
		keys = ['credit-card', 'exp-date', 'cvc', 'card-name']
		_this = @
		getValues(keys).then ((resp) ->

			Submit(resp).then (rsp) ->
				_this.props.updateData(rsp, 4)
				_this.props.changeStep(5)

			), (err) ->
				console.log err
				@setState {error: err}

	handleBack: ->
		@props.changeStep(3)

	render: ->
		div
			className: 'container'
			id: 'step-four-container'
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
						"Billing Information"
					p {},
						"Please enter your billing info below"
				div
					className: 'col-sm-2'
			React.createElement PaymentForm, {error: @state.error}
			a
				className: 'btn btn-primary'
				onClick: this.handleSubmit
				'Submit Payment Information'



module.exports = StepFour