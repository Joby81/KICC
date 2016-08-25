package com.comprosoft.kicc.core.common;

import java.util.HashMap;
import java.util.Map;

/**
 * This object will be transferred each time when the user communicates with
 * another
 * 
 * @author Joby Pooppillikudiyil
 */
public class RequestObj {
	private String action;
	private String callBackJsMethod;
	private Map<String, String> params = new HashMap<String, String>();

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getAttribute(String attributeKey) {
		return params.get(attributeKey);
	}

	public void setParams(Map<String, String> params) {
		this.params = params;
	}

	public String getCallBackJsMethod() {
		return callBackJsMethod;
	}

	public void setCallBackJsMethod(String callBackJsMethod) {
		this.callBackJsMethod = callBackJsMethod;
	}

	@Override
	public String toString() {
		return "RequestObj [action=" + action + ", callBackJsMethod=" + callBackJsMethod + ", params=" + params + "]";
	}
	
}
