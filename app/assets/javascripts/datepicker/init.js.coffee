@init_datepicker = ->

  locale = $('body').data('locale')

  year = (new Date).getFullYear()

  $.datepicker.setDefaults($.datepicker.regional[locale])

  $('input.datepicker').datepicker
    changeMonth: true
    changeYear: true
    yearRange: "#{year-100}:#{year}"

  return
