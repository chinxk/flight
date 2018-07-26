package com.chinxk.flight.service.impl;

import java.lang.reflect.InvocationTargetException;

import org.springframework.stereotype.Component;

import com.chinxk.flight.bean.InterMessageBean;
import com.chinxk.flight.service.InterReturnService;
import com.chinxk.flight.util.JsonUtil;

@Component
public class InterReturnServiceImpl implements InterReturnService {

	@Override
	public InterMessageBean convertFromStr(String msg) {
		InterMessageBean r = null;
		try {
			r = (InterMessageBean) JsonUtil.fromStringToObject(msg, InterMessageBean.class);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r;
	}

}
