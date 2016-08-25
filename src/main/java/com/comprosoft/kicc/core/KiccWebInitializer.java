package com.comprosoft.kicc.core;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.comprosoft.kicc.core.http.config.SpringWebConfig;
import com.comprosoft.kicc.core.socket.config.SpringSocketConfig;

/**
 * adding Socket configuration and spring MVC configurations classes to the
 * spring
 * 
 * @author Joby Pooppillikudiyil
 *
 */
public class KiccWebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { SpringWebConfig.class, SpringSocketConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return null;
	}

}