package com.java.ot;

import java.util.Scanner;

public class Main {

	private Input inputres = new Input();
	private Proccess proccessres = new Proccess();
	private Output outputres = new Output();
	
	public static void main(String[] args) throws Exception {
		
		/*
		System.out.println("�ȳ��ϼ���");
		
		//�Է�
		String str = null;
		
		Scanner sc = new Scanner(System.in);
		String input = sc.nextLine();
		
		//ó��
		//str ="�ȳ��ϼ���";
		if(input == null) return;  
			
		try {
			Integer.parseInt(input);
			
			str += "���� :";
		}catch(Exception e){
			str += "���� :";
		}
		
		
		str += input;
		
		
		//���
		System.out.println(str);
		*/
		
		
		
		Main m = new Main();
		
		// �޼��� ����
		// �Է�
//		String input = m.input();
//			
//		// ó��
//		String result = m.proccess(input);
//		
//		// ���
//		m.inputPrint(result);
		
		
		// ��Ű�� ����
		// �Է�
		String input = m.inputres.inputres();
		
		// ó��
		String result = m.proccessres.proccessres(input);
		
		// ���
		m.outputres.inputPrint(result);
		
		
		
	}
	
	// �Է�
	private String input() throws Exception{
		Scanner sc = new Scanner(System.in);
		
		System.out.println("�Է��ϼ���");
		String input = sc.nextLine();
		
		
		return input;
	}
	
	
	// ó��
	private String proccess(String input) {
		String str = null;
		try {
			Integer.parseInt(input);
		
			str = "���� : " + input;
		}catch(Exception e){
			str = "����: " + input;
		}
	
		return str;
	}
	
	// ���
	private void inputPrint(String str) {
		
		System.out.println(str);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
