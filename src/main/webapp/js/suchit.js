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
	    $( "#droppableid1" ).droppable({
			accept: "#draggableid2",
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
		$( "#droppableid2" ).droppable({
	    	accept: "#draggableid3",
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
		$( "#droppableid3" ).droppable({
			accept: "#draggableid1",
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