$(document).ready(function(){
  $('#org_type').change(function() {
    if($(this).val() === 'Other') {
      $('#org_type_other').fadeIn();
    } else {
      $('#org_type_other').fadeOut();
    }
  });

  $('.registration-submit').click(function(){
    if($('#org_type').val() === 'Other') {
      var org_type = $('#organization_type_other').val();
    } else {
      var org_type = $('#org_type').val();
    }
    $('#company_organization_type').val(org_type);
  });
});
