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

  $('#it_category_other').change(function() {
    if($(this)[0].checked) {
      $('#it_category_other_description').fadeIn();
    } else {
      $('#it_category_other_description').fadeOut();
    }
  });

  $('#participate_other').change(function() {
    if($(this)[0].checked) {
      $('#participate_other_description').fadeIn();
    } else {
      $('#participate_other_description').fadeOut();
    }
  });

  $('#commit_internship').change(function() {
    if($(this)[0].checked) {
      $('#commit_internship_description').fadeIn();
    } else {
      $('#commit_internship_description').fadeOut();
    }
  });

  $('#commit_fulltime').change(function() {
    if($(this)[0].checked) {
      $('#commit_fulltime_description').fadeIn();
    } else {
      $('#commit_fulltime_description').fadeOut();
    }
  });

  $('div .checkbox-exclusive').click(function() {
    checkedState = $(this)[0].checked;
    $(this).parent('div').children('.checkbox-exclusive:checked').each(function () {
      $(this).attr('checked', false);
    });
    $(this)[0].checked = checkedState;
  });

  $('#plan_other_doing').change(function() {
    if($(this)[0].checked) {
      $('#plan_other_description').fadeIn();
    } else {
      $('#plan_other_description').fadeOut();
    }
  });
  $('#plan_other_will_do').change(function() {
    if($(this)[0].checked) {
      $('#plan_other_description').fadeIn();
    } else {
      $('#plan_other_description').fadeOut();
    }
  });
  $('#source_other_doing').change(function() {
    if($(this)[0].checked) {
      $('#source_other_description').fadeIn();
    } else {
      $('#source_other_description').fadeOut();
    }
  });
  $('#source_other_will_do').change(function() {
    if($(this)[0].checked) {
      $('#source_other_description').fadeIn();
    } else {
      $('#source_other_description').fadeOut();
    }
  });
  $('#attract_other_doing').change(function() {
    if($(this)[0].checked) {
      $('#attract_other_description').fadeIn();
    } else {
      $('#attract_other_description').fadeOut();
    }
  });
  $('#attract_other_will_do').change(function() {
    if($(this)[0].checked) {
      $('#attract_other_description').fadeIn();
    } else {
      $('#attract_other_description').fadeOut();
    }
  });
  $('#evaluate_other_doing').change(function() {
    if($(this)[0].checked) {
      $('#evaluate_other_description').fadeIn();
    } else {
      $('#evaluate_other_description').fadeOut();
    }
  });
  $('#evaluate_other_will_do').change(function() {
    if($(this)[0].checked) {
      $('#evaluate_other_description').fadeIn();
    } else {
      $('#evaluate_other_description').fadeOut();
    }
  });
  $('#retain_other_doing').change(function() {
    if($(this)[0].checked) {
      $('#retain_other_description').fadeIn();
    } else {
      $('#retain_other_description').fadeOut();
    }
  });
  $('#retain_other_will_do').change(function() {
    if($(this)[0].checked) {
      $('#retain_other_description').fadeIn();
    } else {
      $('#retain_other_description').fadeOut();
    }
  });

});
