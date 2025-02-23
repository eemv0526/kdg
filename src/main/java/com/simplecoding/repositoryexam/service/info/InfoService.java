package com.simplecoding.repositoryexam.service.info;


import com.simplecoding.repositoryexam.vo.info.InfoVO;

public interface InfoService {
	
	
	   public InfoVO authenticateMember(InfoVO loginVO) throws Exception; // 상세조회(인증)
	   public void registerMember(InfoVO infoVO) throws Exception;

}
