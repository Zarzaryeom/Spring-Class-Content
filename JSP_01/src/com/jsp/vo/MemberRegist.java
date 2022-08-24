package com.jsp.vo;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.datasource.DataSource;
import com.jsp.vo.MemberVO;

@WebServlet("/mymember/regist")
public class MemberRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/WEB-INF/view/member/regist.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//입력
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String url = request.getContextPath() + "/member/regist/success?id="+id+"&pwd="+pwd;
		
		//처리
		Map<String, MemberVO> memberMap = DataSource.getInstance().getMemberList();
		memberMap.put(id, new MemberVO(id, pwd));
		
		//출력
		response.sendRedirect(url);
	}


}
