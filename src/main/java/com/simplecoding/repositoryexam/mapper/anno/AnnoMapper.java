package com.simplecoding.repositoryexam.mapper.anno;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.simplecoding.repositoryexam.vo.anno.AnnoVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

@Mapper
public interface AnnoMapper {
	
	
	public List<?> selectAnnoList(Criteria searchVO);   // 전체 조회 : 페이징 기능 추가
	public int selectAnnoListTotCnt(Criteria searchVO); // 개수 세기 
	public int insert(AnnoVO annoVO);                   // insert 함수
	public AnnoVO selectAnno(int ano);                  // 상세조회 함수
	public int update(AnnoVO annoVO);                   // update 함수
	public int delete(AnnoVO annoVO);                   // delete 함수
	

}
