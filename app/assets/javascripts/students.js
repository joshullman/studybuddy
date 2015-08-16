// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
console.log("HIIIIII");

// var showStudentsAssignments = {
//   init: function{

//   }
// }

$(document).ready(function(){
  // $('#classlist').on('change', function(){
  //   var clss = this.selectedOptions.first
  // })
})

$(document).on('page:change',function(){

  $('#classlist').on('change', function(event){
    event.preventDefault();
    var clss = this.selectedOptions[0];
    var current_path = window.location.pathname
    var request = $.ajax({
      url:  current_path + '/class_assignments/' + clss.value,
      data: clss.value,
    })
    request.done(function(response){
      console.log("THIS IS THE RESPONSE");
      console.log(response);
      $('.class_assignments').append(response);
      // $('.class_assignments').append("<%= render partial: 'students/class_assignments', locals: {student_class_assignments:" +  response + "} %>");

    })
    request.fail(function(response){
      console.log('ERROR' + response);
    })
  })
})
