var Reflections = Reflections || {};
Reflections.reflections = Reflections.reflections || {};

Reflections.reflections.show = {
  init: function() {
    var names = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
        url: '/users/typeahead/%QUERY',
        wildcard: '%QUERY'
      }
    });

    // $('#review_input').typeahead({
    //   minLength: 3
    // }, {
    //   displayKey: 'user_details',
    //   source: names.ttAdapter()
    // });

    $('#review_input').tokenfield({
      typeahead: [{
        minLength: 3
      }, {
        displayKey: 'value',
        source: names.ttAdapter()
      }]
    });
  }
}
