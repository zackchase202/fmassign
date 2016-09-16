// Generated by CoffeeScript 1.10.0

/*
	Input Component
	Props:
		id = Element ID
		text = Label and Placeholder Text
 */
var $, CurrencyInput, React, ReactDOM, div, input, label, ref, span;

React = require('react');

ReactDOM = require('react-dom');

$ = require('jquery');

ref = React.DOM, div = ref.div, input = ref.input, label = ref.label, span = ref.span;

CurrencyInput = React.createClass({
  getInitialState: function() {
    return {
      old_length: 0
    };
  },
  handleChange: function(event) {
    var d, total_budget_value, v;
    total_budget_value = event.target.value;
    switch (this.state.old_length) {
      case false:
        this.setState({
          old_length: total_budget_value.length
        });
        return;
      case 3:
        this.setState({
          old_length: total_budget_value.length
        });
        return;
    }
    if (total_budget_value.length < this.state.old_length) {
      this.setState({
        old_length: false
      });
      return;
    }
    switch (total_budget_value.length) {
      case 0:
        $('#' + this.props.name).val('');
        return this.setState({
          old_length: total_budget_value.length
        });
      case 1:
        $('#' + this.props.name).val('0.0' + total_budget_value);
        return this.setState({
          old_length: total_budget_value.length
        });
      case 2:
        return this.setState({
          old_length: total_budget_value.length
        });
      case 3:
        return this.setState({
          old_length: total_budget_value.length
        });
      default:
        console.log('default');
        d = parseFloat(total_budget_value.replace(/,/g, ''));
        console.log('d: ' + d);
        v = (d * 10).toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
        console.log('v: ' + v);
        $('#' + this.props.name).val(v);
        return this.setState({
          old_length: v.length
        });
    }
  },
  render: function() {
    return div({
      className: 'empty'
    }, div({
      className: 'container'
    }, label({
      className: 'form-label',
      htmlFor: this.props.name
    }, this.props.label)), div({
      className: 'container'
    }, div({
      className: 'input-group'
    }, span({
      className: 'input-group-addon'
    }, "$"), input({
      onChange: this.handleChange,
      type: 'text',
      className: 'form-control',
      id: this.props.name,
      placeholder: '00.00',
      min: '0',
      step: '0.01'
    }))));
  }
});

module.exports = CurrencyInput;
