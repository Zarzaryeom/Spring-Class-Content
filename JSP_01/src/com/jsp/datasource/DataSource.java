package com.jsp.datasource;

import java.util.HashMap;
import java.util.Map;

import com.jsp.vo.MemberVO;

public class DataSource {
	private Map<String, MemberVO> memberList = new HashMap<String, MemberVO>();
	
	private static DataSource instance = new DataSource();
	private DataSource() {
		for(int i=0;i<20;i++) {
			String temp = "mimi"+i;
			
			memberList.put(temp, new MemberVO(temp, temp));
		} 
	}
	
	public static DataSource getInstance(){
		return instance;
	}
	public Map<String, MemberVO> getMemberList() {
		return memberList;
	}
	public void setMemberList(Map<String, MemberVO> memberList) {
		this.memberList = memberList;
	}
	public static void setInstance(DataSource instance) {
		DataSource.instance = instance;
	}
	
	
	
	
}
