package com.web.main.exe;

/*
 * 실행할 객체를 선택해서 실행해 주는 클래스
 */

public class Execution {
	
	public static Object execute(String uri, Object obj) throws Exception {
		System.out.println("Execution.execute.uri:" + uri);
		System.out.println("[== 넘어가는 데이터 ==]");
		System.out.println("Execution.execute.obj:" + obj);
		Service service = Beans.getService(uri);
		System.out.println("[== 실행되는 객체 ==]");
		System.out.println("Execution.execute.service:" + service.getClass().getName());
		Object result = service.service(obj);
		System.out.println("[== 실행된 결과 데이터 ==]");
		System.out.println(result);
		return result;
	}
}
