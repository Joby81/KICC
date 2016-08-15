var App = angular.module('drag-and-drop', ['ngDragDrop']);

App.controller('oneCtrl', function($scope, $timeout) {
		$scope.directionList = [{'name': 'up','id': '1'},
		{'name': 'down','id': '2'},
		{'name': 'Left','id': '3'},
		{'name': 'right','id': '4'}];

		$scope.functionList = [];

		$scope.hideMe = function() {
		  return $scope.functionList.length > 0;
		}


	});