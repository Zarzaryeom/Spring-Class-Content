package com.jsp.action.notice;

import java.sql.SQLFeatureNotSupportedException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.SearchCriteria;
import com.jsp.command.SearchCriteriaCommand;
import com.jsp.controller.HttpRequestParameterAdapter;
import com.jsp.service.NoticeService;

public class NoticeListAction implements Action{
	
	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 입력
		String url = "/notice/list";
		SearchCriteria cri = null;
		
		try {
			SearchCriteriaCommand command = HttpRequestParameterAdapter.execute(request, SearchCriteriaCommand.class);
			cri = command.toSearchCriteria();
				
			// 처리
			Map<String, Object> dataMap = noticeService.getNoticeList(cri);
			request.setAttribute("dataMap", dataMap);
			
			// 출력
			return url;
			
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
