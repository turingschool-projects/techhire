$(document).ready(function(){
  $(document).on('click', '.deleteBtn', function() {
    var contentId = "contents/" + $(this).data('id');
    $('.modal-footer #contentID').attr('href', contentId);
  });
});