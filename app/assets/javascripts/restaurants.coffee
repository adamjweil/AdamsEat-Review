# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#register-dp').hide()
  $('#login-dp').hide()

  $('.login-dropdown-toggle').click ->
    $('#register-dp').hide()
    $('#login-dp').toggle()
    # $('#login-dp').hide()
    false

  $('.register-dropdown-toggle').click ->
      $('#login-dp').hide()
      $('#register-dp').toggle()
      false



# onLoginClick: (e) ->
#   $('#login-dp').toggle()
