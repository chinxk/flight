package com.chinxk.flight.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import io.netty.util.internal.StringUtil;

public class JsonUtil {

	public static Object fromStringToObject(String msg, Class<?> c) throws InstantiationException,
			IllegalAccessException, SecurityException, IllegalArgumentException, InvocationTargetException {

		Object obj = c.newInstance();
		for (String s : msg.split(",")) {
			String[] a = s.split(":");
			String k = "set" + a[0];
			String v = a[1];
			if (!StringUtil.isNullOrEmpty(v) && !"null".equals(v)) {
				try {
					if (v.matches("[0-9]*")) {
						Method m;
						m = c.getMethod(k, Integer.class);
						m.invoke(obj, Integer.valueOf(v));
					} else {
						Method m = c.getMethod(k, String.class);
						m.invoke(obj, v);
					}
				} catch (NoSuchMethodException e) {
					e.printStackTrace();
				}
			}
		}
		return obj;
	}

}
