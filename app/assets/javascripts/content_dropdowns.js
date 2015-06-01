$("document").ready(function() {
    $(".content-dropdown-toggle").click(function(e) {
        e.preventDefault();
        var $target = $($(this).data("dd-target"));
        console.log($(this).data("dd-target"));
        $target.slideToggle();
    });
});
