package com.jsp.service;

import java.util.List;

import com.jsp.command.Criteria;
import com.jsp.dto.BoardVO;

public interface BoardService {

	public List<BoardVO> getMemberList() throws Exception;
	public List<BoardVO> getMemberList(Criteria cri) throws Exception;
}
