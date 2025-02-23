package com.simplecoding.repositoryexam.service.list;

import java.util.List;

import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.list.ComicVO;


public interface ComicService {
	
	
	
	
	
	List<?> selectComicList(Criteria searchVO) throws Exception; // 전체조회

	int selectComicListTotCnt(Criteria searchVO); // 총개수

	void insertComic(ComicVO comicVO) throws Exception; // insert 함수
	
	ComicVO selectComic(String uuid) throws Exception; // 상세 조회
	
	 void deleteComic(String uuid) throws Exception; // delete함수
   
	 public void updateComic(ComicVO comicVO) throws Exception; // 수정 함수

	 
	
	
	
	
	

}
