(function($) {
	// Shared Methods
	stringify = function(action, params, callBackJsMethod) {
		return JSON.stringify({
			action : action,
			params : params,
			callBackJsMethod : callBackJsMethod
		});
	}
	postDataController = function(d) {
		var jsonData = d.constructor == Object ? d : JSON.parse(d.data);
		var fn = window[jsonData.callBackJsMethod];
		if (typeof fn === 'function') {
			fn(jsonData.response);
		} else {
			log("Missing method : " + jsonData.callBackJsMethod);
		}
	};

	// Socket Controller Starts
	var socket = new SockJS(contextPath + "/socket/dataProvider");
	log = function(message) {
		if (window.console)
			console.log(message);
	}
	socket.onopen = function() {
		var fn = window['onSocketOpen'];
		if (typeof fn === 'function') {
			fn();
		} else {
			log('onSocketOpen function is missing');
		}
	};
	socket.onmessage = postDataController;

	socket.onclose = function() {
		log("Closed socket. Please reload your page");
	};
	socket.onerror = function() {
		log("Error during transfer. Please reload your page");
	};
	$.doSocketCall = function(action, params, callBackJsMethod) {
		var data = stringify(action, params, callBackJsMethod);
		socket.send(data);
	}

	// Ajax Controller Starts
	$.doAjaxCall = function(action, params, callBackJsMethod) {
		var data = stringify(action, params, callBackJsMethod);
		$.ajax({
			url : contextPath + "/http/dataProvider",
			type : "POST",
			data : data,
			contentType : 'application/json',
			success : postDataController,
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				log("Please check the connection,\nStatus: " + textStatus
						+ "\nError: " + errorThrown);
			}
		});
	};
	$.doCall = function(action, params, callBackJsMethod) {
		if (window.WebSocket) {
			$.doSocketCall(action, params, callBackJsMethod);
		} else {
			$.doAjaxCall(action, params, callBackJsMethod);
		}
	}

}(jQuery));

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