jQuery ->
  $('#company_city').parent().hide()
  cities = $('#company_city').html()
  $('#company_state').change ->
    state = $('#company_state :selected').text()
    options = $(cities).filter("optgroup[label='#{state}']").html()
    if options
      $('#company_city').html(options)
      $('#company_city').parent().show()
    else
      $('#company_city').empty()
      $('#company_city').parent().hide()
