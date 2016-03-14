
	function destroy() {
      	      	$.ajax({
				   url: '<%= destroy_user_session_path %>', 
				   error: function() {
				      console.log("Error!");
				   },
				   success: function(data) {
				      location.reload();
				   },
				   type: 'DELETE'
				});
				}


	