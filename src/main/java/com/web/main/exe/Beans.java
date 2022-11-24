package com.web.main.exe;

import java.util.HashMap;
import java.util.Map;

public class Beans {
	
	// dao를 생성해서 저장하는 객체
	private static Map<String, Object> daoMap = new HashMap<String, Object>();
	// service를 생성해서 저장하는 객체
	private static Map<String, Service> serviceMap = new HashMap<String, Service>();
	
	// dao를 넣는 메서드
	public static void setDAO(String key, Object obj) {
		daoMap.put(key, obj);
	}
	
	// dao를 꺼내오는 메서드
	public static Object getDAO(String key) {
		return daoMap.get(key);
	}
	
	// service를 넣는 메서드
	public static void setService(String key, Service service) {
		serviceMap.putIfAbsent(key, service);
	}
	
	// service를 꺼내오는 메서드
	public static Service getService(String key) {
		return serviceMap.get(key);
	}
}
