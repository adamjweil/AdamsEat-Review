# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
#   alert "page has loaded!"
  # $('#login-dp').hide()
  $('.login-dropdown-toggle').click ->
    $('#login-dp').toggle()
    # $('#login-dp').hide()
    false

  $('.register-dropdown-toggle').click ->
      $('#register-dp').toggle()
      false



# onLoginClick: (e) ->
#   $('#login-dp').toggle()
