/*
 //
 */

$(document).ready(function () {
	/* CSRF Protection */
	var token = $('meta[name="csrf-token"]').attr('content');
	if (token) {
		$.ajaxSetup({
			headers: {'X-CSRF-TOKEN': token}
		});
	}
	
	$('.phoneBlock').click(function (e) {
		e.preventDefault(); /* prevents the submit or reload */
		
		showPhone();
		
		return false;
	});
});

/**
 * Show the Contact's phone
 * @returns {boolean}
 */
function showPhone() {
	if ($('#postId').val() == 0) {
		return false;
	}
	
	$.ajax({
		method: 'POST',
		url: siteUrl + '/ajax/post/phone',
		data: {
			'postId': $('#postId').val(),
			'_token': $('input[name=_token]').val()
		}
	}).done(function (data) {
		if (typeof data.phone == "undefined") {
			return false;
		}
		
		$('.phoneBlock').html('<i class="icon-phone-1"></i> ' + data.phone);
		$('.phoneBlock').attr('href', data.link);
		/* $('.phoneBlock').tooltip('disable'); */
		$('.phoneBlock').tooltip('dispose');
		
		$('#postId').val(0);
	});
}
