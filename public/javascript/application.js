$(document).ready(function() {

  function getPictures(hashtag) {
    $.ajax({
      method: 'GET',
      url: 'https://api.instagram.com/v1/tags/' + hashtag +'/media/recent?client_id=bba99ee5a512497ea2ba7a18bb2bcd92&',
      dataType: 'jsonp',
      jsonp: 'callback',
      success: function( data ) {
        console.log(data);
        slideShow(data);
      }
    });
  }

  $('#search_form').on('submit', function(e) {
    var hashtag = $('form > #search_field').val();
    e.preventDefault();
    getPictures(hashtag);
  });

var i = 0;

  function slideShow(pictures) {
    if (i < 20) {
      var image = pictures.data[i].images.standard_resolution.url;
      var caption = pictures.data[i].caption.text;
      setTimeout( function() {
        changePicture(image, caption);
        i += 1;
        slideShow(pictures);
      }, 3000 );
    }
  }

  function changePicture(image, caption) {
    $('#frame img').fadeOut(600);
    $('#frame h2').delay(600).remove();
    $('#frame').delay(600).append('<img src="' + image + '"/>');
    $('#frame').delay(600).append('<h2>' + caption + '</h2>');

  }

});
