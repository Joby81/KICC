package com.comprosoft.kicc.core.processor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.comprosoft.kicc.modules.sample.dataprocessors.TestProcessor;

/**
 * @author Joby
 *
 */
@Component
public final class ProcessorFactory {

	@Autowired
	private DefaultDataProcessor defaultDataProcessor;

	@Autowired
	private TestProcessor testProcessor;

	public DataProcessor getProcessor(String action) {
		if (action.equals("TestCall"))
			return testProcessor;
		return defaultDataProcessor;
	}
}
