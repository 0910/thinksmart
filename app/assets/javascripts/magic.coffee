ready = ->
  $('.information').slideDown().delay(3000).slideUp()

  toggleAbout = ->
    if $('.about').hasClass('show')
      # Do things on Nav Close
      $('.about').removeClass 'show'
      $('body').css('overflow', 'auto')
    else
      # Do things on Nav Open
      $('.about').addClass 'show'
      $(window).scrollTop(0)
      $('body').css('overflow', 'hidden')
    return

  toggleNav = ->
    if $('.wrapper').hasClass('show-nav')
      # Do things on Nav Close
      $('.wrapper').removeClass 'show-nav'
      $('.site-menu').removeClass 'show'
    else
      # Do things on Nav Open
      $('.wrapper').addClass 'show-nav'
      $('.site-menu').addClass 'show'
    return
  

  $ ->

      
    # Toggle Nav on Click
    $('.toggle-nav').click (event) ->
      # Calling a function in case you want to expand upon this.
      event.preventDefault()
      toggleNav()
      return
    return

$(document).ready(ready);
$(document).on('page:load', ready);