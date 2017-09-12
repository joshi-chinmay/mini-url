$(document).ready(function(){
  $(".generate-url").click(function(event){
    event.preventDefault()
    $(".mini-url-output").html("");
    var mini_url = $("#mini-url").val();
    sendAjax(mini_url);
  });

  var sendAjax = function(mini_url) {
    $.ajax({
      url: "/generate",
      type: "POST",
      dataType: "json",
      data: {mini_url: mini_url},
      success: function(data) {
        if(data.mini_url == undefined || data.mini_url == "") {
          $(".mini-url-output").append( "Either url is invalid or something went wrong." );
        } else {
          $(".mini-url-output").append( window.location.href + data.mini_url );
        }
      },
      error: function(data) {
        console.log(data);
      }
    });
  }
});
