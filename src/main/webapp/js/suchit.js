$(document).ready(function() {
	$( function() {
	    $( ".draggablebox" ).draggable({
	    	revert : function(event, ui) {
	            $(this).data("uiDraggable").originalPosition = {
	                top : 0,
	                left : 0
	            };
	            return !event;
	        },
	        snap: true,
            snapMode: "inner",
            snapTolerance: 30
	    });
	    $( ".droppablebox" ).droppable({
	    	drop: function(event, ui) {
	    	    var $this = $(this);
	    	    ui.draggable.position({
	    	      my: "center",
	    	      at: "center",
	    	      of: $this,
	    	      using: function(pos) {
	    	        $(this).animate(pos, 200, "linear");
	    	      }
	    	    });
	    	  }
	    });
	  } );
});