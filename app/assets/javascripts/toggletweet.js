$(function() {
  $(".tweet-data").hide();
  $(".tweet-toggle").click(function() {
    $(this).next().slideToggle().siblings(".tweet-data").slideUp();
  });
});
