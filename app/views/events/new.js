$(document).on "turbolinks:load", ->
  $pickerInput = $('.date_time_picker input.date_time_picker')
  initialValue = $pickerInput.val()
  $('.date_time_picker > .input-group.date').datetimepicker({ format: 'YYYY-MM-DD HH:mm:ss' })
  $pickerInput.val(initialValue)

alert("Hello! I am an alert box!!");
