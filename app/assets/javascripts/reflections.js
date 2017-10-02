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

    $('#share_input')
    .on('tokenfield:createdtoken', function (e) {
      var valid = e.attrs.hasOwnProperty('id');
      if (!valid) {
        $(e.relatedTarget).addClass('invalid');
      }
    })
    .tokenfield({
      typeahead: [{
        minLength: 3
      }, {
        displayKey: 'value',
        source: names.ttAdapter()
      }]
    })
    .tokenfield('setTokens', JSON.parse( $('#share_input').attr('data-personals') ));

    $('#share_btn').click(function(){
      var tokens = $('#share_input').tokenfield('getTokens');
      tokens = tokens.filter(function(token){
        return token.hasOwnProperty('id');
      });
      $('#privacy_input').attr('value', JSON.stringify(tokens))
      $('#privacy_form').submit();
    });
  }
}
