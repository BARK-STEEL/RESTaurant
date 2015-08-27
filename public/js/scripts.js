console.log("...Loaded");
$(window).ready(function(){
  $(function() {
      var date = $("#datepicker").datepicker({

      dateFormat: 'yymmdd',
      changeMonth: true,
      changeYear: true
    }).val();
  });
  $('#timepicker').timepicker({
    timeFormat: "hh:mm tt",
    minTime: new Date(0, 0, 0, 10, 0, 0),
    maxTime: new Date(0, 0, 0, 22, 0, 0),
    interval: 15
  });

$('.course-button').on('click', function(){
  var courseselect = $('.course-selection').val();
  $('.food-selection').html(
    "<% @foods_" + courseselect + ".each do|food| %><option value='<%= food %>'><%= course %></option><% end %>"
  );
});

$("#foodChoices").change ( function () {
    var targID  = $(this).val ();
    $("div.style-sub-1").hide ();
    $('#' + targID).show ();
} );

var d = $('.kitchen');
var e = $('.food-order');

for (var i =0; i<d.length; i++){
  var timeDiff = (Date.parse(new Date()) - Date.parse(d[i].getAttribute("data-start-time")))/60000;
  if (timeDiff > 15) {
    d[i].style.backgroundColor =  'red';
    if (e[i].getAttribute("data-status")==="preparing"){
          e[i].style.color = 'red';
    }
  } else if (timeDiff > 5 && timeDiff <=15) {
    d[i].style.backgroundColor =  'orange';
    if (e[i].getAttribute("data-status")==="preparing"){
          e[i].style.color = 'orange';
    }
  }
}
for (var j=0; j < e.length; j++) {
  var timeDiff = (Date.parse(new Date()) - Date.parse(e[j].getAttribute("data-start-time")))/60000;
  if (timeDiff > 15) {
    if (e[j].getAttribute("data-status")==="preparing"){
          e[j].style.color = 'red';
    }
  } else if (timeDiff > 5 && timeDiff <=15) {
    if (e[j].getAttribute("data-status")==="preparing"){
          e[j].style.color = 'orange';
    }
  } else {
    e[j].style.color = "green";
  }
}
});
