var App = angular.module('drag-and-drop', ['ngDragDrop','ui.bootstrap']);

App.controller('oneCtrl', function($scope, $timeout) {
		$scope.directionList = [{'name': 'MOVE UP','id': '1'},
		{'name': 'MOVE DOWN','id': '2'},
		{'name': 'MOVE LEFT','id': '3'},
		{'name': 'MOVE RIGHT','id': '4'}];

		$scope.functionList = [];

		$scope.hideMe = function() {
		  return $scope.functionList.length > 0;
		}


	});