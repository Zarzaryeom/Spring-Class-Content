package com.java.ot;

import java.util.Scanner;

public class Main {

	private Input inputres = new Input();
	private Proccess proccessres = new Proccess();
	private Output outputres = new Output();
	
	public static void main(String[] args) throws Exception {
		
		/*
		System.out.println("안녕하세요");
		
		//입력
		String str = null;
		
		Scanner sc = new Scanner(System.in);
		String input = sc.nextLine();
		
		//처리
		//str ="안녕하세요";
		if(input == null) return;  
			
		try {
			Integer.parseInt(input);
			
			str += "숫자 :";
		}catch(Exception e){
			str += "문자 :";
		}
		
		
		str += input;
		
		
		//출력
		System.out.println(str);
		*/
		
		
		
		Main m = new Main();
		
		// 메서드 형식
		// 입력
//		String input = m.input();
//			
//		// 처리
//		String result = m.proccess(input);
//		
//		// 출력
//		m.inputPrint(result);
		
		
		// 패키지 형식
		// 입력
		String input = m.inputres.inputres();
		
		// 처리
		String result = m.proccessres.proccessres(input);
		
		// 출력
		m.outputres.inputPrint(result);
		
		
		
	}
	
	// 입력
	private String input() throws Exception{
		Scanner sc = new Scanner(System.in);
		
		System.out.println("입력하세요");
		String input = sc.nextLine();
		
		
		return input;
	}
	
	
	// 처리
	private String proccess(String input) {
		String str = null;
		try {
			Integer.parseInt(input);
		
			str = "숫자 : " + input;
		}catch(Exception e){
			str = "문자: " + input;
		}
	
		return str;
	}
	
	// 출력
	private void inputPrint(String str) {
		
		System.out.println(str);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
