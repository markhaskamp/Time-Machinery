
$(document).ready( function() {

  if ($('#newlist').length == 1) {
    alert('we excel on ice');

    $.getJSON('http://localhost:4567/names', 
      function(data) {
        alert('name: ' + data[1].name);
      });
  }

});
