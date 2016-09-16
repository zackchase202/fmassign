React = require 'react'
ReactDOM = require 'react-dom'
{div,h3,p,form,input,label,a,img} = React.DOM

ImageComponent = React.createClass

	deleteImage: ->
		console.log 'deleting'
		@props.deleteImage(@props.image)

	render: ->
		console.log @props.image
		div
			className: 'col-sm-2 image-view'
			img
				className: 'image-view-preview'
				src: @props.image
			a
				className: 'btn btn-danger delete-img-btn'
				onClick: @deleteImage
				'Delete'


ImageView = React.createClass

	render: ->
		div
			className: 'image-view-container'
			if @props.images.length > 0
				div
					className: 'row'
					div
						className: 'col-sm-1'
					React.createElement ImageComponent, {image: @props.images[0], deleteImage: @props.deleteImage}
					
					if @props.images.length > 1
						React.createElement ImageComponent, {image: @props.images[1], deleteImage: @props.deleteImage}

					if @props.images.length > 2
						React.createElement ImageComponent, {image: @props.images[2], deleteImage: @props.deleteImage}

					if @props.images.length > 3
						React.createElement ImageComponent, {image: @props.images[3], deleteImage: @props.deleteImage}

					if @props.images.length > 4
						React.createElement ImageComponent, {image: @props.images[4], deleteImage: @props.deleteImage}
					div
						className: 'col-sm-1'



module.exports = ImageView