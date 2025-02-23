package com.simplecoding.repositoryexam.service.list;

import java.util.List;

import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.list.LnvVO;

public interface LnvService {
	
	
	
	
	List<?> selectLnvList(Criteria searchVO) throws Exception; // 전체조회

	int selectLnvListTotCnt(Criteria searchVO); // 총개수

	void insertLnv(LnvVO lnvVO) throws Exception; // insert 함수
	
	LnvVO selectLnv(String uuid) throws Exception; // 상세 조회
	
	 void deleteLnv(String uuid) throws Exception; // delete함수
   
	 public void updateLnv(LnvVO lnvVO) throws Exception; // 수정 함수

	
	
	
	
	
	
	
	

}
