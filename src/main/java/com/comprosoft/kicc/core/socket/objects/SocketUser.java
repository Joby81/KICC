package com.comprosoft.kicc.core.socket.objects;

import org.springframework.web.socket.WebSocketSession;

/**
 * Saving the details of the user to identify with socket id
 * 
 * @author Joby Pooppillikudiyil
 *
 */
public class SocketUser {

	private WebSocketSession session;
	private int referenceId;
	private String userType;

	public WebSocketSession getSession() {
		return session;
	}

	public void setSession(WebSocketSession session) {
		this.session = session;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getReferenceId() {
		return referenceId;
	}

	public void setReferenceId(int referenceId) {
		this.referenceId = referenceId;
	}

}
