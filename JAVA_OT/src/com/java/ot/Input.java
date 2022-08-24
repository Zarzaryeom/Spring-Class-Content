package com.java.ot;

import java.util.Scanner;

public class Input {
	
	public String inputres() throws Exception{
		Scanner sc = new Scanner(System.in);
		
		System.out.println("입력하세요");
		String input = sc.nextLine();
		
		
		return input;
	}
}
