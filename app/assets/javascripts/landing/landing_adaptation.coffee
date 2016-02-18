$ ->

  coefficient = 0.8 #needed height of video by design
  video = $('video')
  image = $('.js-no-video-tag-support')

  video_wrapper_size_control = ->
    desired_height = $(window).height() * coefficient
    $(".js-video-wrapper").height desired_height

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




  control = () ->
    video_wrapper_size_control()

    $.map [video, image], (e) -> proportion_counter e
    $.map [video, image], (e) -> video_position_counter e

  #callbacks
  $(document).ready () -> control()
  $("video").ready  () -> control()
  $(window).resize  () -> control()
  return
