$(document).ready ->
  $('#progress_panel').removeClass('hide')
  $ps = $('.progress-bar')
  timer_id = setInterval ->
    $.get '/show_progress', (data) ->
      console.log(data)
      if (data.progress == null)
          return
      if data.status == 'done'
        clearInterval timer_id
      $('#m-callback-update').html("<span>#{data.report} -- #{data.progress * 100}% </span>")
      $ps.attr('aria-valuetransitiongoal', data.progress * 100).progressbar()
  , 1000
