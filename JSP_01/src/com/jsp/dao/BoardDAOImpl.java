package com.jsp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.jsp.dto.BoardVO;

public class BoardDAOImpl implements BoardDAO {

	@Override
	public List<BoardVO> selectBoardList(SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> selectBoardList(SqlSession session, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
