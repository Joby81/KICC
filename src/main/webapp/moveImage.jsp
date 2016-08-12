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
    width: 500px;
    height: 500px;
    background-image: linear-gradient(transparent 49px, #888 49px, transparent 50px), linear-gradient(90deg, transparent 49px, #888 49px, transparent 50px);
  	background-size: 50px 50px, 50px 50px;
  	border-style: solid;
  	float: left;
  	margin-right: 10px;
}

#optionBox {
	width: 250px;
    height: 500px;
 	border-style: solid;
 	float: left;   
 	margin-right: 10px;
}

#functionBox {
	width: 400px;
    height: 500px;
 	border-style: solid;
 	float: left;   	
 	margin-right: 10px;
}

#block {
    width: 50px;
    height: 50px;
    outline: 1px solid;
    float: left;
  	transition: 1s;
  	background-color: red;
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
<script type="text/javascript">
	function coords(dx, dy) {
	  var cx = document.getElementById('block').style.marginLeft;
	  var cy = document.getElementById('block').style.marginTop;
	  cx = parseInt(cx) + 50 * dx;
	  cy = parseInt(cy) + 50 * dy;
	  if (cx < 0) cx = 0;
	  if (cy < 0) cy = 0;
	  if (cx > 450) cx = 450;
	  if (cy > 450) cy = 450;
	  document.getElementById('block').style.marginLeft = cx + 'px';
	  document.getElementById('block').style.marginTop = cy + 'px';
}

</script>
</head>
<body>
<button onclick="coords('0','-1')" style="margin-left: 50px;">up</button>
  <button onclick="coords('0','1')">down</button>
  <button onclick="coords('-1','0')">left</button>
  <button onclick="coords('1','0')">right</button>
<div id="panel">
<div id="game">
	<div id="block" style="margin-left: 50px; margin-top: 50px;"></div>
</div>
<div id="optionBox"></div>
<div id="functionBox"></div>
</div>
</body>
</html>