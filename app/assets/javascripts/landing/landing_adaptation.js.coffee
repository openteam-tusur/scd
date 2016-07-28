$ ->
  #dom elements to work with
  wrapper = $('.video-wrapper')
  video = $('video')
  image = $('.js-no-video-tag-support')
  header = $('.header-wrapper')
  coefficient = 0.8 #needed height of video by design (80% of window height)

  video_wrapper_size_control = ->
    desired_height = $(window).height() * coefficient
    $(".js-video-wrapper").height desired_height

    return

  proportions = (element) -> element.width() / element.height()

  proportion_counter = (object)->
    wrapper = $(".js-video-wrapper")
    if proportions(wrapper) >= proportions(object)
      object.removeClass("narrow").addClass("wide")
    else
      object.removeClass("wide").addClass("narrow")

  video_position_counter = (element) ->
    wrapper = $(".video-wrapper")
    if element.width() > wrapper.width()
      difference = wrapper.width() - element.width()
      element.offset left: difference/2
    else
      element.offset left: 0

  resize_header = ->
    header.width wrapper.width()
    header.height(wrapper.height())

  activate_tabs = ->
    $('.nav-tabs li').first().addClass('active')
    $('.conference-schedule .tab-pane').first().addClass('active in')

  activate_yandex_maps = ->
    ymaps.ready ->
      $map = $('#map')
      map = new ymaps.Map $map[0],
        center: [56.472019, 84.953400]
        zoom: 12
        controls: []

      placemark = new ymaps.Placemark [56.472518, 84.953003],
        balloonContent:'
                        <small> Venue: </small>
                        <br/>
                        <strong>
                          House of Scientists
                          <br/>
                          of TUSUR University
                          <br/>
                        </strong>
                        45 Sovetskaya street, Tomsk, Russia
                        ',
        preset: 'islands#icon'
        iconColor: '#0095b6'
      map.geoObjects.add placemark
      placemark.balloon.open()



  enable_scroll_to = ->
    $('.js-scrollable-link').click ->
      $(window).scrollTo($(this).attr('href'), 1000)


  #declared functions all together!
  control = ->
    video_wrapper_size_control()
    $.map [video, image], (e) -> proportion_counter e
    $.map [video, image], (e) -> video_position_counter e
    resize_header()

  #callbacks
  $(document).ready () ->
    control()
    enable_scroll_to()
    activate_tabs()
    activate_yandex_maps()
  $("video").ready  () -> control()
  $(window).resize  () -> control()
  return
