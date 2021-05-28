$(document).ready(function(){

$('body').on('click', '.data-btn',function(){
    var name = $('.room_name').val();
    $.ajax({
     type: "POST",
     url: "/rooms/create_room",
     dataType: "json",
     data: {room_name: name}
    })
  })

});