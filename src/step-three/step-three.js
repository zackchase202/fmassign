// Generated by CoffeeScript 1.10.0

/* 
StepThree of Sample Workflow
 Requirements:
 	Set target bids
		For each image uploaded display a small thumbnail of the image
		require a user to enter a CPM bid for each of the images
		require a user to enter a max impressions for this line item.
		extra credit: display the dimensions of the image right next to the thumbnail
		extra extra credit: dynamicaly resize the image on the server for a smaller thumbnail
 */
var AdTargetForm, GetData, React, ReactDOM, StepThree, Submit, a, div, form, h3, input, label, p, ref;

React = require('react');

ReactDOM = require('react-dom');

ref = React.DOM, div = ref.div, h3 = ref.h3, p = ref.p, form = ref.form, input = ref.input, label = ref.label, a = ref.a;

AdTargetForm = require('./ad-target-form.js');

Submit = require('../functions/submit.js').StepThree;

GetData = require('../functions/get-data.js');

StepThree = React.createClass({
  getInitialState: function() {
    return {
      data: false
    };
  },
  handleBack: function() {
    return this.props.changeStep(2);
  },
  submitData: function(step, formValues) {
    var _this;
    _this = this;
    return Submit(formValues).then(function(rsp) {
      _this.props.updateData(rsp, 3);
      return _this.props.changeStep(step);
    });
  },
  componentDidMount: function() {
    var _this;
    _this = this;
    return GetData(this.props.old_data).then(function(rsp) {
      console.log(rsp);
      return _this.setState({
        data: rsp
      }, function() {
        return _this.forceUpdate();
      });
    });
  },
  render: function() {
    console.log('shit is rendering');
    return div({
      className: 'container',
      id: 'step-three-container'
    }, div({
      className: 'row'
    }, div({
      className: 'col-sm-2'
    }, a({
      className: 'btn btn-primary',
      onClick: this.handleBack
    }, 'Back')), div({
      className: 'col-sm-8'
    }, h3({}, "Bid and Max Impressions"), p({}, "Please set your CPM and Max Impressions for each ad.")), div({
      className: 'col-sm-2'
    })), React.createElement(AdTargetForm, {
      changeStep: this.submitData,
      data: this.props.data,
      old_data: this.state.data
    }));
  }
});

module.exports = StepThree;
