package com.simplecoding.repositoryexam.mapper.list;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.list.LnvVO;

@Mapper
public interface LnvMapper {
	

	public List<?> selectLnvList(Criteria searchVO); // 전체 조회 : 페이징 기능 추가
	public int selectLnvListTotCnt(Criteria searchVO); // 개수 세기, 테이블 총개수 함수
	public int insert(LnvVO lnvVO); // insert 함수
	public LnvVO selectLnv(String  uuid); // 상세조회 함수
	public int delete(String uuid);  //삭제
	public int update(LnvVO lnvVO);                   // update 함수
	
	

}
