package com.simplecoding.repositoryexam.controller.comment;




import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simplecoding.repositoryexam.service.comment.CcService;
import com.simplecoding.repositoryexam.service.list.ComicService;
import com.simplecoding.repositoryexam.service.list.ListService;
import com.simplecoding.repositoryexam.service.list.LnvService;
import com.simplecoding.repositoryexam.vo.comment.CcVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.info.InfoVO;
import com.simplecoding.repositoryexam.vo.list.ComicVO;
import com.simplecoding.repositoryexam.vo.list.ListVO;
import com.simplecoding.repositoryexam.vo.list.LnvVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CcController {
	
	
	@Autowired CcService ccService;
	@Autowired ComicService comicService;
	@Autowired LnvService lnvService;
	@Autowired ListService listService;
	
	
//  전체 조회 함수
  @GetMapping("/cc")
  public String selectCcList(
        @ModelAttribute("searchVO") Criteria searchVO,
        Model model) throws Exception {
     
//     TODO: 0) 페이징 변수에 설정 : 
     searchVO.setPageUnit(20); // 1페이지당 화면에 보이는 개수
     searchVO.setPageSize(2); // 페이지 번호를 보여줄 개수
     
//     TODO: 페이지 객체 생성
     PaginationInfo paginationInfo = new PaginationInfo();         // 페이징 객체
     paginationInfo.setCurrentPageNo(searchVO.getPageIndex());     // 현재 페이지 번호 저장
     paginationInfo.setRecordCountPerPage(searchVO.getPageUnit()); // 1페이지당 보일 게시물 개수
     paginationInfo.setPageSize(searchVO.getPageSize());           // 페이지 번호를 보여줄 개수
     
//     TODO: searchVO 객체 페이징 정보 저장
     searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());           // 첫페이지번호
     searchVO.setLastIndex(paginationInfo.getLastRecordIndex());             // 끝페이지번호
     searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage()); // 1페이지당 보일 게시물 개수
     
// 
     List<?> ccs =ccService.selectCcList(searchVO);

     model.addAttribute("ccs", ccs);
     

     int totCnt = ccService.selectCcListTotCnt(searchVO);
     paginationInfo.setTotalRecordCount(totCnt);
//     TODO: 페이징 객체 -> jsp 전달
     model.addAttribute("paginationInfo", paginationInfo);
     
     return "comic/comicdetail";
  }


	
	
	

	
	
	
 
  @GetMapping("/ccadd")
  public String createCcView(@RequestParam String uuid, Model model, HttpSession session) throws Exception {
      // 로그인된 사용자 정보 가져오기
      InfoVO infoVO = (InfoVO) session.getAttribute("infoVO");

      if (infoVO == null) {
          // 로그인되지 않은 사용자일 경우
          return "redirect:/login"; // 로그인 페이지로 리디렉션
      }

      // 이메일을 InfoVO에서 가져와서 CcVO에 설정
      String userEmail = infoVO.getEmail();

      // CcVO 객체 생성 및 필드 설정
      CcVO ccVO = new CcVO();
      ccVO.setEmail(userEmail);
      ccVO.setUuid(uuid);

      // comicVO 상세 조회
      ComicVO comicVO = comicService.selectComic(uuid);

      // comicVO를 model에 담아 JSP로 전달
      model.addAttribute("comicVO", comicVO);

      return "comic/ccadd"; // 리뷰 작성 페이지로 이동 (JSP 페이지)
  }
  
  
  
  @GetMapping("/lcadd")
  public String createCc2View(@RequestParam String uuid, Model model, HttpSession session) throws Exception {
      // 로그인된 사용자 정보 가져오기
      InfoVO infoVO = (InfoVO) session.getAttribute("infoVO");

      if (infoVO == null) {
          // 로그인되지 않은 사용자일 경우
          return "redirect:/login"; // 로그인 페이지로 리디렉션
      }

      // 이메일을 InfoVO에서 가져와서 CcVO에 설정
      String userEmail = infoVO.getEmail();

      // CcVO 객체 생성 및 필드 설정
      CcVO ccVO = new CcVO();
      ccVO.setEmail(userEmail);
      ccVO.setUuid(uuid);

      // comicVO 상세 조회
      LnvVO lnvVO = lnvService.selectLnv(uuid);

      // comicVO를 model에 담아 JSP로 전달
      model.addAttribute("lnvVO", lnvVO);

      return "lnv/lcadd"; // 리뷰 작성 페이지로 이동 (JSP 페이지)
  }
  
  
  
  @GetMapping("/bcadd")
  public String createCc3View(@RequestParam String uuid, Model model, HttpSession session) throws Exception {
      // 로그인된 사용자 정보 가져오기
      InfoVO infoVO = (InfoVO) session.getAttribute("infoVO");

      if (infoVO == null) {
          // 로그인되지 않은 사용자일 경우
          return "redirect:/login"; // 로그인 페이지로 리디렉션
      }

      // 이메일을 InfoVO에서 가져와서 CcVO에 설정
      String userEmail = infoVO.getEmail();

      // CcVO 객체 생성 및 필드 설정
      CcVO ccVO = new CcVO();
      ccVO.setEmail(userEmail);
      ccVO.setUuid(uuid);

      // comicVO 상세 조회
      ListVO listVO = listService.selectList(uuid);

      // comicVO를 model에 담아 JSP로 전달
      model.addAttribute("listVO", listVO);

      return "list/bcadd"; // 리뷰 작성 페이지로 이동 (JSP 페이지)
  }
  
 
  
  
  @PostMapping("/cc/add/{uuid}")
  public String createCc(@ModelAttribute CcVO ccVO, 
             BindingResult bindingResult, 
             @PathVariable String uuid 
            ) throws Exception {

     

      // 서비스의 insert 함수 실행
      ccService.insertCc(ccVO);

   
      // 글쓰기 후 comic/detail로 리디렉션
      return "redirect:/comic/detail?uuid=" + uuid; // uuid를 쿼리 파라미터로 전달
  }

  
  
  
  
  
  
  
  
  
  
  @PostMapping("/bc/add/{uuid}")
  public String createCc3(@ModelAttribute CcVO ccVO, 
             BindingResult bindingResult, @PathVariable String uuid) throws Exception {
      // 서비스의 insert 함수 실행
      ccService.insertCc(ccVO);

   
      return "redirect:/list/detail?uuid=" + uuid; // uuid를 쿼리 파라미터로 전달
  }
	
  
  

  @PostMapping("/cc/delete")
  public String deleteCc(@ModelAttribute CcVO ccVO) throws Exception {
  
	   ccService.deleteCc(ccVO);
     return "redirect:/comic"; // 2) 전체조회로 강제이동
  }
	
  
  @PostMapping("/lc/delete")
  public String deleteCc2(@ModelAttribute CcVO ccVO) throws Exception {

	   ccService.deleteCc(ccVO);
     return "redirect:/lnv"; // 2) 전체조회로 강제이동
  }
	
	
  @PostMapping("/bc/delete")
  public String deleteCc3(@ModelAttribute CcVO ccVO) throws Exception {

	   ccService.deleteCc(ccVO);
     return "redirect:/list"; // 2) 전체조회로 강제이동
  }
	
	
	
	

}
