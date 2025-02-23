package com.simplecoding.repositoryexam.controller.anno;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.simplecoding.repositoryexam.service.Anno.AnnoService;
import com.simplecoding.repositoryexam.vo.anno.AnnoVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class AnoController {
	
	@Autowired AnnoService annoService;
	
	 /** 유효성 체크 객체 */
	   @Resource(name = "beanValidator")
	   protected DefaultBeanValidator beanValidator;
//  전체 조회 함수
  @GetMapping("/anno")
  public String selectAnnoList(
        @ModelAttribute("searchVO") Criteria searchVO,
        Model model) throws Exception {
     
//     TODO: 0) 페이징 변수에 설정 : 
     searchVO.setPageUnit(3); // 1페이지당 화면에 보이는 개수
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
     
//     1) 서비스 객체의 함수를 실행 : deptService.전체조회()
     List<?> annos = annoService.selectAnnoList(searchVO);
//     2) 모델에 결과(depts) 담아 jsp 전송
     model.addAttribute("annos", annos);
     
//     TODO: 3) 부서 테이블의 총개수(서비스 객체의 함수를 실행) : 페이지 객체 저장
     int totCnt = annoService.selectAnnoListTotCnt(searchVO);
     paginationInfo.setTotalRecordCount(totCnt);
//     TODO: 페이징 객체 -> jsp 전달
     model.addAttribute("paginationInfo", paginationInfo);
     
     return "anno/anno";
  }

//추가 페이지 열기 :
@GetMapping("/annoadd")
public String createAnnoView() {
   return "anno/annoadd";

     
  }

//  저장 버튼 클릭시 실행 함수 : insert 실행 -> post 방식
  @PostMapping("/anno/add")
  public String createAnno(@ModelAttribute AnnoVO annoVO, 
		   BindingResult bindingResult) throws Exception {
	   
	   beanValidator.validate(annoVO, bindingResult);
	   if (bindingResult.hasErrors()) {
		return"basic/dept/add_dept";
	}
//     System.out.println("테스트 " + deptVO);
//     사용법 : log.info(변수);
     log.info("테스트 " + annoVO);
//     1) 서비스의 함수 실행 : insert 함수
     annoService.insertAnno(annoVO);
     
     return "redirect:/anno";  // 2) 전제조회 페이지로 강제이동
  }
  
//  상세조회 페이지 열기 :
  @GetMapping("/anno/detail")
  public String updateAnnoView(@RequestParam int ano, Model model) 
              throws Exception {
//     1) deptService 의 상세조회 함수 실행 
     AnnoVO annoVO = annoService.selectAnno(ano);
//     2) 모델에 담아 Jsp 로 전송
     model.addAttribute("annoVO", annoVO);
     return "/anno/annodetail";
  }
  
  
  
  @GetMapping("/anno/update")
  public String updateupdateAnnoView(@RequestParam("ano") int ano, Model model) throws Exception {
      // deptService 의 상세조회 함수 실행
      AnnoVO annoVO = annoService.selectAnno(ano);
      // 모델에 담아 Jsp 로 전송
      model.addAttribute("annoVO", annoVO);
      return "/anno/annoupdate";
  }
  
  
  
  
  
  

//  jsp : 
  @PostMapping("/anno/update/update")
  public String updateDept(@RequestParam int ano,
                    @ModelAttribute AnnoVO annoVO
        ) throws Exception {
//       1) deptService 의 update 함수 실행
     annoService.updateAnno(annoVO);
//       2) 전체조회로 강제이동
     return "redirect:/anno"; // 전체조회로 강제이동
  }
  


  @PostMapping("/anno/delete")
  public String deleteAnno(@ModelAttribute AnnoVO annoVO)throws Exception {
//    1) deptSerive 의 delete 함수 실행
	   annoService.deleteAnno(annoVO);
     return "redirect:/anno"; // 2) 전체조회로 강제이동
  }
	
	
 
	
	
	

}
