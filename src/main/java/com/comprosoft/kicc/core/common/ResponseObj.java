package com.comprosoft.kicc.core.common;

import java.util.HashMap;
import java.util.Map;

/**
 * This object will be transferred each time when the user communicates with
 * another
 * 
 * @author Joby Pooppillikudiyil
 */
public class ResponseObj {
	private String callBackJsMethod;
	private Map<String, Object> response = new HashMap<String, Object>();

	public void add(String key, Object value) {
		response.put(key, value);
	}

	public String getCallBackJsMethod() {
		return callBackJsMethod;
	}

	public void setCallBackJsMethod(String callBackJsMethod) {
		this.callBackJsMethod = callBackJsMethod;
	}
}
