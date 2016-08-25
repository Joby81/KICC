package com.comprosoft.kicc.core.http.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.comprosoft.kicc.core.common.RequestObj;
import com.comprosoft.kicc.core.common.ResponseObj;
import com.comprosoft.kicc.core.processor.ProcessorFactory;
import com.google.gson.Gson;

/**
 * @author Joby
 *
 */
@RestController
public class DataProvider {

	@Autowired
	private ProcessorFactory factory;
	private Gson gson = new Gson();

	private static Logger LOGGER = LoggerFactory.getLogger(DataProvider.class);

	@RequestMapping(value = "/http/dataProvider", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String dataProvider(@RequestBody RequestObj request) {
		LOGGER.debug("\n-------------------------------------------------------------------" + "\nProcessing \n\tRequestObj\t: {} \n\tProcessor\t: {} \n\tProtocol\t: {}\n-------------------------------------------------------------------\n", request, this.getClass().getSimpleName(), "HTTP");
		ResponseObj response = new ResponseObj();
		response.setCallBackJsMethod(request.getCallBackJsMethod());
		factory.getProcessor(request.getAction()).process(request, response);
		return gson.toJson(response);
	}
}
