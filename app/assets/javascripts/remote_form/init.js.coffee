$ ->
  set_callback = ->
    form = $('.registration-form form')
    $(form).on 'submit', ->
      form = $(this)
      form.attr('action')
      data = form.serialize()
      $.ajax
        type: 'POST'
        url: form.attr('action')
        data: data
        success: (data, status, jqXHR) ->
          p =  form.parent()
          p.animate {opacity: 0}, 250, ->
            p.html(data)
            p.animate opacity: 1, 250
            set_callback()
            init_datetime_picker()
            smart_checkbox()
            return
          return
      return false
    if $('#form_again').length
      link = $('#form_again')
      link.click ->
        $.ajax
          type: 'GET'
          url: link.data('url')
          success: (data,status) ->
            p = link.closest('.registration-form')
            p.animate {opacity: 0}, 250, ->
              p.html(data)
              p.animate opacity: 1, 250
              set_callback()
              init_datetime_picker()
              smart_checkbox()

  set_callback()
  init_datetime_picker()
  smart_checkbox()
  return

init_datetime_picker = ->
  console.log 'datetime'
  $('.datetime-picker').datetimepicker()

smart_checkbox = ->
  console.log 'smart checkbox'
  checkbox = $('#claim_already_in_tomsk')
  checkbox.change ()->
    if $(this).is(':checked')
      $('.arrival').slideUp()
      $('.departure').slideUp()
    else
      $('.arrival').slideDown()
      $('.departure').slideDown()
