React = require 'react'
ReactDOM = require 'react-dom'
{div,h3,p,form,input,label,a,img} = React.DOM

image_data_matcher = (data,type,i) ->
	switch type
		when 'cmp'
			switch i
				when 0
					return String data.image1.cpm1
				when 1
					return String data.image2.cpm2
				when 2
					return String data.image3.cpm3
				when 3
					return String data.image4.cpm4
				when 4
					return String data.image5.cpm5
		when 'max-impressions'
			switch i
				when 0
					return String data.image1.maximpressions1
				when 1
					return String data.image2.maximpressions2
				when 2
					return String data.image3.maximpressions3
				when 3
					return String data.image4.maximpressions4
				when 4
					return String data.image5.maximpressions5

AdTargetComponent = React.createClass
	render: ->
		console.log @props.data.image1
		div
			className: 'row ad-target-component-summary'
			div
				className: 'col-sm-2'
				img
					className: 'target-ad-image'
					src: @props.image
			div
				className: 'col-sm-10 ad-target-details'
				div
					className: 'empty'
					p
						className: 'ad-target-details-text'
						"CPM: $" + image_data_matcher @props.data,'cmp',@props.ikey
				div
					className: 'empty'
					p
						className: 'ad-target-details-text'
						"Max Impressions: " + image_data_matcher @props.data,'max-impressions',@props.ikey
						

AdCreativeSummary = React.createClass

	render: ->
		_this = @
		div
			className: 'container'
			id: 'ad-creative-summary'
			@props.data.stepTwo.images.map (item,i) ->
				div
					className: 'empty ad-set-title'
					"Ad Set " + String(i+1)
					React.createElement AdTargetComponent, {ikey: i, image: item, data: _this.props.data.stepThree, key: i}

CompanyInfo = React.createClass

	render: ->
		div
			className: 'conatiner'
			div
				className: 'summary-comp-title'
				"Company Information"
			div
				className: 'empty'
				p
					"" + @props.data['company-name']
			div
				className: 'empty'
				p
					"" + @props.data['company-address']
			div
				className: 'empty'
				p
					"" + @props.data['company-city'] + ", " + @props.data['company-state'] + " " + @props.data['company-zip']

ContactInfo = React.createClass

	render: ->
		div
			className: 'conatiner'
			div
				className: 'summary-comp-title'
				"Contact Information"
			div
				className: 'empty'
				p
					"" + @props.data['contact-firstname'] + " " + @props.data['contact-lastname']
			div
				className: 'empty'
				p
					"" + @props.data['contact-email']
			div
				className: 'empty'
				p
					"" + @props.data['contact-phone']

BillingInfo = React.createClass

	render: ->
		div
			className: 'conatiner '
			div
				className: 'summary-comp-title'
				"Billing Information"
			div
				className: 'empty'
				p
					@props.data['card-name']
			div
				className: 'empty'
				p
					@props.data['credit-card']
			div
				className: 'empty'
				p
					@props.data['cvc']
			div
				className: 'empty'
				p
					@props.data['exp-date']
			div
				className: 'empty'
				""

SummaryData = React.createClass

	render: ->
		if !@props.data
			div
				className: 'conatiner'
				"Loading"
		else
			div
				className: 'conatiner'
				div
					className: 'row summary-info-container'
					div
						className: 'col-sm-6'
						id: 'company-info-summary'
						React.createElement CompanyInfo, {data: @props.data.stepOne}
					div
						className: 'col-sm-6'
						id: 'contact-info-summary'
						React.createElement ContactInfo, {data: @props.data.stepOne}
				React.createElement AdCreativeSummary, {data: @props.data}
				div
					className: 'conatiner total-budget-text'
					id: 'total-budget-summary'
					"Total Budget: $" + @props.data.stepOne['total-budget']
				div
					className: 'conatiner'
					id: 'billing-info-summary'
					React.createElement BillingInfo, {data: @props.data.stepFour}


module.exports = SummaryData