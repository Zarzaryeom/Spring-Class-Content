package com.java.ot;

public class Proccess {

	public String proccessres(String input) {
		String str = null;
		try {
			Integer.parseInt(input);
		
			str = "���� : " + input;
		}catch(Exception e){
			str = "����: " + input;
		}
	
		return str;
	}
}
