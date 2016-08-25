package com.comprosoft.kicc.core.socket.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.comprosoft.kicc.core.common.RequestObj;
import com.comprosoft.kicc.core.common.ResponseObj;
import com.comprosoft.kicc.core.processor.ProcessorFactory;
import com.comprosoft.kicc.core.socket.objects.SocketUser;
import com.google.gson.Gson;

/**
 * This class handles the requests from the UI
 * 
 * @author Joby
 */
@Service
public class SocketService {

	@Autowired
	private ProcessorFactory factory;

	private Gson gson = new Gson();
	protected static Logger LOGGER = LoggerFactory.getLogger(SocketService.class);
	private List<SocketUser> liveUsers = java.util.Collections.synchronizedList(new ArrayList<>());

	public void registerConnection(WebSocketSession session) {
		SocketUser socketUser = new SocketUser();
		socketUser.setSession(session);
		liveUsers.add(socketUser);
	}

	public void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
		RequestObj request = gson.fromJson(message.getPayload(), RequestObj.class);
		LOGGER.debug("\n-------------------------------------------------------------------" + "\nProcessing \n\tRequestObj\t: {} \n\tProcessor\t: {} \n\tProtocol\t: {}\n-------------------------------------------------------------------\n", request, this.getClass().getSimpleName(),"WebSocket");
		ResponseObj response = new ResponseObj();
		response.setCallBackJsMethod(request.getCallBackJsMethod());
		factory.getProcessor(request.getAction()).process(request, response);
		pushResponse(session, response);
	}

	public void deRegisterConnection(WebSocketSession session) {
		liveUsers.removeIf(s -> s.getSession().equals(session));
	}

	/**
	 * pushes the data to the socket
	 * 
	 * @param socketUser
	 * @param response
	 */
	private void pushResponse(WebSocketSession session, ResponseObj response) {
		try {
			String responseText = gson.toJson(response);
			session.sendMessage(new TextMessage(responseText));
			LOGGER.debug("Pushing data to the socket, data :  {}" + responseText);
		} catch (IOException e) {
			LOGGER.info("Sending message to {}-{} {}is failed", response, session.getId());
		}
	}
}