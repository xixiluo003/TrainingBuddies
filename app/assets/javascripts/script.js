$(document).on('turbolinks:load', function() {
  console.log("jQuery/document/ready");


// ======= ======= calendar ======= =======
  var group_id = $('#groupID').val();

  $('#calendar').fullCalendar({
    eventSources: [{
      url: '/getevents',
      type: 'GET',
      data: {
       group_id: group_id
      },
      error: function() {
         alert('there was an error while fetching events!');
      },
      color: 'yellow',
      textColor: 'black'
    }]
  });



});
