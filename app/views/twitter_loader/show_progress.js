Progressbar.defaults = {
  transition_delay: 300,
  refresh_speed: 50,
  display_text: 'center',
  use_percentage: false,
  percent_format: function(percent) { return percent + '%'; },
  amount_format: function(amount_part, amount_total) { return amount_part + ' / ' + amount_total; },
  update: $.noop,
  done: $.noop,
  fail: $.noop
};
$('.progress .progress-bar').progressbar();
$('#m-callback').click(function() {
  $('.m-callback .progress-bar').progressbar({
    update: function(current_percentage) {
      $('#m-callback-update').html(current_percentage);
    },
    done: function() {
      $('#m-callback-done').html('yeah! done!');
    }
  });
});
