window.Blogocalypse = window.Blogocalypse || {};

Blogocalypse.upload = function(el){
    this.$element = jQuery(el);

    this.$element.find(".file").fileupload({
        done:     this.onUpload.bind(this)
    }).bind("fileuploadchange", this.onChange.bind(this));

    this.bindings();
};

jQuery.extend(Blogocalypse.upload.prototype, {
    bindings: function(){
        this.$element.find(".file").click();
    },

    onChange: function(){
        this.toggleSpinner(true);
    },

    onUpload: function(e, rsp){
        this.toggleSpinner(false);
        this.renderImage(rsp.result);
    },

    toggleSpinner: function(visible){
        this.$element.find(".spinner")[visible ? "show" : "hide"](0);
    },

    renderImage: function(html){
        this.$element.parents("form:first")[0].reset();
        jQuery(".usb-images-pick").prepend(html);
    }
});
