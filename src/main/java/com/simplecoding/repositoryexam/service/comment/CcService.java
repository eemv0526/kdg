package com.simplecoding.repositoryexam.service.comment;

import java.util.List;


import com.simplecoding.repositoryexam.vo.comment.CcVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

public interface CcService {

	
	
	
	List<?> selectCcList(Criteria searchVO) throws Exception; // 전체조회

	int selectCcListTotCnt(Criteria searchVO); // 총개수

	void insertCc(CcVO ccVO) throws Exception; // insert 함수
	
	CcVO selectCc(String uuid) throws Exception; // 상세 조회
	
	 List<CcVO> getCommentsByComicUuid(String uuid); // uuid별 코멘트 필터링
	
	 Double getAverageRating(String uuid);  // 평균 별점 조회 메서드 추가
	
	 public void deleteCc(CcVO CcVO)throws Exception; // 삭제 함수
}
