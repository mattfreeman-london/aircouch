console.log("hello")
$(document).ready(function() {
  // $(".start_date").datepicker({
  //   dateFormat: "mm/dd/yy", changeMonth: true,
  //   changeYear: true, yearRange: '1900:2020', defaultDate: `${Date.now()}`
  // });

  // $(".end_date").datepicker({
  //   dateFormat: "mm/dd/yy", changeMonth: true,
  //   changeYear: true, yearRange: '1900:2020', defaultDate: `${Date.now()}`
  // });

  
 var array = ["2019-11-21","2019-11-22","2019-11-23"]
  $('input').datepicker({
      beforeShowDay: function(date) {
          var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
          console.log(string)
          return [ array.indexOf(string) == -1 ]
      }
  });
});