ready = ->
  $('.information').slideDown().delay(3000).slideUp()
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
    
  $(window).on 'scroll', ->
      if $(this).scrollTop() > 100
        $('.navigation').addClass 'white'
      else
        $('.navigation').removeClass 'white'
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