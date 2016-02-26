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
    if $('#form_again').length
      link = $('#form_again')
      link.click ->
        $.ajax
          type: 'GET'
          url: link.data('url')
          success: (data,status) -> 
            p = link.closest('.registration-form')
            console.log p
            p.animate {opacity: 0}, 250, ->
              p.html(data)
              p.animate opacity: 1, 250
              set_callback()
              return
            return
        return
  set_callback()
  return
