$(document).ready(function(e) {
	var formChanged = false;
	$(':input').change(function() {
		formChanged = true;
	});

	function saveUiDataState() {
		$.uiSave.saveState([ $('#formMain') ]);
	}

	function openPage() {
		$('<input>').attr({
			type : 'hidden',
			name : 'pageNext',
			value : '00',
		}).appendTo($('#formMain'));
		$('#formMain').trigger('submit');
	}
	// click to logo: save info and redirect to portal screen
	$('.site_title').off('click').click(function() {
		if (formChanged) {
			console.log('ch');
			openPage();
		} else
			console.log('n ch');
	});
});