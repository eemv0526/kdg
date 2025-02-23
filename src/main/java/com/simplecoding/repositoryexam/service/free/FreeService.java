package com.simplecoding.repositoryexam.service.free;

import java.util.List;

import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.free.FreeVO;


public interface FreeService {

	
	
	List<?> selectFreeList(Criteria searchVO) throws Exception; // 전체조회

	int selectFreeListTotCnt(Criteria searchVO); // 총개수

	void insertFree(FreeVO freeVO) throws Exception; // insert 함수
	
	FreeVO selectFree(String uuid) throws Exception; // 상세 조회
	
	
	 void deleteFree(String uuid) throws Exception; // delete함수
	   
	 public void updateFree(FreeVO freeVO) throws Exception; // 수정 함수

	
	
}
