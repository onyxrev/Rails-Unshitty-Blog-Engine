window.Blogocalypse = window.Blogocalypse || {};
Blogocalypse.editor = function(){
    var $editor = jQuery("#wmd-input");

    if ($editor.size() === 0) return;

    var converter1 = new Markdown.Converter()
    var editor1 = new Markdown.Editor(converter1);

    editor1.run();
};

jQuery(document).ready(Blogocalypse.editor);
jQuery(document).on('page:load', Blogocalypse.editor);
