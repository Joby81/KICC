package com.comprosoft.kicc.modules.sample.dataprocessors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comprosoft.kicc.core.common.RequestObj;
import com.comprosoft.kicc.core.common.ResponseObj;
import com.comprosoft.kicc.core.processor.DataProcessor;
import com.comprosoft.kicc.modules.sample.repositories.LoginCredentialsRepository;

@Service
public class TestProcessor implements DataProcessor {

	@Autowired
	private LoginCredentialsRepository repository;

	@Override
	public void process(RequestObj request, ResponseObj response) {
		response.add("message", "Hello " + request.getAttribute("name") +repository.findByUserName(request.getAttribute("name")).size());
	}
}
