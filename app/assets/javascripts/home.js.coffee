# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
    $('#m-callback').click ->
        $('.progress-bar').progressbar ->
            update: (current_percentage) ->
                $('#m-callback-update').html(current_percentage)
