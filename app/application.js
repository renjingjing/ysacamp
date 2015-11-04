// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
    $( "#datepicker_start_day" ).datepicker({
      changeMonth:true,  //月份下拉列表
      changeYear: true,  //月份下拉列表
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 6,
      showWeek: true,
      firstDay: 1,
      dateFormat:"yy-mm-dd",
      // dayNamesMin:['Sun','Mo','Tu','We','Th','Fr','Sa'],
      onClose: function( selectedDate ) {
        $( "#datepicker_end_day" ).datepicker( "option", "minDate", selectedDate );
      }
    });
    $( "#datepicker_end_day" ).datepicker({
      changeMonth:true,  //月份下拉列表
      changeYear: true,  //月份下拉列表
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 6,
      showWeek: true,
      firstDay: 1,
      dateFormat:"yy-mm-dd",
      // dayNamesMin:['Sun','Mo','Tu','We','Th','Fr','Sa'],
      onClose: function( selectedDate ) {
        $( "#datepicker_start_day" ).datepicker( "option", "maxDate", selectedDate );
      }
    });

    // flash notice and alert click fadeOut
    $(".notice").on("click",function(){
      $(this).parent().fadeOut("20");
    });


    $("#add_new_attendance_button").on('click',function(){
      console.log("new_attendance");
      $("#attendance_attendanted_record").val('');
      $("#attendance_course_unit_id").val('');
      $("input.radio_buttons").attr({'checked':false,'disabled':true}).closest( "label" ).css('color', '#d3d3d3');
    });

    $( "#new_attendance" ).on( "change", "#attendance_attendanted_record",function(){
      // check course group,get all avilable course_name
      var course_name = $('#attendance_attendanted_record option:selected').val();
            // console.log(course_name);
        // check all option of course_unit group,get the units belongs_to the selected course_resources
        // and only make those avilable units show in the coursr_unit select group
          $("#attendance_course_unit_id").val("");
          $("#attendance_course_unit_id option").each(function(){
            //before check avilable unit, set all units show and clear the input field of the course_unit
            $(this).show();
            var a = $(this).val().split(";").slice(-2).pop();
            var unit_course_name = $(this).val().split(";").slice(-2).pop().split(":").slice(-1).pop();
              if (unit_course_name != course_name){
                $(this).hide();
              }
            $( "#new_attendance" ).on( "change", "#attendance_course_unit_id", function() {
              // TITLE:VR level-7;  UNIT_ID:7;  COURSE:Unity3D and C# regular
              $(".attendance_classtimetable input").attr('disabled',false);
              var course_unit_info = $('#attendance_course_unit_id option:selected').val();
              var course_unit_id = course_unit_info.split(";")[0];
                $("input[name='attendance[classtimetable_id]']").each(function(i) {
                  var v=$(this).val();
                  $(this).closest( "label" ).css('color', '#d3d3d3')
                  $(this).attr('disabled',true);
                  $(this).attr('checked', false);
                  var course_unit_array = v.split(";");
                  var course_unit_id_in_classtimetable = parseInt(course_unit_array.slice(-1).pop());
                    // console.log(course_unit_id_in_classtimetable);
                    if (course_unit_id_in_classtimetable == course_unit_id){
                      $(this).closest( "label" ).css('color', 'black');
                      $(this).attr('disabled',false);
                    }
                });
            });
        });
    });

    $( "#edit_attendance" ).on( "change", "#attendance_attendanted_record",function(){
      // check course group,get all avilable course_name
      // var course_name = $('#attendance_attendanted_record option:selected').val();
            // console.log(course_name);
        // check all option of course_unit group,get the units belongs_to the selected course_resources
        // and only make those avilable units show in the coursr_unit select group
          // $("#attendance_course_unit_id").val("");
          $("#attendance_course_unit_id option").each(function(){
            //before check avilable unit, set all units show and clear the input field of the course_unit
            $(this).show();
            var a = $(this).val().split(";").slice(-2).pop();
            var unit_course_name = $(this).val().split(";").slice(-2).pop().split(":").slice(-1).pop();
              if (unit_course_name != course_name){
                $(this).hide();
              }
            $( "#edit_attendance" ).on( "change", "#attendance_course_unit_id", function() {
              // TITLE:VR level-7;  UNIT_ID:7;  COURSE:Unity3D and C# regular
              $(".attendance_classtimetable input").attr('disabled',false);
              var course_unit_info = $('#attendance_course_unit_id option:selected').val();
              var course_unit_id = course_unit_info.split(";")[0];
                $("input[name='attendance[classtimetable_id]']").each(function(i) {
                  // var v=$(this).val();
                  // $(this).closest( "label" ).css('color', '#d3d3d3')
                  $(this).attr('disabled',true);
                  // $(this).attr('checked', false);
                  var course_unit_array = v.split(";");
                  var course_unit_id_in_classtimetable = parseInt(course_unit_array.slice(-1).pop());
                    console.log(course_unit_id_in_classtimetable);
                    if (course_unit_id_in_classtimetable == course_unit_id){

                      $(this).closest( "label" ).css('color', 'black');
                      $(this).attr('disabled',false);
                    }
                });
            });
        });
    });

    $("input.radio_buttons").on("click",function(){
       if($(this).attr('checked') == 'checked') {
        //  alert("it's checked,i set is unchecked now!!! <(");
         $(this).attr('checked',false);
       }else{
        //  alert("it's unchecked,i set is checked now|:< )");
         $(this).attr('checked',true);
       }
     });


    });
