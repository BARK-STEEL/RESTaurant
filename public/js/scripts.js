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

  $('.timepicker').pickatime({
    interval: 30,
    min: new Date(0,0,0,10),
    max: new Date(0,0,0,22)
  });

  $('.datepicker').pickadate({
  // Escape any “rule” characters with an exclamation mark (!).
  format: 'dddd, mmm dd, yyyy',
  formatSubmit: 'yyyymmdd',
  hiddenName:true
  // hiddenPrefix: 'prefix__',
  // hiddenSuffix: '__suffix'
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
    d[i].style.backgroundColor =  'rgb(231, 57, 57)';
  } else if (timeDiff > 5 && timeDiff <=15) {
    d[i].style.backgroundColor =  'orange';
  }
}
for (var j=0; j < e.length; j++) {
  var timeDiff = (Date.parse(new Date()) - Date.parse(e[j].getAttribute("data-start-time")))/60000;
  if (timeDiff > 15) {
    if (e[j].getAttribute("data-food-status")==="preparing"){
          e[j].style.color = 'red';
    }
  } else if (timeDiff > 5 && timeDiff <=15) {
    if (e[j].getAttribute("data-food-status")==="preparing"){
          e[j].style.color = 'orange';
    }
  } else {
    e[j].style.color = "green";
  }
}
});
