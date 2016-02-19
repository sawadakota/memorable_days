$(document).on('ready page:load', function(){
    $(document).on("keypress", "input:not(.allow_submit)", function(event) {
      return event.which !== 13;
    });
    $('#calendar').fullCalendar({
        dayClick: function(date, jsEvent, view) {
            var user_id = $('#page_set').val()
            var day = $(this).data("date")
            var guest = $('#guest_user').val()
            var image = $("#" + day).val()
            var num = 0
            // var top = $(this).offset().top
            // var left = $(this).offset().left
            // var top = top * 0.8
            // var left = left * 0.8
            if (guest == "guest") {
              Object.keys(gon.memory_images).forEach(function (key) {
              if (key == day && guest == "guest") {
                  $('#comment_content').removeClass('hide')
              // $('#comment_content').css({'left': left, 'top': top});
                  $('#comment_content').prepend('<img class="modal_image" style="background-image: url('+ gon.memory_images[key]+')" />')
                  $.each(gon.tag_image[day + "image"] , function(){
                    $('#comment_image').append('<a href= /users/'+ gon.tag_user_id[day + "id"][num] +' ><img class="mini_user_image" style="background-image: url('+ this +')" /></a>')
                    num += 1
                  })
                  $(".comment_form").append('<form action="/users/' + gon.current_user + '/memories/' + gon.memory_id[day] + '/comments" method="post"><input type="text" name="text" size="30"><input hidden value='+ $("#authenticity_token").val() + ' name="authenticity_token" /><input type="submit"></form>')
                  var sum = 0
                  $.each(gon.comments[day + "comments"], function(){
                    $(".comment_form").append("<p>" + gon.comments[day + "comments"][sum]["text"] + "</p>")
                    sum += 1
                  })
              }
            })
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
});
