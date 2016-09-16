React = require 'react'
ReactDOM = require 'react-dom'
{div,h1,h3,p,a} = React.DOM

RemoveImages = require './functions/remove-img.js'

StepOne = require './step-one/step-one.js'
StepTwo = require './step-two/step-two.js'
StepThree = require './step-three/step-three.js'
StepFour = require './step-four/step-four.js'
Summary = require './summary/summary.js'

GetStarted = React.createClass
	render: ->
		div
			className: 'container'
			id: 'get-started-container'
			h3 {},
				'Start Advertising Today'
			p {},
				'To get started advertising on our site, click the button below'
			a
				className: 'btn btn-primary'
				onClick: this.props.handleClick
				'Get Started'

Page = React.createClass

	getInitialState: ->
		{ 
			screen: 'step-one',
			data: {
				stepOne: false,
				stepTwo: false,
				stepThree: false,
				stepFour: false
			} 
		}

	updateData: (data, step) ->
		switch step
			when 1
				@setState { 
					data: {
						stepOne: data,
						stepTwo: @state.data.stepTwo,
						stepThree: @state.data.stepThree,
						stepFour: @state.data.stepFour
					}  
				}
			when 2
				@setState { 
					data: {
						stepOne: @state.data.stepOne,
						stepTwo: data,
						stepThree: @state.data.stepThree,
						stepFour: @state.data.stepFour
					}  
				}
			when 3
				@setState { 
					data: {
						stepOne: @state.data.stepOne,
						stepTwo: @state.data.stepTwo,
						stepThree: data,
						stepFour: @state.data.stepFour
					}  
				}
			when 4
				@setState { 
					data: {
						stepOne: @state.data.stepOne,
						stepTwo: @state.data.stepTwo,
						stepThree: @state.data.stepThree,
						stepFour: data
					}  
				}

	onGetStartedPress: ->
		this.setState {
			screen: 'step-one'
		}

	changeStep: (step) ->
		console.log 'next step'
		switch step
			when 0
				@setState {screen: 'get-started'}
				@setState { 
					data: {
						stepOne: false,
						stepTwo: false,
						stepThree: false,
						stepFour: false
					}  
				}
			when 1
				@setState {screen: 'step-one'}
			when 2
				@setState {screen: 'step-two'}
			when 3
				@setState {screen: 'step-three'}
			when 4
				@setState {screen: 'step-four'}
			when 5
				@setState {screen: 'summary'}

	render: ->
		switch @state.screen
			when 'get-started'
				local_comp = React.createElement GetStarted, {handleClick: @onGetStartedPress}
			when 'step-one'
				local_comp = React.createElement StepOne, {changeStep: @changeStep, updateData: @updateData, data: @state.data.stepOne}
			when 'step-two'
				local_comp = React.createElement StepTwo, {changeStep: @changeStep, updateData: @updateData, data: @state.data.stepTwo}
			when 'step-three'
				local_comp = React.createElement StepThree, {changeStep: @changeStep, data: @state.data.stepTwo, updateData: @updateData, old_data: @state.data.stepThree}
			when 'step-four'
				local_comp = React.createElement StepFour, {changeStep: @changeStep, updateData: @updateData, data: @state.data.stepFour}
			when 'summary'
				local_comp = React.createElement Summary, {changeStep: @changeStep, data: @state.data}
		div
			className: 'container'
			div
				className: 'page-header'
				h1 {},
					'Advertise With Us'
			local_comp


ReactDOM.render React.createElement(Page), document.getElementById('app')