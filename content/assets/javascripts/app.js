<%= concat_files(@config[:javascripts][:compile]) %>

$(document).ready(function () {
  $(document).foundationTopBar();
})
