package com.simplecoding.repositoryexam.controller.info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.simplecoding.repositoryexam.service.info.InfoService;
import com.simplecoding.repositoryexam.vo.info.InfoVO;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class InfoController {
	
	@Autowired InfoService infoService;
	
	
	// 로그인 화면
	   @GetMapping("/login")
	   public String loginView() {
	      return "info/login";
	   }
	   
	   // 회원가입 화면
	   @GetMapping("/register")
	   public String registerView() {
	      return "info/register";
	   }
	   
	   // 로그인 진행 : 로그인 버튼 클릭시 실행 : 보안(post) get방식(id/password 노출)
	   @PostMapping("/loginProcess")
	   public String login(@ModelAttribute InfoVO loginVO,
	                  HttpServletRequest request
	         ) throws Exception {
	      // 1) email/password 가지고 DB 에 정보가 있는지 확인 : 인증 (select sql)
	      InfoVO infoVO = infoService.authenticateMember(loginVO);
	      // 선택) 예외처리 : 회원이 없으면 없습니다. 
	      if(infoVO == null) {
	         throw new Exception("회원이 없습니다.");
	      }
	      // 2) 인증 OK(DB 에 유저가 있으면) : 세션에 email/password 객체 넣기
	      request.getSession().setAttribute("infoVO", infoVO);
	      
	      // 세션에 저장된 사용자 정보를 콘솔에 출력 (log4j로 출력)
	        log.info("로그인한 사용자 정보: " + infoVO);
	   
	      return "redirect:/main"; // 첫페이지 강제 이동
	   }
	   
	   // 로그아웃 메뉴 클릭시 실행
	   @GetMapping("/logout")
	   public String logout(HttpSession httpSession) {

	      httpSession.removeAttribute("infoVO");
//	      2) 세션 무효화 실행
	      httpSession.invalidate();
	      return "redirect:/main";
	   }
	   
	   // 회원가입 :
	   @PostMapping("/register/addition")
	   public String register(@ModelAttribute InfoVO infoVO) throws Exception {
	      log.info("테스트 : " + infoVO);
//	      1) 상세조회 해서 우리 DB 있는 사람인지 확인 : 있으면 가입되어 있음 (끝)
	      InfoVO infoVO2 = infoService.authenticateMember(infoVO);
//	      선택) 예외처리 : 우리 DB 있는 사람인지 확인
	      if(infoVO2 != null) {
	         throw new Exception("이미 가입되었습니다.");
	      }
	      
	      
	      infoVO.setCodeName("일반유저");
	      
	      
//	      2) 서비스 insert 함수 실행
	      infoService.registerMember(infoVO);
	      return "redirect:/main";
	   }
	

}
