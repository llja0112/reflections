var Reflections = Reflections || {};
Reflections.init = function() {
  $('.summernote').each(function(){
    $(this).summernote({
      height: 500,                 // set editor height
      minHeight: null,             // set minimum height of editor
      maxHeight: null,             // set maximum height of editor
      focus: true                  // set focus to editable area after initializing summernote
    });
  });
};
