package com.sist.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.BoardVO;

/*
 *   <bean id="ssf"
       class="org.mybatis.spring.SqlSessionFactoryBean"
       p:dataSource-ref="ds"
       p:configLocation="/WEB-INF/config/Config.xml"
    />
 */
import java.util.*;
@Repository
public class BoardDAO extends SqlSessionDaoSupport{

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	

               public List<BoardVO> boardAllData(int page)
	{
		List<BoardVO> list=new ArrayList<BoardVO>();
		int rowSize=10;
		int start=(page*rowSize)-(rowSize-1);
		int end=page*rowSize;
		Map map=new HashMap();
		map.put("pStart", start);
		map.put("pEnd", end);
		
		getSqlSession().update("boardAllData",map);
		
		list=(List<BoardVO>)map.get("pResult");
		return list;
	}
	

               public int boardTotalPage()
	{
		int total=getSqlSession().selectOne("boardTotalPage");
		
		return total;
	}
	

               public int boardRowCount()
	{
		int count=getSqlSession().selectOne("boardRowCount");
		return count;
	}
	

               public void boardInsert(BoardVO vo)
	{
		Map map=new HashMap();
		map.put("pName", vo.getName());
		map.put("pEmail", vo.getEmail());
		map.put("pSubject", vo.getSubject());
		map.put("pContent", vo.getContent());
		map.put("pPwd", vo.getPwd());
		
		getSqlSession().update("boardInsert",map);
	}
	
	public BoardVO boardDetailData(int no)
	{
		Map map=new HashMap();
		map.put("pNo", no);
		
		getSqlSession().update("boardDetailData",map);
		
		List<BoardVO> vo=(List<BoardVO>)map.get("pResult");
		// update
		return vo.get(0);
	}
	
	public BoardVO boardUpdateData(int no)
	{
		Map map=new HashMap();
		map.put("pNo", no);
		
		getSqlSession().update("boardUpdateData",map);
		
		List<BoardVO> vo=(List<BoardVO>)map.get("pResult");
		// update
		return vo.get(0);
	}
	
	public boolean boardUpdateOk(BoardVO vo)
	{
		boolean bCheck=false;

                              Map map=new HashMap();
		map.put("pNo", vo.getNo());
		
		getSqlSession().update("boardGetPwd",map);
		String db_pwd=(String)map.get("pPwd");
		System.out.println("db_pwd:"+db_pwd);
		System.out.println("vo:"+vo.getPwd());

		if(db_pwd.equals(vo.getPwd()))
		{
			bCheck=true;


			map.put("pName", vo.getName());
			map.put("pEmail", vo.getEmail());
			map.put("pSubject", vo.getSubject());
			map.put("pContent", vo.getContent());
			map.put("pPwd", vo.getPwd());
			map.put("pNo", vo.getNo());
			
			getSqlSession().update("boardUpdateOk",map);
		}
		
		return bCheck;
	}
	
	public boolean boardDelete(int no,String pwd)
	{
		boolean bCheck=false;


		Map map=new HashMap();
		map.put("pNo", no);
		
		getSqlSession().update("boardGetPwd",map);
		String db_pwd=(String)map.get("pPwd");
		
		if(db_pwd.equals(pwd))
		{
			bCheck=true;
			map.put("pNo", no);
			getSqlSession().update("boardDelete",map);
		}
		
		return bCheck;
	}
   
}








