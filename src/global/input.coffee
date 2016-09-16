###
	Input Component
	Props:
		id = Element ID
		text = Label and Placeholder Text
###

React = require 'react'
ReactDOM = require 'react-dom'
{div,input,label} = React.DOM

Input = React.createClass

	render: ->
		div
			className: 'container'
			div
				className: 'container'
				label
					className: 'form-label'
					htmlFor: this.props.id
					this.props.text
			div
				className: 'container'
				input
					type: 'text'
					className: 'form-control step-one-input'
					id: this.props.id
					placeholder: this.props.text


module.exports = Input