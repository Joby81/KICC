
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/suchit.js"></script>
</head>
<body>
<div>
<ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="moveImage.jsp">Moving Image</a></li>
  <li><a href="#contact">Contact</a></li>
  <li style="float:right"><a href="#about">About</a></li>
</ul>
</div>
<h2>Tell those musician to play some action music because it is on !!</h2>
<table>
<tr>
<td>
<div id="wrapper">
  <div id="main">
    <div id="sideleft">
    	<center>Left Column</center>
    	<div class="box" style="background-color:yellow;"></div>
    	<div class="box" style="background-color:orange;"></div>
    	<div class="box" style="background-color:red;"></div>
    </div>
    <div id="sideright">
    	<center>Right Column</center>
		<div class="draggablebox" id="draggableid1">
			<img src="img/apple.jpg" />
		</div>
    	<div class="draggablebox" id="draggableid2">
			<img src="img/banana.jpg" />
		</div>
    	<div class="draggablebox" id="draggableid3">
			<img src="img/orange.jpg" />
		</div>
    </div>
    <div id="content">
    	<center>Content</center>
    	<div class="droppablebox" id="droppableid1"></div>
    	<div class="droppablebox" id="droppableid2"></div>
    	<div class="droppablebox" id="droppableid3"></div>
    </div>
  </div>
</div>
</td>
<td>
<center>
  <div id="wrapper2">
  </div>
</center>  
</td>
</tr>
</table>
</body>
</html>