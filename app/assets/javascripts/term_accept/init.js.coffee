@init_term_accept = ->

  if $('#claim_term_accept').is(':checked')
    $('.actions input', $('#claim_term_accept').closest('form')).removeAttr('disabled')

  $('#claim_term_accept').change ->
    if $(this).is(':checked')
      $('.actions input', $(this).closest('form')).removeAttr('disabled')
    else
      $('.actions input', $(this).closest('form')).attr('disabled', true)

  return
