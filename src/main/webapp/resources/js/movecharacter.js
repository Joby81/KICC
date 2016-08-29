$(function() {
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
    // register execute button click
    $('#executeButton').click(test);
  
    // save often needed elements to variables
    var $block = $('#block');
    var $dest = $('#dest');
    var $ship2 = $('#ship2');
    var $ship3 = $('#ship3');
  
    // create a function to read ans set 'left' and 'top'
    // this makes it more easy to handle
    function blockPosition(block, newPositions) {
        if( newPositions ) {
            // create a close of 'newPositions' to break referenecing
            var positions = $.extend({}, newPositions);

            // just check if 'top' has no 'px' at the end
            if( positions.top && positions.top.toString().indexOf('px') == -1 ) {
                positions.top += 'px';
            }
            
            // just check if 'left' has no 'px' at the end
            if( positions.left && positions.left.toString().indexOf('px') == -1 ) {
                positions.left += 'px';
            }
            
            // set new positions
            block.css(positions);
            return newPositions;
        }

        // return currect or new position
        return {
            top  : parseInt(block.css("top").replace('px', '')),
            left : parseInt(block.css("left").replace('px', ''))
        };
    }
  
    function coords(dx, dy) {
        // get current position
        var current = blockPosition($block);

        // calculate
        current.left = current.left + 40 * dx;
        current.top = current.top + 40 * dy;
        
        // limit to 0-360
        if (current.left < 0) current.left = 0;
        if (current.top < 0) current.top = 0;
        if (current.left > 360) current.left = 360;
        if (current.top > 360) current.top = 360;

        // set new position
        blockPosition($block, current);
        
        // check if reached endpoint
        var dest = blockPosition($dest);
        var ship2 = blockPosition($ship2);
        var ship3 = blockPosition($ship3);
        if( current.top == dest.top && current.left == dest.left ) {
            // trigger custom event
            $block.trigger('reached');
        } else if( current.top == ship2.top && current.left == ship2.left ) {
            $("#blockShip").attr("src","");
            $("#ship2explode").attr("src","resources/css/explode.gif");
            setTimeout(function() {
                location.reload();
            },1200);
        } else if( current.top == ship3.top && current.left == ship3.left ) {
            $("#blockShip").attr("src","");
            $("#ship3explode").attr("src","resources/css/explode.gif");
            setTimeout(function() {
                location.reload();
            },1200);
        }
    }

    function move(id) {
        // use integeres here for your 'if' and 'parameters'
        // not cast them into string!

        if( id == 1 ) {
            $("#blockShip").addClass('rotatedUp');
            coords(0, -1);
        }
        else if( id == 2 ) {
            $("#blockShip").addClass('rotatedDown');
            coords(0, 1);
        }
        else if( id == 3 ) {
             $("#blockShip").addClass('rotatedSide');
            coords(-1, 0);
        }
        else if( id == 4 ) {
             $("#blockShip").addClass('rotatedSide');
            coords(1, 0);
        }
    }

    // I removed this function and made an event in 'coords'
    /*
    function placePostion() {
        var block = blockPosition($block);
        var dest = blockPosition($dest);

        if (block.top == dest.top && block.left == dest.left) {
            alert("reached");
        }
    }
    */
    // instead use an event
    $block.on('reached', function() {
        console.log("reached");
        //alert('reached');
    });
    
    function test() {
        // another aproach for the timings
        // just define your steps and do a loop
        var scope = angular.element($("body")).scope();
        var newvalue = scope.functionList;
        
        var steps = [];

        for(var temp in newvalue) {
        var tempStep = JSON.parse(temp);
            steps.push(newvalue[tempStep].id);
        }
        
        
        for( var i = 0; i < steps.length; i++ ) {
            setTimeout(function(i) {
                move(steps[i]);
                
                // note that you have a 1s transition for the movement
                // so executiing '' here only responses the OLD position of $block
                // I have placed this call inside the `coords` function to and used a event for this
                // placePostion();
            }, i * 1000, i);
        }
    }
});