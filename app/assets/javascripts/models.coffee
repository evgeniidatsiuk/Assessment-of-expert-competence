# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'turbolinks:load', ->
  $("#questions").change ->
    console.log($(this).val())
    $.ajax
      url: '/models/new'
      type: 'GET'
      dataType: 'script'
      data:
        count: $(this).val()
