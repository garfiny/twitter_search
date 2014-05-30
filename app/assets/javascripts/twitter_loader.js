$(document).ready(function() {
  $('#m-callback').click(function() {
    $('.m-callback .progress-bar').progressbar({
      update: function(current_percentage) {
        $('#m-callback-update').html(current_percentage);
      }
    });
  });
});
