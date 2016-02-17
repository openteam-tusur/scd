@init_colorbox = ->

  close_text = 'закрыть'
  of_text = 'из'

  if $('body').data('locale') == 'en'
    close_text = 'close'
    of_text = 'of'

  $('.galleria a').each (index) ->
    $(this).addClass('colorbox').attr('rel', 'colorbox')
    return

  $('a.colorbox').colorbox
    close: close_text
    current: "{current} #{of_text} {total}"
    maxHeight: '90%'
    maxWidth: '90%'
    next: '→'
    opacity: '0.5'
    photo: true
    previous: '←'
    returnFocus: false
    title: ->
      $(this).attr('title') || $('img', this).attr('alt')

  return
