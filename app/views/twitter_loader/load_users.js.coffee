$(document).ready ->
  $('#progress_panel').removeClass('hide')
  $ps = $('.progress-bar')
  timer_id = setInterval ->
    $.get '/show_progress', (data) ->
      if data['progress'] * 100 >= 100
        clearInterval timer_id
      $ps.attr('aria-valuetransitiongoal', data['progress'] * 100).progressbar()
  , 1000
