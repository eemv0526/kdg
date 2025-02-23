package com.simplecoding.repositoryexam.service.list;

import java.util.List;



import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.list.ListVO;

public interface ListService {
	
	
	List<?> selectListList(Criteria searchVO) throws Exception; // 전체조회

	int selectListListTotCnt(Criteria searchVO); // 총개수

	void insertList(ListVO listVO) throws Exception; // insert 함수
	
	ListVO selectList(String uuid) throws Exception; // 상세 조회
	
	 void deleteList(String uuid) throws Exception; // delete함수
   
	 public void updateList(ListVO listVO) throws Exception; // 수정 함수

}
