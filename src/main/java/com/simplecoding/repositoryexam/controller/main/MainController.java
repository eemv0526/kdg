package com.simplecoding.repositoryexam.controller.main;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.simplecoding.repositoryexam.service.list.ComicService;
import com.simplecoding.repositoryexam.service.list.ListService;
import com.simplecoding.repositoryexam.service.list.LnvService;
import com.simplecoding.repositoryexam.vo.common.Criteria;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {

	@Autowired ListService listService;
	@Autowired LnvService lnvService;
	@Autowired ComicService comicService;
	
	@GetMapping("/main")
	 public String selectListList(@ModelAttribute("searchVO") Criteria searchVO, Model model) throws Exception {

		
		
		
		//      TODO: 0) 페이징 변수에 설정 : 
 searchVO.setPageUnit(20); // 1페이지당 화면에 보이는 개수
 searchVO.setPageSize(2); // 페이지 번호를 보여줄 개수
 
//    TODO: 페이지 객체 생성
 PaginationInfo paginationInfo = new PaginationInfo();         // 페이징 객체
 paginationInfo.setCurrentPageNo(searchVO.getPageIndex());     // 현재 페이지 번호 저장
 paginationInfo.setRecordCountPerPage(searchVO.getPageUnit()); // 1페이지당 보일 게시물 개수
 paginationInfo.setPageSize(searchVO.getPageSize());           // 페이지 번호를 보여줄 개수
 
//    TODO: searchVO 객체 페이징 정보 저장
 searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());           // 첫페이지번호
 searchVO.setLastIndex(paginationInfo.getLastRecordIndex());             // 끝페이지번호
 searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage()); // 1페이지당 보일 게시물 개수
    
// 1) fileDbService 의 전체조회 함수 실행
 List<?> lists = listService.selectListList(searchVO);
 model.addAttribute("lists", lists);
 


 int totCnt = listService.selectListListTotCnt(searchVO);

 paginationInfo.setTotalRecordCount(totCnt);
// TODO: 페이징 객체 -> jsp 전달
 model.addAttribute("paginationInfo", paginationInfo);
 
 
 // 2) 신간 도서 조회
 List<?> lnvs = lnvService.selectLnvList(searchVO);
 model.addAttribute("lnvs", lnvs);
 
 

int lnvtotCnt = lnvService.selectLnvListTotCnt(searchVO);

paginationInfo.setTotalRecordCount(totCnt);
//TODO: 페이징 객체 -> jsp 전달
model.addAttribute("paginationInfo", paginationInfo);

 

// 2) 신간 도서 조회
List<?> comics = comicService.selectComicList(searchVO);
model.addAttribute("comics", comics);



int comictotCnt = comicService.selectComicListTotCnt(searchVO);

paginationInfo.setTotalRecordCount(totCnt);
//TODO: 페이징 객체 -> jsp 전달
model.addAttribute("paginationInfo", paginationInfo);

 
 
 
 return "main/main";
}
	
}
