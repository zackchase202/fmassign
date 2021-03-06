// Generated by CoffeeScript 1.10.0

/*
	Input Component
	Props:
		id = Element ID
		text = Label and Placeholder Text
 */
var Input, React, ReactDOM, div, input, label, ref;

React = require('react');

ReactDOM = require('react-dom');

ref = React.DOM, div = ref.div, input = ref.input, label = ref.label;

Input = React.createClass({
  render: function() {
    return div({
      className: 'container'
    }, div({
      className: 'container'
    }, label({
      className: 'form-label',
      htmlFor: this.props.id
    }, this.props.text)), div({
      className: 'container'
    }, input({
      type: 'text',
      className: 'form-control step-one-input',
      id: this.props.id,
      placeholder: this.props.text
    })));
  }
});

module.exports = Input;
