$(document).ready(function(){
  $('#org_type').change(function() {
    if($(this).val() === 'Employer') {
      $('#employer_fields').fadeIn();
    } else {
      $('#employer_fields').fadeOut();
    }

    if($(this).val() === 'Other') {
      $('#org_type_other').fadeIn();
      $('#organization_type_other').attr('required', true);
    } else {
      $('#org_type_other').fadeOut();
      $('#organization_type_other').attr('required', false);
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
