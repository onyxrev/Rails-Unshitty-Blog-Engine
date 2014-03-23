window.Blogocalypse = window.Blogocalypse || {};


Blogocalypse.fullscreen = function(anchor){
    this.$anchor = jQuery(anchor);
    this.$target = jQuery(this.$anchor.attr("data-usb-fullscreen"));
    this.$close  = this.$target.find(".usb-fullscreen-close");

    this.bind();
};

Blogocalypse.fullscreen.attach = function(){
    jQuery("a[data-usb-fullscreen]").each(function(){
        new Blogocalypse.fullscreen(this);
    });
};

jQuery.extend(Blogocalypse.fullscreen.prototype, {
    bind: function(){
        this.$anchor.click(this.toggle.bind(this));
        this.$close.click(this.toggle.bind(this));
    },

    toggle: function(){
        this.$target.toggleClass("open closed");
    }
});

jQuery(document).ready(Blogocalypse.fullscreen.attach);
jQuery(document).on('page:load', Blogocalypse.fullscreen.attach);
