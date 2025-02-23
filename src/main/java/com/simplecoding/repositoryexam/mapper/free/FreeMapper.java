package com.simplecoding.repositoryexam.mapper.free;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.free.FreeVO;


@Mapper
public interface FreeMapper {
	
	
	public List<?> selectFreeList(Criteria searchVO); // 전체 조회 : 페이징 기능 추가
	public int selectFreeListTotCnt(Criteria searchVO); // 개수 세기, 테이블 총개수 함수
	public int insert(FreeVO freeVO); // insert 함수
	public FreeVO selectFree(String  uuid); // 상세조회 함수
	public int delete(String uuid);  //삭제
	public int update(FreeVO freeVO);                   // update 함수
	

}
