$(document).on('ready page:load', function(){
    $('#calendar').fullCalendar({
        dayClick: function(date, jsEvent, view) {
            var user_id = $('#page_set').val()
            var day = $(this).data("date")
            if ($(this).children().hasClass('photo')) {
              var id = document.getElementById(day).name
              window.location = "/users/" + user_id + "/memories/" + id + "/edit/"
            }else {
              window.location = "/users/" + user_id + "/memories/new?date=" + date.format()
            }
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

