$(document).on('ready page:load', function(){
    $('#calendar').fullCalendar({
       events: '/events.json',
        selectable: true,
        selectHelper: true,
        select: function(start, end, allDay) {
            $.ajax({
              url: "new/user.id/memories",
              type: "GET",
              data: ("keyword=" + input)
            });
        },
        dayClick: function(date, jsEvent, view) {
            var user_id = $('#page_set').val()
            alert(user_id);
            window.location = "/users/" + user_id + "/memories/new?date=" + date.format()
            // change the day's background color just for fun
            }
            });
        });
