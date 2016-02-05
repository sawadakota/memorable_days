$(document).on('ready page:load', function(){
    $('#calendar').fullCalendar({
        dayClick: function(date, jsEvent, view) {
            var user_id = $('#page_set').val()
            window.location = "/users/" + user_id + "/memories/new?date=" + date.format()
            }
            });

        $('.fc-day').each(function(){
          var date = $(this).data("date")
          var image = $("#" + date).val()
          if(image){
            $(this)
            .html('<img class="photo"  src="'+image+'" />');
          }
        });

});
