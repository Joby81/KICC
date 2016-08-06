$(document).ready(function() {
	var value1 = false;
	var value2 = false;
	var value3 = false;
	var dropped1 = false;
	var dropped2 = false;
	var dropped3 = false;
	displayResult();
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
			accept: ".draggablebox",
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
				dropped1 = true;
				//alert(ui.draggable.attr("id"));
				if(ui.draggable.attr("id") == "draggableid2") {
					value1 = true;
				}
				displayResult();
	    	  },
			out: function(event, ui) {
				dropped1 = false;
				value1 = false;
				displayResult();
			}  
	    });
		$( "#droppableid2" ).droppable({
	    	accept: ".draggablebox",
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
				dropped2 = true;
				if(ui.draggable.attr("id") == "draggableid3") {
					value2 = true;
				}
				displayResult();
	    	  },
			out: function(event, ui) {
				dropped2 = false;
				value2 = false;
				displayResult();
			}  
	    });
		$( "#droppableid3" ).droppable({
			accept: ".draggablebox",
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
	    	  dropped3 = true;
			  if(ui.draggable.attr("id") == "draggableid1") {
					value3 = true;
				}
				displayResult();
	    	  },
			out: function(event, ui) {
				dropped3 = false;
				value3 = false;
				displayResult();
			}  
	    });
	  } );
	  function checkResult() {
		  if ( value1 && value2 && value3) {
			  return true;
		  }
	  }
	  function checkDropped () {
		  if (dropped1 && dropped2 && dropped3) {
			  return true;
		  }
	  }
	  function displayResult () {
		  //alert("value1"+value1+"value2"+value2+"value3"+value3+"dropped1"+dropped1+"dropped2"+dropped2+"dropped3"+dropped3)
		  if (checkDropped()) {
			  if (checkResult()) {
				//alert("green");  
				$("#wrapper2").css("background-color","green");
				$("#wrapper2").text("CORRECT!!");	
			  } else {
				//alert("Red");  
				$("#wrapper2").css("background-color","red");
				$("#wrapper2").text("WRONG!!");	
			  }
		  } else {
			  $("#wrapper2").css("background-color","grey");
			  $("#wrapper2").text("Drag and drop the right choices");
		  }
	  }
});