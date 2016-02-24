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
          console.log data
          form.parent().html(data)
          set_callback()
          return
      return false
  set_callback()
  return