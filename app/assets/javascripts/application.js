//= require jquery
//= require jquery_ujs
// require turbolinks
//= require d3.v4.min
//= require chart.2.5.0
//= require_tree .

$(document).ready(function(e) {
  $( "li#scopeNetworkFilterNetworkSingleNetwork > button" ).click(function() {
    id = $( "li#scopeNetworkFilterNetworkSingleNetwork > input" ).val();
    $( "li#scopeNetworkFilterNetworkSingleNetwork > div.report-link").html(
      "<a href='/reports/demographics?scope=network&filter=network&id=" + id + "'>Demographics Report for Network " + id + "</a>"
    );
  });
});

$(document).ready(function(e) {
  $( "li#scopeSiteFilterNetworkSingleNetwork > button" ).click(function() {
    id = $( "li#scopeSiteFilterNetworkSingleNetwork > input" ).val();
    $( "li#scopeSiteFilterNetworkSingleNetwork > div.report-link").html(
      "<a href='/reports/demographics?scope=site&filter=network&id=" + id + "'>Demographics Report by Site for Network " + id + "</a>"
    );
  });
});

$(document).ready(function(e) {
  $( "li#scopeSiteFilterSiteSingleSite > button" ).click(function() {
    id = $( "li#scopeSiteFilterSiteSingleSite > input" ).val();
    $( "li#scopeSiteFilterSiteSingleSite > div.report-link").html(
      "<a href='/reports/demographics?scope=site&filter=site&id=" + id + "'>Demographics Report for Site " + id + "</a>"
    );
  });
});

$(document).ready(function(e) {
  $( "li#scopeGroupFilterNetworkSingleNetwork > button" ).click(function() {
    id = $( "li#scopeGroupFilterNetworkSingleNetwork > input" ).val();
    $( "li#scopeGroupFilterNetworkSingleNetwork > div.report-link").html(
      "<a href='/reports/demographics?scope=group&filter=network&id=" + id + "'>Demographics Report by Group for Network " + id + "</a>"
    );
  });
});

$(document).ready(function(e) {
  $( "li#scopeGroupFilterSiteSingleSite > button" ).click(function() {
    id = $( "li#scopeGroupFilterSiteSingleSite > input" ).val();
    $( "li#scopeGroupFilterSiteSingleSite > div.report-link").html(
      "<a href='/reports/demographics?scope=group&filter=site&id=" + id + "'>Demographics Report by Group for Site " + id + "</a>"
    );
  });
});

$(document).ready(function(e) {
  $( "li#scopeGroupFilterGroupSingleGroup > button" ).click(function() {
    id = $( "li#scopeGroupFilterGroupSingleGroup > input" ).val();
    $( "li#scopeGroupFilterGroupSingleGroup > div.report-link").html(
      "<a href='/reports/demographics?scope=group&filter=group&id=" + id + "'>Demographics Report for Group " + id + "</a>"
    );
  });
});




$( function() {
  $( ".datepicker" ).datepicker({
      showOtherMonths: true,
      selectOtherMonths: true,
      changeMonth: true,
      changeYear: true
    });
} );



$.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           //url: '/profiles.json',
           url: '',
           dataType: 'json',
           success: function (data) {
               draw(data);
               console.log("SUCCESS!");
           },
           error: function (result) {
               log_error(result);
           }
       });

function draw(data) {
  var dataset = [
    {label: "0", count: 0},
    {label: "American Indian or Alaska Native", count: 0},
    {label: "Asian", count: 0},
    {label: "Black or African American", count: 0},
    {label: "Hispanic, Latino/a, or Spanish origin", count: 0},
    {label: "Native Hawaiian or Other Pacific Islander", count: 0},
    {label: "White", count: 0},
    {label: "Two or More Races", count: 0},
    {label: "Decline to Answer", count: 0},
    {label: "Middle Eastern or North African", count: 0}
  ]
  for (d in data){
    e = parseInt(data[d].ethnicity_id);
    console.log(e);
    console.log(typeof e);
    console.log();
    if (e > 0){

      dataset[e].count += 1;
    }
    //console.log(data[d].ethnicity_id);
  }
  for (e in dataset) {
    console.log(e + ": " + dataset[e].count);
  }
  labels = [];
  counts = [];

  for (d in dataset){
  	labels[d] = dataset[d].label;
    counts[d] = dataset[d].count;
  }
  console.log("sorted!");
  var ctx = document.getElementById("myChart").getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: labels,
      datasets: [{
        backgroundColor: [
          "#080",
          "#800",
          "#008",
          "#880",
          "#808",
          "#088",
          "#f80",
          "#0f8",
          "#80f",
          "#8f0"
        ],
        data: counts
      }]
    }
  });

}

function log_error(err) {
    console.log(err)
}
