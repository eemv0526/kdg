package com.simplecoding.repositoryexam.mapper.comment;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;


import com.simplecoding.repositoryexam.vo.comment.CcVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

@Mapper
public interface CcMapper {
	
	

	public List<?> selectCcList(Criteria searchVO);   // 전체 조회 : 페이징 기능 추가
	public int selectCcListTotCnt(Criteria searchVO); // 개수 세기 
	public int insert(CcVO ccVO);                   // insert 함수
	public CcVO selectCc(String uuid);                  // 상세조회 함수
	 // UUID로 댓글 목록 조회
    List<CcVO> selectCcListByComicId(String uuid, Criteria searchVO);

    // 해당 만화에 대한 댓글 총 개수 조회
   
	public List<CcVO> getCommentsByUuid(String uuid);
	
	
	
	  
    // 만화의 uuid에 해당하는 댓글 리스트를 가져오는 메소드
    List<CcVO> selectCommentsByUuid(String uuid);
    
    //별점
    
    Double selectAverageRating(String uuid);
    
	public int delete(CcVO CcVO);                   // delete 함수
    
    
    

}
