package com.chinxk.flight.service;

import com.chinxk.flight.bean.InterMessageBean;

public interface InterReturnService {
	public InterMessageBean convertFromStr(String msg);
}
