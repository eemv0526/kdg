package com.simplecoding.repositoryexam.service.Anno;

import java.util.List;


import com.simplecoding.repositoryexam.vo.anno.AnnoVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

public interface AnnoService {

	
	
	List<?> selectAnnoList(Criteria searchVO) throws Exception; // 전체조회

	int selectAnnoListTotCnt(Criteria searchVO); // 총개수

	void insertAnno(AnnoVO annoVO) throws Exception; // insert 함수
	
	AnnoVO selectAnno(int ano) throws Exception; // 상세 조회
	
	public void updateAnno(AnnoVO annoVO) throws Exception; // 수정 함수
	public void deleteAnno(AnnoVO annoVO)throws Exception; // 삭제 함수
	
	
	
	
	
	
	
	
	
	
	
}
