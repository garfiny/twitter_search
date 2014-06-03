$(document).ready ->
    $('#resultTabs a').click (e) ->
        e.preventDefault()
        $(this).tab('show')
