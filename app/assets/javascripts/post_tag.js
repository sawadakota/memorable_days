$(".tag_friend").on('click', function(){
  $.ajax({
    url: "add_tag_user",
    type: "GET",
  })
  $("#tag_friend").append()
})
