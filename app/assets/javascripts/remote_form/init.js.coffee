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
            return
          return
      return false
  set_callback()
  return
