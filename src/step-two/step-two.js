// Generated by CoffeeScript 1.10.0

/* 
StepTwo of Sample Workflow
 Requirements:
 	Upload Creative
	 	Allow uploading multiple images
	 	one image at a time is fine
	 	user should have the option to upload up to 5 images
	 	user should be able to delete an image and upload a different one before proceeding
	 	uploaded images can just be stored in the hash
	 	Extra credit: Show a progress bar when uploading images
 */
var ImageUpload, React, ReactDOM, StepTwo, a, div, form, h3, input, label, p, ref;

React = require('react');

ReactDOM = require('react-dom');

ref = React.DOM, div = ref.div, h3 = ref.h3, p = ref.p, form = ref.form, input = ref.input, label = ref.label, a = ref.a;

ImageUpload = require('./image-upload.js');

StepTwo = React.createClass({
  changeStep: function(data, image_amount) {
    var new_data;
    new_data = {
      images: data,
      image_amount: image_amount
    };
    this.props.updateData(new_data, 2);
    return this.props.changeStep(3);
  },
  handleBack: function() {
    return this.props.changeStep(1);
  },
  render: function() {
    return div({
      className: 'container',
      id: 'step-two-container'
    }, div({
      className: 'row'
    }, div({
      className: 'col-sm-2'
    }, a({
      className: 'btn btn-primary',
      onClick: this.handleBack
    }, 'Back')), div({
      className: 'col-sm-8'
    }, h3({}, "Image Upload"), p({}, "Upload the images for your ad here. You may upload up to five images")), div({
      className: 'col-sm-2'
    })), React.createElement(ImageUpload, {
      changeStep: this.changeStep
    }));
  }
});

module.exports = StepTwo;