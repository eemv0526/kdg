package com.simplecoding.repositoryexam.controller.free;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.simplecoding.repositoryexam.service.free.FreeService;

import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.free.FreeVO;
import com.simplecoding.repositoryexam.vo.info.InfoVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class FreeController {
	
	@Autowired FreeService freeService;
	
	
//  전체 조회 : 
  @GetMapping("free")
  public String selectFreeList(@ModelAttribute("searchVO") Criteria searchVO, Model model) throws Exception {
//          TODO: 0) 페이징 변수에 설정 : 
     searchVO.setPageUnit(10); // 1페이지당 화면에 보이는 개수
     searchVO.setPageSize(2); // 페이지 번호를 보여줄 개수
     
//        TODO: 페이지 객체 생성
     PaginationInfo paginationInfo = new PaginationInfo();         // 페이징 객체
     paginationInfo.setCurrentPageNo(searchVO.getPageIndex());     // 현재 페이지 번호 저장
     paginationInfo.setRecordCountPerPage(searchVO.getPageUnit()); // 1페이지당 보일 게시물 개수
     paginationInfo.setPageSize(searchVO.getPageSize());           // 페이지 번호를 보여줄 개수
     
//        TODO: searchVO 객체 페이징 정보 저장
     searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());           // 첫페이지번호
     searchVO.setLastIndex(paginationInfo.getLastRecordIndex());             // 끝페이지번호
     searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage()); // 1페이지당 보일 게시물 개수
        

     List<?> frees = freeService.selectFreeList(searchVO);
     model.addAttribute("frees", frees);
     

     int totCnt = freeService.selectFreeListTotCnt(searchVO);

     paginationInfo.setTotalRecordCount(totCnt);
//     TODO: 페이징 객체 -> jsp 전달
     model.addAttribute("paginationInfo", paginationInfo);
     
     return "free/free";
  }
	
  
  
//추가 페이지 열기 :
@GetMapping("/freeadd")
public String createFreeView() {
   return "free/freeadd";
}







@PostMapping("/free/add")
public String createFree(@RequestParam(defaultValue = "") String freeTitle,
                         @RequestParam(defaultValue = "") String freeContent,
                         @RequestParam(required = false) MultipartFile image,
                         @SessionAttribute("infoVO") InfoVO infoVO) throws Exception { // InfoVO 세션에서 가져오기

    // 0) InfoVO에서 작성자 정보 가져오기
    String freeAuthor = infoVO != null ? infoVO.getName() : "익명"; // 세션에서 작성자 정보 가져오기. 없으면 "익명" 처리

    // 1) FreeVO 객체 생성, 작성자 정보도 함께 세팅
    FreeVO freeVO = new FreeVO(freeTitle, freeContent, image.getBytes());
    freeVO.setFreeAuthor(freeAuthor); // 작성자 정보 설정

 
    freeService.insertFree(freeVO);

    return "redirect:/free"; // 전체조회 강제이동
}












  
//상세조회 + 첨부파일 전송(jsp) : byte[] 형태로 전송 : @ResponseBody
@GetMapping("/free/free/{uuid}")
@ResponseBody
public ResponseEntity<byte[]> findDownload(@PathVariable String uuid) throws Exception {
// 1) 상세조회 : 객체받기(첨부파일)
 FreeVO freeVO = freeService.selectFree(uuid);
 
// 2) 첨부파일 jsp 전송 : 규격대로 전송(코딩 보냄)
   // 첨부파일 다운로드 응답 생성
   HttpHeaders headers = new HttpHeaders();              // html 문서 객체(머리말)
   headers.setContentDispositionFormData("attachment", freeVO.getUuid()); // 첨부파일(문서형태)
   headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);              // 첨부파일2(문서형태)

//  첨부파일 전송 + OK 신호 보냄
   return new ResponseEntity<byte[]>(freeVO.getFreeData(), headers, HttpStatus.OK);
}
  
  
//디테일+리뷰 댓글 전체조회 합치기
@GetMapping("/free/detail")
public String updateFreeView(@RequestParam String uuid, 
                           @RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex, 
                           Model model) throws Exception {
  // 1) 만화 상세조회 (ComicVO)
  FreeVO freeVO = freeService.selectFree(uuid);
  
  

  model.addAttribute("FreeVO", freeVO);
 


  return "free/freedetail";
}


	
//상세조회 페이지 열기 :
@GetMapping("/free/update")
public String updateupdateFreeView(@RequestParam String uuid, Model model) 
        throws Exception {
//1) deptService 의 상세조회 함수 실행 
FreeVO freeVO = freeService.selectFree(uuid);
//2) 모델에 담아 Jsp 로 전송
model.addAttribute("freeVO", freeVO);
return "free/freeupdate";
}

@PostMapping("/free/update/update")
public String updateFree(@RequestParam String uuid, 
                       @ModelAttribute FreeVO freeVO, 
                       @RequestParam(required = false) MultipartFile image) throws Exception {

  // 이미지를 수정할 때, 새 이미지가 업로드되었는지 확인
  if (image != null && !image.isEmpty()) {
      // 새 이미지 파일을 DB에 저장
      freeVO.setFreeData(image.getBytes());  // 이미지 데이터 저장
      // 수정된 이미지를 DB에 저장할 URL 설정
      freeVO.setFreeUrl("http://localhost:8000/kwon/free/free/" + uuid);  // DB에 저장될 URL
  }


  freeService.updateFree(freeVO); // DB 업데이트

  return "redirect:/free";  // 수정 완료 후 전체 목록 페이지로 리디렉션
}
	
	
		
	
//삭제 함수 : post 방식, uuid(기본키)
@PostMapping("/free/delete")
public String deleteFree(@RequestParam(defaultValue = "") String uuid) throws Exception {
log.info("테스트 : " + uuid);
freeService.deleteFree(uuid);
return "redirect:/free"; // 전체조회 강제이동

}
	
	
	
	
	
	
	
	
}
