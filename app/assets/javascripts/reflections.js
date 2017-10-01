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

Reflections.reflections.privacy = {
  init: function() {
    var names = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: {
        url: '/users/typeahead/%QUERY',
        wildcard: '%QUERY'
      }
    });

    $('#share_input').tokenfield({
      typeahead: [{
        minLength: 3
      }, {
        displayKey: 'value',
        source: names.ttAdapter()
      }]
    });

    $('#share_btn').click(function(){
      console.log('clicked');
      var tokens = $('#share_input').tokenfield('getTokens');
      $('#privacy_input').attr('value', JSON.stringify(tokens))
      $('#privacy_form').submit();

      // var form = $('<form></form>');
      // form.attr("method", "post");
      // form.attr("action", '/reflections/authorise');
      // var field = $('<input></input>');
      // field.attr("type", "hidden");
      // field.attr("name", "users");
      // field.attr("value", tokens.stringify);
      // form.append(field);
    });
  }
}
