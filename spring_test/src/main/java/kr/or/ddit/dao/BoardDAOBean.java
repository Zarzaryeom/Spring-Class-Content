package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.jsp.command.SearchCriteria;
import com.jsp.dto.BoardVO;
import com.jsp.dto.NoticeVO;

public interface BoardDAOBean {

	List<BoardVO> selectBoardCriteria(SearchCriteria cri) throws SQLException;

	int selectBoardCriteriaTotalCount(SearchCriteria cri) throws SQLException;

	BoardVO selectBoardByBno(int bno) throws SQLException;
	
	BoardVO selectBoardByImage(String imageFile) throws SQLException;

	void insertBoard(BoardVO board) throws SQLException;

	void updateBoard(BoardVO board) throws SQLException;

	void deleteBoard(int bno) throws SQLException;

	// viewcnt 증가
	void increaseViewCnt(int bno) throws SQLException;

	// board_seq.nextval 가져오기
	int selectBoardSeqNext() throws SQLException;
}
