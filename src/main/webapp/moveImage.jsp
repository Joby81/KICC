<html>
<head>
<link rel="stylesheet" href="css/movefunction.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/bootstrap.min.css">

<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/angular.min.js"></script>
<script src="js/angular-dragdrop.min.js"></script>
<script src="js/movecharacter.js"></script>
<script src="js/app.js"></script>
</head>
<body ng-app="drag-and-drop" ng-controller="oneCtrl">
  <button id="upButton" style="margin-left: 50px;">up</button>
  <button id="downButton">down</button>
  <button id="leftButton">left</button>
  <button id="rightButton">right</button>
  <button id="executeButton">Execute</button>
<div id="panel">
<div id="game">
	<div id="block" style="margin-left: 40px; margin-top: 40px;">
		<img src="img/walking.gif">
	</div>
</div>
<div id="optionBox">
  <div>
            <div class="option" ng-repeat='direction in directionList' ng-show="direction.name" data-drag="true" data-jqyoui-options="{revert: 'invalid', helper: 'clone'}" ng-model="directionList" jqyoui-draggable="{index: {{$index}}, placeholder: 'keep'}">{{direction.name}}
            </div>
          </div>
</div>
<div id="functionBox" data-drop="true" ng-model='functionList' jqyoui-droppable="{multiple:true}">
<div class="option" ng-repeat="function in functionList track by $index" ng-show="function.name" data-drag="true" data-jqyoui-options="{revert: 'invalid'}" ng-model="functionList" jqyoui-draggable="{index: {{$index}}}">{{function.name}}</div>  
</div>
</div>
</body>
</html>