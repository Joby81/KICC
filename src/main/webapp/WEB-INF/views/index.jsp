<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/style.css">
	
	<%@ include file="/WEB-INF/views/shared/headerscripts.jsp"%>
	<script src="resources/js/suchit.js"></script>
	
</head>

<body>
	<div>
		<ul>
			<li><a class="active" href="#home">Home</a></li>
  			<li><a href="movingimage">Moving Image</a></li>
			<li><a href="#contact">Contact</a></li>
			<li style="float: right"><a href="#about">About</a></li>
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
							<div class="box" style="background-color: yellow;"></div>
							<div class="box" style="background-color: orange;"></div>
							<div class="box" style="background-color: red;"></div>
						</div>
						<div id="sideright">
							<center>Right Column</center>
							<div class="draggablebox" id="draggableid1">
								<img src="resources/img/apple.jpg" />
							</div>
							<div class="draggablebox" id="draggableid2">
								<img src="resources/img/banana.jpg" />
							</div>
							<div class="draggablebox" id="draggableid3">
								<img src="resources/img/orange.jpg" />
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
					<div id="wrapper2"></div>
				</center>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	/*
	//###################################### Document ##############################
	
	How can you make backend calls easly ?
	  You can do 3 calls basically 
	  1. doCall("actionName", paramsToServer, "callBackJsMethod"); // PREFERRED it will switch your call between http or socket according to your browser capablity
	  2. doAjaxCall("actionName", paramsToServer, "callBackJsMethod"); //It will always uses ajax http call
	  3. doSocketCall("actionName", paramsToServer, "callBackJsMethod"); // It will always uses websocket call

	  actionName=The name which needed to be mapped in ProcessorFactory
	  paramsToServer=Parameters to be passed to the backend, You can read it from RequestObj (@Ref TestProcessor)
	  callBackJsMethod=On after Async call to the backend this method will be called backe with JSON data. 
	  
	  onSocketOpen(){} // you can write this method by default = This method will be called on after initilizing your socket connection .
	  You can use this method every page.

	  Backend reference classes : 
		  how to write custom data processor : 
			  1) Create a class which implement  com.comprosoft.kicc.core.processor.DataProcessor interface
		  	  2) add the class into ProcessorFactory  (@Ref: check "TestCall" if condition)


	 */

	 //###################################### EXAMPLE IMPLEMENTATION ##############################
		function onSocketOpen() {
			 // will call normal http call
			 $.doAjaxCall("TestCall", { name : "World" }, "doAjaxCall");
		 	 
			 // It will switch automatically websocket/ajax call ( by default websocket)
			 $.doCall("TestCall", { name : "World" }, "doCall");
			 
			 //will call websocket call
			 $.doSocketCall("TestCall", { name : "World" }, "doSocketCall");
		}
	
		function doSocketCall(jsonData){
			console.log("doSocketCall : " + jsonData.message);
		}
		function doAjaxCall(jsonData){
			console.log("doAjaxCall : " + jsonData.message);
		}
		function doCall(jsonData){
			console.log("doCall : " + jsonData.message);
		}
	//#################################### END OF EXAMPLE IMPLEMENTATION ###########################
		
	</script>
</body>
</html>