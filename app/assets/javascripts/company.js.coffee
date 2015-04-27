jQuery ->
  cities = $('#company_city').html()
  $('#company_state').change ->
    state_abbr = $('company_state :selected').text()
    debugger;
    options = $(cities).filter("optgroup[label='#{state}']").html()
    if options
      $('#company_city').html(options)
    else
      $('#company_city').empty()
