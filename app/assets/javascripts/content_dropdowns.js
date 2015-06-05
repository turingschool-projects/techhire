$("document").ready(function() {
    $(".content-dropdown-toggle").click(function(e) {
        e.preventDefault();
        $(".content-dropdown").hide();
        var $target = $($(this).data("dd-target"));
        $target.slideToggle();
    });
});
