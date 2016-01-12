$(document).ready(function(){
		$('.vote-button').click(function(event){
				event.preventDefault();
				$.ajax({
						url: $(this).attr('href'),
						method: $(this).data("method"),
						success: function(response){
							$(this).text("changed")
						}
					})
			})
	})