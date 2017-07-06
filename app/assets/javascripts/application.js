//= require jquery
//= require jquery_ujs
// require turbolinks
//= require d3.v4.min
//= require chart.2.5.0
//= require_tree .


$(document).ready(function(e) {
  // Is exceeding call stack
  var count = 0;
  $( "#evidence-options-list button li").click(function() {
    console.log("START");
    $( ".evidence-data" ).each(function(i, obj) {
      console.log(i);
    });

    /*
    $( ".evidence-data").hide();
    $( "#evidence-options-list button li").css("border", "none");
    var sType = $( this ).attr("submission-type");
    var sTypeClass = "." + sType;
    $( sTypeClass ).show();
    $( this ).css("border", "2px solid blue");
    buttonText = $( this ).html();
    $( "#submission-type-display").html(buttonText);
    */
  });




  var sel_number = $( "div#demographics > p > select.sel-number" );
  var sel_scope = $( "div#demographics > p > select.sel-scope" );
  var div_id = $( "div#demographics > p > span.id" );
  var div_filter = $( "div#demographics > p > span.filter" );
  var sel_filter = $( "div#demographics > p > span > select.sel-filter" );
  var in_id = $( "div#demographics > p > span > input.in-id" );
  var demog_link_but = $( "div#demographics > p > button.create-link");
  var new_link = $( "div#demographics > p#link");

  sel_number.change(function(){
    if (sel_number.val() == "one"){
      sel_scope.children("option").each(function() {
        $(this).html($(this).html().slice(0, -1));
      });
      div_id.show();
      sel_filter.val("");
      div_filter.hide();
    } else if (sel_number.val() === "all"){
      sel_scope.children("option").each(function() {
        $(this).html(String($(this).html()) + "s");
      });
      div_id.hide();
      in_id.val("");
    }
  });

  sel_scope.change(function(){
    if (sel_number.val() === "all" && sel_scope.val() === "site"){
      div_filter.show();
      sel_filter.html("<option value=''>all</option><option value='network'>Network</option>");
    } else if (sel_number.val() === "all" && sel_scope.val() === "group"){
      div_filter.show();
      sel_filter.html("<option value=''>all</option><option value='network'>Network</option><option value='site'>Site</option>");
    } else if (sel_scope.val() === "network"){
      div_filter.hide();
      sel_filter.html("");
      div_id.hide();
      in_id.val("");
    }
  });

  sel_filter.change(function(){
    if (sel_filter.val() === ""){
      div_id.hide();
      in_id.val("");
    } else {
      div_id.show();
    }
  });

  demog_link_but.click(function() {
    var link = "/reports/demographics?";
    scope = "scope=" + sel_scope.val();
    switch (sel_scope.val()) {
      case "network":
        if (sel_number.val() === "one") {
          filter = "&filter=network";
          id = "&id=" + in_id.val();
        } else {
          filter = "";
          id = "";
        }
      break;
      case "site":
        if (sel_number.val() === "one") {
          filter = "&filter=site";
          id = "&id=" + in_id.val();
        } else {
          if (sel_filter.val() === "network"){
            filter = "&filter=network";
            id = "&id=" + in_id.val();
          } else {
            filter = "";
            id = "";
          }
        }
      break;
      case "group":
      if (sel_number.val() === "one") {
        filter = "&filter=group";
        id = "&id=" + in_id.val();
      } else {
        if (sel_filter.val() === "network"){
          filter = "&filter=network";
          id = "&id=" + in_id.val();
        } else if (sel_filter.val() === "site"){
          filter = "&filter=site";
          id = "&id=" + in_id.val();
        } else {
          filter = "";
          id = "";
        }
      }
      break;
    }
    link += scope + filter + id;
    new_link.html("<a href='" + link + "'>" + link + "</a>");
  });


  var p_sel_number = $( "div#projects > p > select.sel-number" );
  var p_sel_scope = $( "div#projects > p > select.sel-scope" );
  var p_div_id = $( "div#projects > p > span.id" );
  var p_div_filter = $( "div#projects > p > span.filter" );
  var p_sel_filter = $( "div#projects > p > span > select.sel-filter" );
  var p_in_id = $( "div#projects > p > span > input.in-id" );
  var p_demog_link_but = $( "div#projects > p > button.create-link");
  var p_new_link = $( "div#projects > p#link");

  p_sel_number.change(function(){
    if (p_sel_number.val() == "one"){
      p_sel_scope.children("option").each(function() {
        $(this).html($(this).html().slice(0, -1));
      });
      p_div_id.show();
      p_sel_filter.val("");
      p_div_filter.hide();
    } else if (p_sel_number.val() === "all"){
      p_sel_scope.children("option").each(function() {
        $(this).html(String($(this).html()) + "s");
      });
      p_div_id.hide();
      p_in_id.val("");
    }
  });

  p_sel_scope.change(function(){
    if (p_sel_number.val() === "all" && p_sel_scope.val() === "site"){
      p_div_filter.show();
      p_sel_filter.html("<option value=''>all</option><option value='network'>Network</option>");
    } else if (p_sel_number.val() === "all" && p_sel_scope.val() === "group"){
      p_div_filter.show();
      p_sel_filter.html("<option value=''>all</option><option value='network'>Network</option><option value='site'>Site</option>");
    } else if (p_sel_scope.val() === "network"){
      p_div_filter.hide();
      p_sel_filter.html("");
      p_div_id.hide();
      p_in_id.val("");
    }
  });

  p_sel_filter.change(function(){
    if (p_sel_filter.val() === ""){
      p_div_id.hide();
      p_in_id.val("");
    } else {
      p_div_id.show();
    }
  });

  p_demog_link_but.click(function() {
    var link = "/reports/projects?";
    scope = "scope=" + p_sel_scope.val();
    switch (p_sel_scope.val()) {
      case "network":
        if (p_sel_number.val() === "one") {
          filter = "&filter=network";
          id = "&id=" + p_in_id.val();
        } else {
          filter = "";
          id = "";
        }
      break;
      case "site":
        if (p_sel_number.val() === "one") {
          filter = "&filter=site";
          id = "&id=" + p_in_id.val();
        } else {
          if (p_sel_filter.val() === "network"){
            filter = "&filter=network";
            id = "&id=" + p_in_id.val();
          } else {
            filter = "";
            id = "";
          }
        }
      break;
      case "group":
      if (p_sel_number.val() === "one") {
        filter = "&filter=group";
        id = "&id=" + p_in_id.val();
      } else {
        if (p_sel_filter.val() === "network"){
          filter = "&filter=network";
          id = "&id=" + p_in_id.val();
        } else if (p_sel_filter.val() === "site"){
          filter = "&filter=site";
          id = "&id=" + p_in_id.val();
        } else {
          filter = "";
          id = "";
        }
      }
      break;
    }
    link += scope + filter + id;
    p_new_link.html("<a href='" + link + "'>" + link + "</a>");
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
