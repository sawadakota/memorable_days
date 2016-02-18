$(document).on('ready page:load', function(){
  var num = 0
  if num {
    while (num < gon.follows_count){
      var top = Math.random() * (500 - 0)
      var left = Math.random() * (900 - 0)
      $('img', '#mini_user_image' + num).css("top", top);
      $('img', '#mini_user_image' + num).css("left", left);
      $('img', '#user_image' + num).css("top", top);
      $("img", '#user_image' + num).css("left", left);
      num += 1
  }
  }
}
);
