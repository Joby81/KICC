package com.comprosoft.kicc.core.processor;

import com.comprosoft.kicc.core.common.RequestObj;
import com.comprosoft.kicc.core.common.ResponseObj;

public interface DataProcessor {

	void process(RequestObj request, ResponseObj response);
}
