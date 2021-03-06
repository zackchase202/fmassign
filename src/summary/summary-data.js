// Generated by CoffeeScript 1.10.0
var AdCreativeSummary, AdTargetComponent, BillingInfo, CompanyInfo, ContactInfo, React, ReactDOM, SummaryData, a, div, form, h3, image_data_matcher, img, input, label, p, ref;

React = require('react');

ReactDOM = require('react-dom');

ref = React.DOM, div = ref.div, h3 = ref.h3, p = ref.p, form = ref.form, input = ref.input, label = ref.label, a = ref.a, img = ref.img;

image_data_matcher = function(data, type, i) {
  switch (type) {
    case 'cmp':
      switch (i) {
        case 0:
          return String(data.image1.cpm1);
        case 1:
          return String(data.image2.cpm2);
        case 2:
          return String(data.image3.cpm3);
        case 3:
          return String(data.image4.cpm4);
        case 4:
          return String(data.image5.cpm5);
      }
      break;
    case 'max-impressions':
      switch (i) {
        case 0:
          return String(data.image1.maximpressions1);
        case 1:
          return String(data.image2.maximpressions2);
        case 2:
          return String(data.image3.maximpressions3);
        case 3:
          return String(data.image4.maximpressions4);
        case 4:
          return String(data.image5.maximpressions5);
      }
  }
};

AdTargetComponent = React.createClass({
  render: function() {
    console.log(this.props.data.image1);
    return div({
      className: 'row ad-target-component-summary'
    }, div({
      className: 'col-sm-2'
    }, img({
      className: 'target-ad-image',
      src: this.props.image
    })), div({
      className: 'col-sm-10 ad-target-details'
    }, div({
      className: 'empty'
    }, p({
      className: 'ad-target-details-text'
    }, "CPM: $" + image_data_matcher(this.props.data, 'cmp', this.props.ikey))), div({
      className: 'empty'
    }, p({
      className: 'ad-target-details-text'
    }, "Max Impressions: " + image_data_matcher(this.props.data, 'max-impressions', this.props.ikey)))));
  }
});

AdCreativeSummary = React.createClass({
  render: function() {
    var _this;
    _this = this;
    return div({
      className: 'container',
      id: 'ad-creative-summary'
    }, this.props.data.stepTwo.images.map(function(item, i) {
      return div({
        className: 'empty ad-set-title'
      }, "Ad Set " + String(i + 1), React.createElement(AdTargetComponent, {
        ikey: i,
        image: item,
        data: _this.props.data.stepThree,
        key: i
      }));
    }));
  }
});

CompanyInfo = React.createClass({
  render: function() {
    return div({
      className: 'conatiner'
    }, div({
      className: 'summary-comp-title'
    }, "Company Information"), div({
      className: 'empty'
    }, p, "" + this.props.data['company-name']), div({
      className: 'empty'
    }, p, "" + this.props.data['company-address']), div({
      className: 'empty'
    }, p, "" + this.props.data['company-city'] + ", " + this.props.data['company-state'] + " " + this.props.data['company-zip']));
  }
});

ContactInfo = React.createClass({
  render: function() {
    return div({
      className: 'conatiner'
    }, div({
      className: 'summary-comp-title'
    }, "Contact Information"), div({
      className: 'empty'
    }, p, "" + this.props.data['contact-firstname'] + " " + this.props.data['contact-lastname']), div({
      className: 'empty'
    }, p, "" + this.props.data['contact-email']), div({
      className: 'empty'
    }, p, "" + this.props.data['contact-phone']));
  }
});

BillingInfo = React.createClass({
  render: function() {
    return div({
      className: 'conatiner '
    }, div({
      className: 'summary-comp-title'
    }, "Billing Information"), div({
      className: 'empty'
    }, p, this.props.data['card-name']), div({
      className: 'empty'
    }, p, this.props.data['credit-card']), div({
      className: 'empty'
    }, p, this.props.data['cvc']), div({
      className: 'empty'
    }, p, this.props.data['exp-date']), div({
      className: 'empty'
    }, ""));
  }
});

SummaryData = React.createClass({
  render: function() {
    if (!this.props.data) {
      return div({
        className: 'conatiner'
      }, "Loading");
    } else {
      return div({
        className: 'conatiner'
      }, div({
        className: 'row summary-info-container'
      }, div({
        className: 'col-sm-6',
        id: 'company-info-summary'
      }, React.createElement(CompanyInfo, {
        data: this.props.data.stepOne
      })), div({
        className: 'col-sm-6',
        id: 'contact-info-summary'
      }, React.createElement(ContactInfo, {
        data: this.props.data.stepOne
      }))), React.createElement(AdCreativeSummary, {
        data: this.props.data
      }), div({
        className: 'conatiner total-budget-text',
        id: 'total-budget-summary'
      }, "Total Budget: $" + this.props.data.stepOne['total-budget']), div({
        className: 'conatiner',
        id: 'billing-info-summary'
      }, React.createElement(BillingInfo, {
        data: this.props.data.stepFour
      })));
    }
  }
});

module.exports = SummaryData;
