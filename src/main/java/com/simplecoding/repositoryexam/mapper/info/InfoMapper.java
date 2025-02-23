package com.simplecoding.repositoryexam.mapper.info;

import org.apache.ibatis.annotations.Mapper;

import com.simplecoding.repositoryexam.vo.info.InfoVO;



@Mapper
public interface InfoMapper {
	
	
	
	
	
	  public InfoVO authenticate(InfoVO infoVO); // 상세조회(인증)
	  public void register(InfoVO infoVO); // insert 
	
	
	
	
	

}
