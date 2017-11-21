	$(document).ready(
				
				
				function() {
					// Basic
					$('.dropify').dropify();

					// Used events
					var drEvent = $('.dropify-event').dropify();

					drEvent.on('dropify.beforeClear', function(event, element) {
						return confirm("Do you really want to delete \""
								+ element.filename + "\" ?");
					});

					drEvent.on('dropify.afterClear', function(event, element) {
						alert('File deleted');
					});
		});

		// Basic

		$('#date-demo1').formatter({
			'pattern' : '{{9999}}-{{99}}-{{99}}',
		});

		// Advanced

		$('#phone-demo').formatter({
			'pattern' : '({{999}}) {{999}}-{{999}}',
			'persistent' : true
		});

		$('.datepicker').pickadate({
			min : new Date(),
		});

		$('.datepicker').pickadate({
			selectMonths : true, // Creates a dropdown to control month
			selectYears : 15
		// Creates a dropdown of 15 years to control year
		});

		
		
		
		
		