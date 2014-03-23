window.Blogocalypse = window.Blogocalypse || {};

Blogocalypse.editor = function($editor){
    this.initEditor();
    this.initImagePicker();
};

Blogocalypse.editor.attach = function(){
    if (jQuery("#wmd-input").size() === 0) return;

    new Blogocalypse.editor();
}

jQuery.extend(Blogocalypse.editor.prototype, {
    initImagePicker: function(){
        var $imagePicker = jQuery("#usb_post_image_picker");
        this.imagePicker = new Blogocalypse.imagePicker($imagePicker);
    },

    initEditor: function(){
        var self = this;
        var converter1 = new Markdown.Converter()

        this.editor = new Markdown.Editor(converter1);
        this.editor.hooks.set("insertImageDialog", this.insertImageDialog.bind(this));
        this.editor.run();
    },

    insertImageDialog: function(callback){
        this.imagePicker.open(callback);

        // go away overlay
        jQuery(".wmd-prompt-background").hide(0);

        return true;
    }
});

jQuery(document).ready(Blogocalypse.editor.attach);
jQuery(document).on('page:load', Blogocalypse.editor.attach);
