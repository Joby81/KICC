<html>
<head>
<style type="text/css">
#panel {
	width: 100%;
    height: 100%;
    border-style: solid;
    padding-top: 10px;
    padding-right: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
}
#game {
    width: 400px;
    height: 400px;
    background-image: linear-gradient(transparent 39px, #888 39px, transparent 40px), linear-gradient(90deg, transparent 39px, #888 39px, transparent 40px);
  	background-size: 40px 40px, 40px 40px;
  	border-style: solid;
  	float: left;
  	margin-right: 10px;
}

#optionBox {
	width: 250px;
    height: 400px;
 	border-style: solid;
 	float: left;   
 	margin-right: 10px;
}

#functionBox {
	width: 280px;
    height: 400px;
 	border-style: solid;
 	float: left;   	
 	margin-right: 10px;
}

#block {
    width: 40px;
    height: 40px;
    outline: 1px solid;
    float: left;
  	transition: 1s;
  	background-color: red;
}

.option {
  width: 100px;
    height: 50px;
    margin-left: 10px;
    margin-right: 10px;
    margin-top: 10px;
    margin-bottom: 10px;
    border-style: solid;
    background-color: orange;
}

#character {
	width: 50px;
    height: 50px;
    outline: 1px solid;
    float: left;
	background-color: red;
  	transition: 1s;
}	
</style>
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  $( function() {
    $('#upButton').click(function() {
       coords('0','-1');
    });
    $('#downButton').click(function() {
        coords('0','1');
    });
    $('#leftButton').click(function() {
        coords('-1','0');
    });
    $('#rightButton').click(function() {
        coords('1','0');
    });
  	function coords(dx, dy) {
  	  var cx = document.getElementById('block').style.marginLeft;
  	  var cy = document.getElementById('block').style.marginTop;
  	  cx = parseInt(cx) + 40 * dx;
  	  cy = parseInt(cy) + 40 * dy;
  	  if (cx < 0) cx = 0;
  	  if (cy < 0) cy = 0;
  	  if (cx > 360) cx = 360;
  	  if (cy > 360) cy = 360;
  	  document.getElementById('block').style.marginLeft = cx + 'px';
  	  document.getElementById('block').style.marginTop = cy + 'px';
    }
    $( ".option" ).draggable({
        revert : function(event, ui) {
              $(this).data("uiDraggable").originalPosition = {
                  top : 0,
                  left : 0
              };
              return !event;
          },
          snap: true,
            snapMode: "inner",
            snapTolerance: 30,
            helper: "clone"
      });
    $( "#functionBox" ).droppable({
      drop: function (event, ui) {
            var $canvas = $(this);
            if (!ui.draggable.hasClass('canvas-element')) {
                var $canvasElement = ui.draggable.clone();
                $canvasElement.addClass('canvas-element');
                $canvasElement.draggable({
                    containment: '#container'
                });
                $canvas.append($canvasElement);
                $canvasElement.css({
                    left: (ui.position.left),
                    top: (ui.position.top),
                    position: 'absolute'
                });
            }
        }
    });
  });
});
</script>
</head>
<body>
  <button id="upButton" style="margin-left: 50px;">up</button>
  <button id="downButton">down</button>
  <button id="leftButton">left</button>
  <button id="rightButton">right</button>
<div id="panel">
<div id="game">
	<div id="block" style="margin-left: 40px; margin-top: 40px;">
		<img src="img/walking.gif" />
	</div>
</div>
<div id="optionBox">
  <div id="direction" class="option">Left</div>
  <div id="direction" class="option">Right</div>
  <div id="direction" class="option">Up</div>
  <div id="direction" class="option">Down</div>
</div>
<div id="functionBox"></div>
</div>
</body>
</html>