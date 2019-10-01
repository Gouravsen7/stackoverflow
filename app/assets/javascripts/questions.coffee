# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#submit-answer').click ->
    question_id = $('span#question-id').text()
    dataString = $('#answer-description').val()
    if dataString != ''
      $.ajax
        type: 'POST'
        url: '/answers.json?question_id=' + question_id
        data: { answer: { description: dataString } }
        success: (response) ->
          $('.list-group div.list-group-item:last').after '<div class=\'list-group-item\'><p>' + response.data.description + '</p><p style=\'float: right;\'>By: ' + response.data.user_name + '</p><a href=\'answers/' + response.data.id + '\' data-confirm=\'Are you sure?\' data-method=\'delete\' data-remote=\'true\'>Delete</a><br></div>'
          $('#answer-description').val ''


