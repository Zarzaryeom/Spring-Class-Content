package com.jsp.datasource;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import org.apache.ibatis.javassist.bytecode.annotation.MemberValue;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.jsp.dto.MemberVO;

public class TestOracleMybatisSqlSessionFactory {

	private OracleMybatisSqlSessionFactory sqlSessionFactory
		= new OracleMybatisSqlSessionFactory();
	
	private SqlSession session;
	
	@Before
	public void init() throws Exception{
		session = sqlSessionFactory.openSession();
	}
	
	// 팩토리가 연결되어있는지 테스트
	@Test
	public void testSqlSessionFactory()throws Exception{
		Assert.assertNotNull(sqlSessionFactory);
	}
	
	// 맵퍼와 연결되어있는지 테스트
	@Test
	public void testSqlSesion() throws SQLException{
		Collection<String> mapNames= (Collection<String>)session.getConfiguration().getMappedStatementNames();
		
		Assert.assertTrue(mapNames.contains("Member-Mapper.selectMemberList"));
	}
	
	// DB에서 데이터를 제대로 받아오는지 테스트
	@Test
	public void testMemberList()throws SQLException{
		List<MemberVO> memberList = session.selectList("Member-Mapper.selectMemberList");
		
		Assert.assertEquals(7, memberList.size());
	}
	
	@After
	public void close()throws Exception{
		if(session != null) session.close();
	}
}
