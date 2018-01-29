jQuery(document).ready(function() {

  $('.textShow').hide();
  $('.showDate').hide();

  $('.textShow').first().show();
  $('.showDate').first().show();

  var textArray = document.querySelectorAll('.textShow'), i;
  //console.log(textArray);
  var length = textArray.length;
  //console.log(length);

  var rindex = 0;
  var dindex = 0;

  $('#slider-next').click(function(event) {
    $('.annText span').eq(rindex).hide();
    rindex == length-1? rindex=0 :rindex++;
    $('.annText span').eq(rindex).fadeIn(1000);

    $('.annDate span').eq(dindex).hide();
    dindex == length-1? dindex=0 :dindex++;
    $('.annDate span').eq(dindex).fadeIn(1000);
  });

  $('#slider-prev').click(function(event) {
    $('.annText span').eq(rindex).hide();
    rindex == length-1? rindex=length-1 :rindex--;
    $('.annText span').eq(rindex).fadeIn(1000);

    $('.annDate span').eq(dindex).hide();
    dindex == length-1? dindex=length-1 :dindex--;
    $('.annDate span').eq(dindex).fadeIn(1000);
  });

});
