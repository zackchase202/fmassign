### 
StepOne of Sample Workflow
 Requirements:
 	Form with the Follow information:
	    Company Info
			Name, Address, City, State, Postal Code
		Contact Info
			Last Name
			First Name
			Email Address
			Phone number
		Total Budget
User Enters Information, Submits form to server, Moves to StepTwo
###

React = require 'react'
ReactDOM = require 'react-dom'
$ = require 'jquery'
{div,h3,p,form,input,label,a} = React.DOM

Input = require '../global/input.js'
CurrencyInput = require '../global/currency-input.js'

getValues = require '../functions/form-values.js'
getData = require '../functions/get-data.js'
Submit = require('../functions/submit.js').StepOne

ErrorAlert = React.createClass

	render: ->
		div
			className: 'alert alert-danger text-input-alert'
			role: 'alert'
			p
				className: 'text-input-alert-text'
				"Please enter a " + @props.text

TotalBudgetErrorAlert = React.createClass

	render: ->
		div
			className: 'alert alert-danger total-budget-input-alert'
			role: 'alert'
			p
				className: 'text-input-alert-text'
				"Please enter a " + @props.text

Budget = React.createClass

	render: ->
		div
			className: 'container'
			React.createElement CurrencyInput, { name: 'total-budget', label: "Total Budget"}
			if @props.error == 'total-budget'
						React.createElement TotalBudgetErrorAlert, {text: 'Total Budget'}

ContactForm = React.createClass

	render: ->
		div
			className: 'col-sm-6'
			form
				div
					className: 'form-group'
					React.createElement Input, { id: 'contact-firstname', text: 'First Name' }
					if @props.error == 'contact-firstname'
						React.createElement ErrorAlert, {text: 'First Name'}
					React.createElement Input, { id: 'contact-lastname', text: 'Last Name' }
					if @props.error == 'contact-lastname'
						React.createElement ErrorAlert, {text: 'Last Name'}
					React.createElement Input, { id: 'contact-email', text: 'Email' }
					if @props.error == 'contact-email'
						React.createElement ErrorAlert, {text: 'Email'}
					React.createElement Input, { id: 'contact-phone', text: 'Phone Number' }
					if @props.error == 'contact-phone'
						React.createElement ErrorAlert, {text: 'Phone'}

CompanyForm = React.createClass

	render: ->
		div
			className: 'col-sm-6'
			form
				div
					className: 'form-group'
					React.createElement Input, { id: 'company-name', text: 'Company Name' }
					if @props.error == 'company-name'
						React.createElement ErrorAlert, {text: 'Company Name'}
					React.createElement Input, { id: 'company-address', text: 'Company Address' }
					if @props.error == 'company-address'
						React.createElement ErrorAlert, {text: 'Company Address'}
					React.createElement Input, { id: 'company-city', text: 'Company City' }
					if @props.error == 'company-city'
						React.createElement ErrorAlert, {text: 'Company City'}
					React.createElement Input, { id: 'company-state', text: 'Company State' }
					if @props.error == 'company-state'
						React.createElement ErrorAlert, {text: 'Company State'}
					React.createElement Input, { id: 'company-zip', text: 'Company Postal Code' }
					if @props.error == 'company-zip'
						React.createElement ErrorAlert, {text: 'Company Postal Code'}


StepOne = React.createClass

	getInitialState: ->
		{
			error_key: false
		}

	componentDidMount: ->
		if @props.data 
			getData(@props.data).then ((rsp) ->
				$('#company-name').val(rsp['company-name'])
				$('#company-address').val(rsp['company-address'])
				$('#company-city').val(rsp['company-city'])
				$('#company-state').val(rsp['company-state'])
				$('#company-zip').val(rsp['company-zip'])
				$('#contact-firstname').val(rsp['contact-firstname'])
				$('#contact-lastname').val(rsp['contact-lastname'])
				$('#contact-email').val(rsp['contact-email'])
				$('#contact-phone').val(rsp['contact-phone'])
				$('#total-budget').val(rsp['total-budget'])
				), (err) ->
					console.log err

	handleSubmit: ->
		keys = [
			'total-budget',
			'company-name',
			'company-address',
			'company-city',
			'company-state',
			'company-zip',
			'contact-firstname',
			'contact-lastname',
			'contact-email',
			'contact-phone'
		]
		_this = @
		getValues(keys).then ((resp) ->
			Submit(resp).then (rsp) ->
				_this.props.updateData(rsp, 1)
				_this.props.changeStep(2)
			), (err)->
				console.log 'error'
				_this.setState { error_key: err }	

	handleBack: ->
		@props.changeStep(0)

	render: ->
		div
			className: 'container'
			id: 'step-one-container'
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
						"Contact Information"
					p {},
						"Please enter your company and contact information below. You will also need to enter the budget for your campaign."
				div
					className: 'col-sm-2'
			React.createElement Budget, {error: @state.error_key}
			div
				className: 'row'
				React.createElement CompanyForm, {error: @state.error_key}
				React.createElement ContactForm, {error: @state.error_key}
			div
				className: 'container'
				a
					className: 'btn btn-primary'
					onClick: this.handleSubmit
					'Submit and Go to Step Two'



module.exports = StepOne



