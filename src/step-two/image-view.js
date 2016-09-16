// Generated by CoffeeScript 1.10.0
var ImageComponent, ImageView, React, ReactDOM, a, div, form, h3, img, input, label, p, ref;

React = require('react');

ReactDOM = require('react-dom');

ref = React.DOM, div = ref.div, h3 = ref.h3, p = ref.p, form = ref.form, input = ref.input, label = ref.label, a = ref.a, img = ref.img;

ImageComponent = React.createClass({
  deleteImage: function() {
    console.log('deleting');
    return this.props.deleteImage(this.props.image);
  },
  render: function() {
    console.log(this.props.image);
    return div({
      className: 'col-sm-2 image-view'
    }, img({
      className: 'image-view-preview',
      src: this.props.image
    }), a({
      className: 'btn btn-danger delete-img-btn',
      onClick: this.deleteImage
    }, 'Delete'));
  }
});

ImageView = React.createClass({
  render: function() {
    return div({
      className: 'image-view-container'
    }, this.props.images.length > 0 ? div({
      className: 'row'
    }, div({
      className: 'col-sm-1'
    }), React.createElement(ImageComponent, {
      image: this.props.images[0],
      deleteImage: this.props.deleteImage
    }), this.props.images.length > 1 ? React.createElement(ImageComponent, {
      image: this.props.images[1],
      deleteImage: this.props.deleteImage
    }) : void 0, this.props.images.length > 2 ? React.createElement(ImageComponent, {
      image: this.props.images[2],
      deleteImage: this.props.deleteImage
    }) : void 0, this.props.images.length > 3 ? React.createElement(ImageComponent, {
      image: this.props.images[3],
      deleteImage: this.props.deleteImage
    }) : void 0, this.props.images.length > 4 ? React.createElement(ImageComponent, {
      image: this.props.images[4],
      deleteImage: this.props.deleteImage
    }) : void 0, div({
      className: 'col-sm-1'
    })) : void 0);
  }
});

module.exports = ImageView;
