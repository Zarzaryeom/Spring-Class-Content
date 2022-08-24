package com.jsp.datasource;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.vo.MemberVO;

@WebServlet("/mymemberList2")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/WEB-INF/view/member/memberList.jsp";
		
		Map<String, MemberVO> memberMap = DataSource.getInstance().getMemberList();
		List<MemberVO> memberList = new ArrayList<MemberVO>(memberMap.values());
		
		request.setAttribute("memberList", memberList);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
