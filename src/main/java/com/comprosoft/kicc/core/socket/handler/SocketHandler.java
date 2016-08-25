package com.comprosoft.kicc.core.socket.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.comprosoft.kicc.core.socket.service.SocketService;

/**
 * Handles text socket messages
 * 
 * @author Joby Pooppillikudiyil
 */
public class SocketHandler extends TextWebSocketHandler {

	@Autowired
	private SocketService socketService;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		socketService.registerConnection(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		socketService.handleTextMessage(session, message);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		socketService.deRegisterConnection(session);
	}
}
