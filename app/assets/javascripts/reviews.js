var Reflections = Reflections || {};
Reflections.reviews = Reflections.reviews || {};

Reflections.reviews.show = {
  init: function() {
    $('#review_button').click(function(e){
      e.preventDefault();
      if( $('#review_status').attr('value') == 'Incomplete' ){
        $('#review_status').attr('value', 'Complete');
      } else {
        $('#review_status').attr('value', 'Incomplete');
      }
      $('#review_form').submit();
    })
  }
}
