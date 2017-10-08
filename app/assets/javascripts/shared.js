var Reflections = Reflections || {};
Reflections.init = function() {
  $(document).on('turbolinks:load', function() {
    $('.summernote').each(function() {
      if ($(this).is(":visible"))
        $(this).summernote({
          height: 500,                 // set editor height
          minHeight: null,             // set minimum height of editor
          maxHeight: null,             // set maximum height of editor
          focus: true                  // set focus to editable area after initializing summernote
        });
    })
  });
};
