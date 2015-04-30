$(document).ready(function(){
	function showBySearchTerm(listLinks, searchMatch){
		listLinks.each(function (index, element){
			if($(element).text().match(searchMatch)) {
				$(element).show();
			} else {
				$(element).hide();
			}
		});
	}

	$('#filter-pdfs').click(function(){
		var filterBy = $('#pdf_file_name').val()
		var $listLinks = $('.all-pdfs .PDFs')
		var searchMatch = new RegExp(filterBy, "i")
		showBySearchTerm($listLinks, searchMatch);
	});
});
