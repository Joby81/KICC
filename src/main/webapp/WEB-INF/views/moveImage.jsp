<html>
<head>
<link rel="stylesheet" href="resources/css/movefunction.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/angular.min.js"></script>
<script src="resources/js/angular-dragdrop.min.js"></script>
<script src="resources/js/ui-bootstrap-tpls-0.3.0.js"></script>

<script src="resources/js/movecharacter.js"></script>
<script src="resources/js/app.js"></script>
</head>
<body ng-app="drag-and-drop" ng-controller="oneCtrl">
  <button id="executeButton">Execute</button>
<div id="panel">
<div id="game" style="background-image:url('resources/css/stillwater.gif');">
  <div id="block">
  	<img id="blockShip" src="resources/css/ship1.gif">
  </div>
  <div id="dest"></div>
  <div id="ship2">
    <img id="ship2explode" src="resources/css/ship3.gif">
  </div>
  <div id="ship3">
    <img id="ship3explode" src="resources/css/ship5.gif">
  </div>
</div>
<div id="optionBox">
  <div>
            <div class="option" ng-repeat='direction in directionList' ng-show="direction.name" data-drag="true" data-jqyoui-options="{revert: 'invalid', helper: 'clone'}" ng-model="directionList" jqyoui-draggable="{index: {{$index}}, placeholder: 'keep'}">{{direction.name}}
            </div>
          </div>
          <div id="trashBox"><img src="resources/img/trash.png"></img></div>
</div>
<div id="functionBox" data-drop="true" ng-model='functionList' jqyoui-droppable="{multiple:true}">
<div id="start">STEPS</div>
<div class="option" ng-repeat="function in functionList track by $index" ng-show="function.name" data-drag="true" data-jqyoui-options="{revert: 'invalid'}" ng-model="functionList" jqyoui-draggable="{index: {{$index}}}">{{function.name}}</div>  
</div>
</div>
</body>
</html>
