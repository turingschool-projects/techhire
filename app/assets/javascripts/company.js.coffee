jQuery ->
  cities = $('#company_city').html()
  $('#company_state').change ->
    state = $('#company_state :selected').text()
    options = $(cities).filter("optgroup[label='#{state}']").html()
    if options
      $('#company_city').html(options)
    else
      $('#company_city').empty()
