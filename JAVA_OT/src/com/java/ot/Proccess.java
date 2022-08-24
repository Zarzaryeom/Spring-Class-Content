package com.java.ot;

public class Proccess {

	public String proccessres(String input) {
		String str = null;
		try {
			Integer.parseInt(input);
		
			str = "숫자 : " + input;
		}catch(Exception e){
			str = "문자: " + input;
		}
	
		return str;
	}
}
