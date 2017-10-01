var Reflections = Reflections || {};
Reflections.reflections = Reflections.reflections || {};

Reflections.reflections.show = {
  init: function() {
    // console.log('Hello');
    var names = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('user_details'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
        url: '/users/typeahead/%QUERY',
        wildcard: '%QUERY'
      }
    });

    // console.log(numbers.ttAdapter);

    $('.example-numbers').typeahead({
      minLength: 3
    }, {
      displayKey: 'user_details',
      source: names.ttAdapter()
    });
  }
}
