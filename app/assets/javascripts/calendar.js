$(document).on('ready page:load', function(){
    $('#calendar').fullCalendar({
        dayClick: function(date, jsEvent, view) {
            var user_id = $('#page_set').val()
            var day = $(this).data("date")
            var guest = $('#guest_user').val()
            // var top = $(this).offset().top
            // var left = $(this).offset().left
            // var top = top * 0.8
            // var left = left * 0.8
            var image = $("#" + day).val()

            if (guest == "guest") {
              $('#comment_content').removeClass('hide')
              // $('#comment_content').css({'left': left, 'top': top});
              $('#comment_content').prepend('<img class="photo" style="background-image: url('+image+')" />')
            } else {
              if ($(this).children().hasClass('photo')) {
                var id = document.getElementById(day).name
                window.location = "/users/" + user_id + "/memories/" + id + "/edit?date=" + date.format()
              }else {
                window.location = "/users/" + user_id + "/memories/new?date=" + date.format()
              }
            }
            }
            });

        $('.fc-day').each(function(){
          var date = $(this).data("date")
          var image = $("#" + date).val()
          if(image){
            $(this)
            .html('<img class="photo"  style="background-image: url('+image+')" />');
          }
        });
    // $('body').on('click', function() {
    //   $('#comment_content').addClass('hide')
    // })
});
