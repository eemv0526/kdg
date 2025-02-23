package com.simplecoding.repositoryexam.mapper.list;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.list.ComicVO;


@Mapper
public interface ComicMapper {
	
	
	public List<?> selectComicList(Criteria searchVO); // 전체 조회 : 페이징 기능 추가
	public int selectComicListTotCnt(Criteria searchVO); // 개수 세기, 테이블 총개수 함수
	public int insert(ComicVO comicVO); // insert 함수
	public ComicVO selectComic(String  uuid); // 상세조회 함수
	public int delete(String uuid);  //삭제
	public int update(ComicVO comicVO);                   // update 함수
	
	
	

}
