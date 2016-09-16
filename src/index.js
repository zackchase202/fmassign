// Generated by CoffeeScript 1.10.0
var GetStarted, Page, React, ReactDOM, StepFour, StepOne, StepThree, StepTwo, Summary, a, div, h1, h3, p, ref;

React = require('react');

ReactDOM = require('react-dom');

ref = React.DOM, div = ref.div, h1 = ref.h1, h3 = ref.h3, p = ref.p, a = ref.a;

StepOne = require('./step-one/step-one.js');

StepTwo = require('./step-two/step-two.js');

StepThree = require('./step-three/step-three.js');

StepFour = require('./step-four/step-four.js');

Summary = require('./summary/summary.js');

GetStarted = React.createClass({
  render: function() {
    return div({
      className: 'container',
      id: 'get-started-container'
    }, h3({}, 'Start Advertising Today'), p({}, 'To get started advertising on our site, click the button below'), a({
      className: 'btn btn-primary',
      onClick: this.props.handleClick
    }, 'Get Started'));
  }
});

Page = React.createClass({
  getInitialState: function() {
    return {
      screen: 'step-two',
      data: {
        stepOne: false,
        stepTwo: false,
        stepThree: false,
        stepFour: false
      }
    };
  },
  updateData: function(data, step) {
    switch (step) {
      case 1:
        return this.setState({
          data: {
            stepOne: data,
            stepTwo: this.state.data.stepTwo,
            stepThree: this.state.data.stepThree,
            stepFour: this.state.data.stepFour
          }
        });
      case 2:
        return this.setState({
          data: {
            stepOne: this.state.data.stepOne,
            stepTwo: data,
            stepThree: this.state.data.stepThree,
            stepFour: this.state.data.stepFour
          }
        });
      case 3:
        return this.setState({
          data: {
            stepOne: this.state.data.stepOne,
            stepTwo: this.state.data.stepTwo,
            stepThree: data,
            stepFour: this.state.data.stepFour
          }
        });
      case 4:
        return this.setState({
          data: {
            stepOne: this.state.data.stepOne,
            stepTwo: this.state.data.stepTwo,
            stepThree: this.state.data.stepThree,
            stepFour: data
          }
        });
    }
  },
  onGetStartedPress: function() {
    return this.setState({
      screen: 'step-one'
    });
  },
  changeStep: function(step) {
    console.log('next step');
    switch (step) {
      case 0:
        return this.setState({
          screen: 'get-started'
        });
      case 1:
        return this.setState({
          screen: 'step-one'
        });
      case 2:
        return this.setState({
          screen: 'step-two'
        });
      case 3:
        return this.setState({
          screen: 'step-three'
        });
      case 4:
        return this.setState({
          screen: 'step-four'
        });
      case 5:
        return this.setState({
          screen: 'summary'
        });
    }
  },
  render: function() {
    var local_comp;
    switch (this.state.screen) {
      case 'get-started':
        local_comp = React.createElement(GetStarted, {
          handleClick: this.onGetStartedPress
        });
        break;
      case 'step-one':
        local_comp = React.createElement(StepOne, {
          changeStep: this.changeStep,
          updateData: this.updateData
        });
        break;
      case 'step-two':
        local_comp = React.createElement(StepTwo, {
          changeStep: this.changeStep,
          updateData: this.updateData
        });
        break;
      case 'step-three':
        local_comp = React.createElement(StepThree, {
          changeStep: this.changeStep,
          data: this.state.data.stepTwo,
          updateData: this.updateData
        });
        break;
      case 'step-four':
        local_comp = React.createElement(StepFour, {
          changeStep: this.changeStep,
          updateData: this.updateData
        });
        break;
      case 'summary':
        local_comp = React.createElement(Summary, {
          changeStep: this.changeStep,
          data: this.state.data
        });
    }
    return div({
      className: 'container'
    }, div({
      className: 'page-header'
    }, h1({}, 'Advertise With Us')), local_comp);
  }
});

ReactDOM.render(React.createElement(Page), document.getElementById('app'));
