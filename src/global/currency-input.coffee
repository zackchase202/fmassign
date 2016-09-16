###
	Input Component
	Props:
		id = Element ID
		text = Label and Placeholder Text
###

React = require 'react'
ReactDOM = require 'react-dom'
$ = require 'jquery'
{div,input,label,span} = React.DOM

CurrencyInput = React.createClass

	getInitialState: ->
		{
			old_length: 0
		}

	handleChange: (event) ->
		total_budget_value = event.target.value

		switch this.state.old_length
			when false 
				@setState({ old_length: total_budget_value.length })
				return
			when 3
				@setState({ old_length: total_budget_value.length })
				return


		if total_budget_value.length < this.state.old_length
			this.setState({ old_length: false })
			return

		switch total_budget_value.length
			when 0
				$('#' + @props.name).val ''
				@setState old_length: total_budget_value.length
			when 1
				$('#' + @props.name).val '0.0' + total_budget_value
				@setState old_length: total_budget_value.length
			when 2
				@setState old_length: total_budget_value.length
			when 3
				@setState old_length: total_budget_value.length
			else
				console.log 'default'
				d = parseFloat(total_budget_value.replace(/,/g, ''))
				console.log 'd: ' + d
				v = (d * 10).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')
				console.log 'v: ' + v
				$('#' + @props.name).val v
				@setState old_length: v.length
		

	render: ->
		div
			className: 'empty'
			div
				className: 'container'
				label
					className: 'form-label'
					htmlFor: @props.name
					@props.label
			div
				className: 'container'
				div
					className: 'input-group'
					span
						className: 'input-group-addon'
						"$"
					input
						onChange: this.handleChange
						type: 'text'
						className: 'form-control'
						id: @props.name
						placeholder: '00.00'
						min: '0'
						step: '0.01'




module.exports = CurrencyInput