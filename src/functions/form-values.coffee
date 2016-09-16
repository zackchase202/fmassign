$ = require 'jquery'

getValues = (array) ->
	return new Promise (resolve,reject) ->
		formValues = {}
		i = 0
		while i < array.length
			key = array[i]
			val = $('#' + key).val()
			if val == ''
				reject key
			if key == 'total-budget'
				if parseFloat key == 0
					reject key
			formValues[key] = val
			i++
		resolve formValues


module.exports = getValues
