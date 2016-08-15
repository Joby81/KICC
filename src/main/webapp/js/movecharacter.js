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
    $('#executeButton').click(function() {
        test();
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

    function test(){
      var scope = angular.element($("body")).scope();
      var newvalue = scope.functionList;
      for(var temp in newvalue) {
        var step = JSON.parse(temp);
        move(newvalue[step].id);
      }
   }

   function move(id) {
      if (id == '1') {
        coords('0','-1');
      } else if (id == '2') {
        coords('0','1');
      } else if (id == '3') {
        coords('-1','0');
      } else if (id == '4') {
        coords('1','0');
      }
   }

   function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
      if ((new Date().getTime() - start) > milliseconds){
        break;
      }
    }
  }
    
  });
});