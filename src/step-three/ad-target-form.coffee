React = require 'react'
ReactDOM = require 'react-dom'
$ = require 'jquery'
{div,h3,p,form,input,label,a,img} = React.DOM

Input = require '../global/input.js'
CurrencyInput = require '../global/currency-input.js'

ErrorAlert = React.createClass

	render: ->
		div
			className: 'alert alert-danger step-three-input-alert'
			role: 'alert'
			p
				className: 'step-three-input-alert-text'
				"Please enter a " + @props.text

AdTargetInputs = React.createClass

	componentDidUpdate: ->
		if @props.data
			$('#cpm' + String @props.count).val(@props.data['cpm' + String @props.count])
			$('#max-impressions' + @props.count).val(@props.data['maximpressions' + @props.count])

	render: ->
		console.log 'more shit render'
		div
			className: 'ad-target-input-container'
			div
				className: 'container'
				React.createElement CurrencyInput, { name: 'cpm' + @props.count, label: 'Cost Per Impression' }
				if @props.error == 'cpm' + @props.count
					React.createElement ErrorAlert, {text: 'CPM'}
				div
					className: 'impression-input-container'
					React.createElement Input, { id: 'max-impressions' + @props.count, text: 'Max Impressions' }
					if @props.error == 'maximpressions' + @props.count
							React.createElement ErrorAlert, {text: 'Maximum Amount of Impressions'}


AdTargetComponent = React.createClass

	render: ->
		div
			className: 'row ad-target-component'
			div
				className: 'col-sm-2'
				img
					className: 'target-ad-image'
					src: @props.image
			div
				className: 'col-sm-10'
				React.createElement AdTargetInputs, {data: @props.data, count: @props.count, error: @props.error}

AdTargetForm = React.createClass
	
	getInitialState: ->
		{
			error: false,
			data: false
		}

	handleSubmit: ->
		target_form_keys = ['cpm', 'max-impressions']
		formValues = {}
		i = 1
		while i <= @props.data.image_amount
			targetValues = {}
			targetValues['cpm' + String i] = $('#cpm' + String i).val()
			targetValues['maximpressions' + String i] = $('#max-impressions' + String i).val()
			if targetValues['cpm' + String i] == ''
				@setState { error: 'cpm' + String i }
				return
			if targetValues['maximpressions' + String i] == ''
				@setState {error:'maximpressions' + String i}
				return
			formValues['image' + String i] = targetValues
			i++
		console.log 'handling submit'
		@props.changeStep(4, formValues)

	render: ->
		div
			className: 'container'
			switch @props.data.image_amount
				when 1
					div
						className: 'empty'
						React.createElement AdTargetComponent, {data: @props.old_data.image1, error: @state.error, count: 1, image: @props.data.images[0]}
				when 2
					div
						className: 'empty'
						React.createElement AdTargetComponent, {data: @props.old_data.image1, error: @state.error, count: 1, image: @props.data.images[0]}
						React.createElement AdTargetComponent, {data: @props.old_data.image2, error: @state.error, count: 2, image: @props.data.images[1]}
				when 3
					div
						className: 'empty'
						React.createElement AdTargetComponent, {data: @props.old_data.image1, error: @state.error, count: 1, image: @props.data.images[0]}
						React.createElement AdTargetComponent, {data: @props.old_data.image2, error: @state.error, count: 2, image: @props.data.images[1]}
						React.createElement AdTargetComponent, {data: @props.old_data.image3, error: @state.error, count: 3, image: @props.data.images[2]}
				when 4
					div
						className: 'empty'
						React.createElement AdTargetComponent, {data: @props.old_data.image1, error: @state.error, count: 1, image: @props.data.images[0]}
						React.createElement AdTargetComponent, {data: @props.old_data.image2, error: @state.error, count: 2, image: @props.data.images[1]}
						React.createElement AdTargetComponent, {data: @props.old_data.image3, error: @state.error, count: 3, image: @props.data.images[2]}
						React.createElement AdTargetComponent, {data: @props.old_data.image4, error: @state.error, count: 4, image: @props.data.images[3]}
				when 5
					div
						className: 'empty'
						React.createElement AdTargetComponent, {data: @props.old_data.image1, error: @state.error, count: 1, image: @props.data.images[0]}
						React.createElement AdTargetComponent, {data: @props.old_data.image2, error: @state.error, count: 2, image: @props.data.images[1]}
						React.createElement AdTargetComponent, {data: @props.old_data.image3, error: @state.error, count: 3, image: @props.data.images[2]}
						React.createElement AdTargetComponent, {data: @props.old_data.image4, error: @state.error, count: 4, image: @props.data.images[3]}
						React.createElement AdTargetComponent, {data: @props.old_data.image5, error: @state.error, count: 5, image: @props.data.images[4]}
			a
				className: 'btn btn-primary'
				onClick: this.handleSubmit
				'Submit Ad Targeting'


module.exports = AdTargetForm









