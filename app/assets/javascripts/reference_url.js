$(document).ready(function(){
  $(".generate-url").click(function(event){
    event.preventDefault();
    $(".mini-url-output").html("");
    var mini_url = $("input[type=url]").val();
    generateMiniUrl(mini_url);
  });

  $(".convert-url").click(function(event){
    event.preventDefault();
    $(".mini-url-output").html("");
    var mini_url = $("input[type=url]").val();
    var code = mini_url.replace(window.location.origin + "/", "")
    if(code.length == 10) {
      convertMiniUrl(code);
    } else {
      $(".mini-url-output").append("Sorry we could not find matching entry in the database.");
    }
  });

  var generateMiniUrl = function(mini_url) {
    $.ajax({
      url: "/generate",
      type: "post",
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

  var convertMiniUrl = function(mini_url) {
    $.ajax({
      url: "/convert/" + mini_url,
      type: "get",
      dataType: "json",
      success: function(data) {
        if(Object.keys(data).length === 0 && data.constructor === Object) {
          $(".mini-url-output").append("Sorry we could not find matching entry in the database.");
        } else {
          $(".mini-url-output").append( data.associated_url );
        }
      },
      error: function(data) {
        console.log(data);
      }
    });
  }
});
