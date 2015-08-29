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

//Form Validations

//Date
$('#date_submit').on('click', function(){
  if ($(".datepicker").val() === "" || $(".datepicker").val() === "Please enter a date" ){
    $(".datepicker").val("Please enter a date").css({color:"red"});
  } else {
    $("#submit_handle").click();
  }
});
$('#date_submit2').on('click', function(){
  if ($(".datepicker").val() === "" || $(".datepicker").val() === "Please enter a date"){
    $(".datepicker").val("Please enter a date").css({color:"red"});
    $(".datepicker").css({color:"red"});
  } else {
    $("#submit_handle2").click();
  }
});
$('.datepicker').on('click', function(event){
  event.target.style.color="black";
});

// Servers
$('#server_submit').on('click', function(){
  if ($("#server-name").val() === "" || $("#server-phone").val()==="" || $("#server-name").val() === "Please enter a name" || $("#server-phone").val()==="Please enter a phone number" ){
    if ($("#server-name").val()===""){
      $("#server-name").val("Please enter a name").css({color:"red"});
    } else if ($("#server-phone").val()===""){
      $("#server-phone").val("Please enter a phone number").css({color:"red"});
    } else {
      $("#server-name").val("Please enter a name").css({color:"red"});
      $("#server-phone").val("Please enter a phone number").css({color:"red"});
    }
  } else {
    $("#server_submit_handle").click();
  }
});
$("#server-name").on('click', function(){
  $("#server-name").val("").css({color:"black"});
});
$("#server-phone").on('click', function(){
  $("#server-phone").val("").css({color:"black"});
});

//Food

$('#food_submit').on('click', function(){
  if ($("#food-name").val() === "" || $("#food-price").val()==="" || $("#food-name").val() === "Please enter a name" || $("#food-price").val()==="Please enter a price" ){
    if  ($("#food-name").val() === "" && $("#food-price").val()==="") {
      $("#food-name").val("Please enter a name").css({color:"red"});
      $("#food-price").val("Please enter a price").css({color:"red"});
    } else if ($("#food-name").val()===""){
      $("#food-name").val("Please enter a name").css({color:"red"});
    } else if ($("#food-price").val()===""){
      $("#food-price").val("Please enter a price").css({color:"red"});
    }
  } else {
    $("#food_submit_handler").click();
  }
});
$("#food-name").on('click', function(){
  $("#food-name").val("").css({color:"black"});
});
$("#food-price").on('click', function(){
  $("#food-price").val("").css({color:"black"});
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
      if (e[j].getAttribute("data-food-status")=="preparing"){
            e[j].style.color = 'red';
      }
    } else if (timeDiff > 5 && timeDiff <=15) {
      if (e[j].getAttribute("data-food-status")=="preparing"){
            e[j].style.color = 'orange';
      }
    } else {
      e[j].style.color = "green";
    }
  }

$(".checkout-button").on("click", function() {
  console.log("You clicked the open button!");
  $(".modal").toggle();
});
$(".see-receipt").on("click", function() {
  console.log("You clicked the open button!");
  $(".modal").toggle();
});
$(".order-modal-open").on("click", function(event) {
  var chosen = event.target.getAttribute("data-order-id");
  order = document.getElementById(chosen);
  // console.log(order);
  $( order ).toggle();
});
// $(".order-modal-open").click(function() {
//   var chosen = event.target.getAttribute("data-order-id");
//   order = document.getElementById(chosen);
//   $( order ).slideDown(500);
//
// });

// Add an event to CLOSE the modal
$(".close-order-modal").on("click", function() {
  var order_id = event.target.getAttribute("data-order-id");
  var close = document.getElementById(order_id);
  $( close ).toggle();
});
$("#close-modal-out").on("click", function() {
  console.log("You clicked the close button.");
  $(".modal").toggle();
});

$(".tip").click(function() {
  var tip = event.target.textContent;
  var subtotal = $("#subtotal").text();
  console.log(subtotal);
  var total = $("#total");
$(total).text((parseFloat(subtotal) + parseFloat(tip)).toFixed(2));
});


});
