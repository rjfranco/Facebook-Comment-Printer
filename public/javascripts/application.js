// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$('document').ready( function() {
	if (window.print) {
		$('section.body.comments').prepend('<a href="javascript:void(0)" class="print">Print This</a>');
	}
	$('a.print').live('click', function() {
		window.print();
	});
});