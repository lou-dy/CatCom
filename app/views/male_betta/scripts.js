// Twitter
!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');

//Lightbox Script
$(document).on('click', '[data-toggle="lightbox"]', function(event) {
              event.preventDefault();
              $(this).ekkoLightbox();
          });

$(document).ready(function(){
  //smooth scrolling
  var $root = $('html, body');
  $('.navbar-nav a').click(function() {
    var href = $.attr(this, 'href');
    if (href != undefined ) {
      $root.animate({
        scrollTop: $(href).offset().top
      }, 500, function () {
        window.location.hash = href;
      });
    }
    return false;
  });

  //Tooltips
  $(function () {
    $('#Tooltip1').tooltip();
  });
  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });

  // submit
  $('#button').on('click', function() {
    var comment = $('.message-box').val();
    if(comment==="") {
      $(".message-box").css("border", "2px solid red");
      return false;
    }
    else {
      $('#visible-comment').html("We have received your message: " + comment);
      $('.message-box').hide();
      console.log(comment);
      return false;
    }
  });

  // Message Box Character Count
  $(".message-box").on("keyup", function() {
    console.log("keyup happened"); //here we make sure we're catching the keyup
    // in here is where the rest of our code for this Exercise will go
    var charCount = $(".message-box").val().length; //here we set the length of the content of the textarea to a variable
    console.log(charCount); //here we make sure we set it to the right value
    $("#char-count").html(charCount);

    if(charCount > 100) {
      $("#char-count").css("color", "red");
    } else {
       // normal color
    };
  });


  //////// WORK SECTION ////////
  // console.log(worksample);

  for (var i = 0; i < websample.length; i++){
    $("#websamples").append('\
      <div class="col-md-4">\
        <a href="' + websample[i].link +'" class="work-img" target="_blank" data-toggle="tooltip" data-placement="bottom" title="Open Project">\
          <img class="img-responsive workpic" src="' + websample[i].pic + '">\
          <span class="info"><p class="proj-title"> Title:</p> ' + websample[i].title + ' </span>\
        </a>\
      </div>\
    ')
  };

  for (var i = 0; i < imgsample.length; i++){
    $("#imagesamples").append('\
      <div class="col-xs-6 col-md-3">\
        <a href="' + imgsample[i].link + '" class="work-img" data-toggle="lightbox" data-gallery="' + imgsample[i].gallery + '">\
          <img src="' + imgsample[i].thumb + '" class="img-fluid" data-toggle="tooltip" data-placement="top" title="Expand Image">\
          <span class="info"><p class="proj-title"> Title:</p> ' + imgsample[i].title + ' </span>\
        </a>\
      </div>\
    ')
  };

  for (var i=0; i< demsample.length; i++){
    $("#demosamples").append('\
    <iframe src="' + demsample[i].link + '" width="720" height="480" frameborder="0"\
    webkitallowfullscreen mozallowfullscreen allowfullscreen>\
    </iframe>\
    ')
  }

  var sidebar = new StickySidebar('#sidebar', {
      containerSelector: '#Work',
      innerWrapperSelector: '.sidebar__inner',
      topSpacing: 50,
      bottomSpacing: 20,
      ResizeSensor: true
  });

  $(".work-img").mouseenter( function() {
    // console.log(this);
    $(".info", this).show();
  }).mouseleave(function(){
    $(".info", this).hide();
  });

  var rellax = new Rellax('.rellax');
});



////////Google Maps API////////
var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 33.3385369, lng: -111.8175448},
    zoom: 9
  });
}

// var myName = "Louise";
// function sayHello(name) {
//     alert("Hello " + name);
// };
// sayHello(myName.toUpperCase());
