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
//= require bootstrap-sprockets

// You may include any languages (optional)
//= require jquery_ujs
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

    $( "#datepicker_date_enrollment" ).datepicker({
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
        $( "#datepicker_date_enrollment" ).datepicker( "option", "minDate", selectedDate );
      }
    });

    // flash notice and alert click fadeOut
    $(".notice").on("click",function(){
      $(this).parent().fadeOut("20");
    });


    $("#add_new_attendance_button").on('click',function(e){
      e.preventDefault;
      $("#attendance_course_unit_id").val('');
      $("input.radio_buttons").attr({'checked':false,'disabled':true}).closest( "label" ).css('color', '#d3d3d3');
    });

    $( "#new_attendance" ).on( "change", "#attendance_course_unit_id", function() {
      var course_unit_info = $('#attendance_course_unit_id option:selected').val();
      // console.log(course_unit_info);
      var course_unit_id = course_unit_info.split(";")[0];
        $("input[name='attendance[classtimetable_id]']").each(function(i) {
          var v=$(this).val();
          $(this).closest( "label" ).css('color', '#d3d3d3');
          $(this).attr('disabled',true);
          $(this).attr('checked', false);
          var course_unit_array = v.split(":");
          var course_unit_id_in_classtimetable = parseInt(course_unit_array.slice(-1).pop());
            // console.log(course_unit_id_in_classtimetable);
            if (course_unit_id_in_classtimetable == course_unit_id){
              $(this).closest( "label" ).css('color', 'black');
              $(this).attr('disabled',false);
            }
        });
    });

    $("#myupdate_a").on( "change", "#attendance_course_unit_id", function() {

      // check course group,get all avilable course_name
      $(".attendance_classtimetable input").attr('disabled',true);
          var course_unit_info = $("#attendance_course_unit_id option:selected").val();
          $("#attendance_course_unit_id option").each(function(){
            //before check avilable unit, set all units show and clear the input field of the course_unit
            var course_unit_id = course_unit_info.split(";")[0];
              $("input[name='attendance[classtimetable_id]']").each(function(i) {
                var v=$(this).val();
                $(this).closest( "label" ).css('color', '#d3d3d3')
                $(this).attr('disabled',true);
                $(this).attr('checked',false);
                var course_unit_array = v.split(":");
                var course_unit_id_in_classtimetable = parseInt(course_unit_array.slice(-1).pop());
                  if (course_unit_id_in_classtimetable == course_unit_id){
                    $(this).closest( "label" ).css('color', 'black');
                    $(this).attr('disabled',false);
                    // $(this).attr('checked',true);
                  }
              });
            });
      });



    $( "#attendance_update_button" ).on( "click",function(){
      // e.preventDefault;
      // disable all classtimetable inputcheck course group,get checked unit id
      $(".attendance_classtimetable input").attr('disabled',true);
      var course_unit_info = $('#attendance_course_unit_id option:selected').val();
      var course_unit_id = course_unit_info.split(";")[0];
      $("#attendance_course_unit_id option").each(function(){
        //before check avilable unit, set all units show and clear the input field of the course_unit
        $("input[name='attendance[classtimetable_id]']").each(function(i) {
          var v=$(this).val();
          $(this).closest( "label" ).css('color', '#d3d3d3')
          $(this).attr('disabled',true);
          // $(this).attr('checked', false);
          var course_unit_array = v.split(":");
          var course_unit_id_in_classtimetable = parseInt(course_unit_array.slice(-1).pop());
            // console.log(course_unit_id_in_classtimetable);
            if (course_unit_id_in_classtimetable == course_unit_id){
              $(this).closest( "label" ).css('color', 'black');
              $(this).attr('disabled',false);
              $(this).attr('checked',true);
            }
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

     $("#update_attendance_close").on("click",function(){
      $(".edit_attendance")[0].reset();
     });

    $('td#show_class_days').hover(function() {
      $('div#pop-up',this).show();
    });


    $("td#show_class_days").mouseleave(function(){
      $('div#pop-up',this).hide();
    });

    $(".guide-container").hover(function(){
      // $(this).find(".golden-div").hide();
      $(this).find(".golden-div-hover").show();
    });

    $(".guide-container").mouseleave(function(){
      // $(this).find(".golden-div").show();
      $(this).find(".golden-div-hover").hide();
    });

    $(".program_container").on('click',function(){
      // e.preventDefault();
      // console.log('pro_id');
      var pro_id='#'+$(this).attr('id');
      highlight_p_c(pro_id);
    });

    var highlight_p_c=function(pro_id){
      // console.log(pro_id);
      $(".program_container").css('background-color','white').next("#arrow_container").hide();
      // var program=$(pro_id).find(".program_name").html().split(' ').join('');
      $(pro_id).css('background-color','rgba(238, 169, 39, 0.6)');
      $('.arrow').addClass('test');
      // console.log('here');
      $(pro_id).closest('.program_container');
      $(pro_id).next('#arrow_container').show();
      find_course(pro_id);
    }

    var find_course=function(pro_id){
      $(".get_class_li").each(function(){
        var course_all=$(this).html().toLowerCase();
        // console.log(course_all);
        if (course_all.search(pro_id.replace('#',''))!=-1) {
          $(this).parent().attr('disabled', false).css('background-color','rgba(238, 169, 39, 0.6)');
          $(this).parent().find('a').unbind('click', false);
        }else{
          // $(this).parent().attr('disable','disabled');
          $(this).parent().attr("disabled","disabled").css('background-color','white');
          $(this).parent().find('a').bind('click', false);
          // $(this).siblings().removeAttr('disabled');
        }
      });
    }
});

// = require bootstrap-datetimepicker
// = require pickers
