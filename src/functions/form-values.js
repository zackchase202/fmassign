// Generated by CoffeeScript 1.10.0
var $, getValues;

$ = require('jquery');

getValues = function(array) {
  return new Promise(function(resolve, reject) {
    var formValues, i, key, val;
    formValues = {};
    i = 0;
    while (i < array.length) {
      key = array[i];
      val = $('#' + key).val();
      if (val === '') {
        reject(key);
      }
      if (key === 'total-budget') {
        if (parseFloat(key === 0)) {
          reject(key);
        }
      }
      formValues[key] = val;
      i++;
    }
    return resolve(formValues);
  });
};

module.exports = getValues;
