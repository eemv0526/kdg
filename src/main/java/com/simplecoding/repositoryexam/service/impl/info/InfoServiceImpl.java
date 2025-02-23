package com.simplecoding.repositoryexam.service.impl.info;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simplecoding.repositoryexam.mapper.info.InfoMapper;
import com.simplecoding.repositoryexam.service.info.InfoService;
import com.simplecoding.repositoryexam.vo.info.InfoVO;

@Service
public class InfoServiceImpl implements InfoService {
	
	
	
	   @Autowired
	   InfoMapper infoMapper;
	   
	   // 인증 : 상세조회
	   @Override
	   public InfoVO authenticateMember(InfoVO loginVO) throws Exception {
	      // TODO memberMapper 의 상세조회(인증) 실행, 업무로직 추가
//	      1) memberMapper 의 상세조회(인증) 실행
	      InfoVO infoVO = infoMapper.authenticate(loginVO);
//	      2) memberVO 있으면 => 암호 체크 : jsp 전송한 암호를 암호화해서 DB와 비교(OK)
	      if(infoVO != null) {
//	          TODO: 암호화 Bcryt , DB 암호와 입력암호가 같은지 비교
//	          사용법 : BCrypt.checkpw(jsp전송암호, DB암호) 맞으면 true, 틀리면 false
	            boolean isMatchedPassword = BCrypt.checkpw(loginVO.getPassword(), infoVO.getPassword());
	            
//	            예외처리 : false 경우 : 암호가 틀립니다.
	            if(isMatchedPassword == false) {
	               throw new Exception("암호가 틀립니다.");
	            }
	      }
	      return infoVO;
	   }
	   
	   // register(insert) : source
	   @Override
	   public void registerMember(InfoVO infoVO) throws Exception {
	      // TODO 1) password 암호화(해싱 암호화)
//	      사용법 : BCrypt.hashpw(jsp전달암호, 옵션);
	      String hashedPassword = BCrypt.hashpw(infoVO.getPassword(), BCrypt.gensalt());      
	      // TODO 2) MemberMapper 객체 함수 실행   
	      infoVO.setPassword(hashedPassword);
	      infoMapper.register(infoVO);
	   } 
	
	
	
	
	
	
	
	

}
