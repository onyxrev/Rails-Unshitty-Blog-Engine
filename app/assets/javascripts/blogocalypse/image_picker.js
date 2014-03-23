Blogocalypse.imagePicker = function(el, options){
    this.options  = options || {};

    this.$element  = jQuery(el);
    this.$uploader = this.$element.find(".usb-image-uploader");
    this.$close    = this.$element.find(".usb-fullscreen-close");

    this.bind();
    this.initUploader();
};

jQuery.extend(Blogocalypse.imagePicker.prototype, {
    bind: function(){
        this.$element.on("click", ".usb-image-insert", this.pick.bind(this));
        this.$element.on("click", ".usb-image-delete", this["delete"].bind(this));

        this.$close.click(this.close.bind(this));
    },

    initUploader: function(){
        this.uploader = new Blogocalypse.upload(this.$uploader);
    },

    pick: function(ev){
        if (jQuery.isFunction(this.options.onPick)){
            var $imageLink = $(ev.currentTarget);
            var id         = $imageLink.data("id");
            var markdown   = this.generateImageMarkdown(id);

            this.options.onPick(markdown, $imageLink, id);
            this.close();
        }
    },

    delete: function(ev){
        if (confirm("Are you sure you want to delete this image?")){
            var $imageLink = $(ev.currentTarget);
            var $image     = $imageLink.parents(".usb-image-pick:first");
            var url        = $imageLink.attr("href");

            $.ajax(url, {
                method:  "DELETE",
                success: this.onDelete.bind($image),
                error:   this.onError.bind(this)
            });
        }

        return false;
    },

    onDelete: function(){
        this.slideUp(100, this.remove);
    },

    onError: function(){
        alert("An unexpected error occured.");
    },

    open: function(onPick){
        this.options.onPick = onPick;
        this.$element.addClass("open").removeClass("closed");
    },

    close: function(){
        this.options.onPick = null;
        this.$element.addClass("closed").removeClass("open");
    },

    generateImageMarkdown: function(id, alt, title, dimensions){
        return ["image_id:", id].join("");
    }
});
