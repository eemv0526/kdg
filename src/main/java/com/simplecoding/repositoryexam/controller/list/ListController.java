package com.simplecoding.repositoryexam.controller.list;
import java.text.DecimalFormat;
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
import org.springframework.web.multipart.MultipartFile;

import com.simplecoding.repositoryexam.service.comment.CcService;
import com.simplecoding.repositoryexam.service.list.ListService;
import com.simplecoding.repositoryexam.vo.comment.CcVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.list.ListVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller

public class ListController {
	
	@Autowired ListService listService;
	@Autowired CcService ccService;
	
//  전체 조회 : 
  @GetMapping("/list")
  public String selectListList(@ModelAttribute("searchVO") Criteria searchVO, Model model) throws Exception {
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
     
 
        

     List<?> lists = listService.selectListList(searchVO);
     model.addAttribute("lists", lists);
     

     int totCnt = listService.selectListListTotCnt(searchVO);

     paginationInfo.setTotalRecordCount(totCnt);
//     TODO: 페이징 객체 -> jsp 전달
     model.addAttribute("paginationInfo", paginationInfo);
     
     return "list/list";
  }
	
  
  
//추가 페이지 열기 :
@GetMapping("/listadd")
public String createListView() {
   return "list/listadd";
}

//저장 버튼 클릭시 실행 :
@PostMapping("/list/add")
public String createList(@RequestParam(defaultValue = "") String listTitle,
                  @RequestParam(defaultValue = "") String listContent,
                  @RequestParam(required = false) MultipartFile image,
                  @RequestParam(defaultValue = "") String listDescription,
                  @RequestParam(defaultValue = "") String listGenre
      ) throws Exception {
	
	

//   0) 생성자 실행 : 
   ListVO listVO = new ListVO(listTitle, listContent, image.getBytes(),listDescription, listGenre);

   listService.insertList(listVO);
   return "redirect:/list"; // 전체조회 강제이동
}

  
//상세조회 + 첨부파일 전송(jsp) : byte[] 형태로 전송 : @ResponseBody
@GetMapping("/list/list/{uuid}")
@ResponseBody
public ResponseEntity<byte[]> findDownload(@PathVariable String uuid) throws Exception {
// 1) 상세조회 : 객체받기(첨부파일)
 ListVO listVO = listService.selectList(uuid);
 
// 2) 첨부파일 jsp 전송 : 규격대로 전송(코딩 보냄)
   // 첨부파일 다운로드 응답 생성
   HttpHeaders headers = new HttpHeaders();              // html 문서 객체(머리말)
   headers.setContentDispositionFormData("attachment", listVO.getUuid()); // 첨부파일(문서형태)
   headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);              // 첨부파일2(문서형태)

//  첨부파일 전송 + OK 신호 보냄
   return new ResponseEntity<byte[]>(listVO.getListData(), headers, HttpStatus.OK);
}
  
  

//디테일+리뷰 댓글 전체조회 합치기
@GetMapping("/list/detail")
public String updateLnvView(@RequestParam String uuid, 
                         @RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex, 
                         Model model) throws Exception {
// 1) 만화 상세조회 (ComicVO)
ListVO listVO = listService.selectList(uuid);

// 해당 uuid에 맞는 댓글 조회
List<CcVO> ccs = ccService.getCommentsByComicUuid(uuid);

Double averageRating = ccService.getAverageRating(uuid);  // 평균 별점 조회


// 평균 별점을 소수점 한 자리로 형식화
String formattedRating = "0.0";  // 기본값 설정
if (averageRating != null) {
    DecimalFormat df = new DecimalFormat("#.#");
    formattedRating = df.format(averageRating);
}






// 2) 페이징 처리
Criteria searchVO = new Criteria();
searchVO.setPageIndex(pageIndex);
searchVO.setPageUnit(20);  // 한 페이지에 보일 개수
searchVO.setPageSize(2);  // 페이지 번호 개수



// 4) 리뷰 목록과 페이징 정보 모델에 추가
int totCnt = ccService.selectCcListTotCnt(searchVO);  // 전체 리뷰 개수
PaginationInfo paginationInfo = new PaginationInfo();
paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
paginationInfo.setPageSize(searchVO.getPageSize());
paginationInfo.setTotalRecordCount(totCnt);




model.addAttribute("formattedRating", formattedRating);  // 포맷된 평균 별점  // 모델에 추가
model.addAttribute("ListVO", listVO);
model.addAttribute("ccs", ccs); 
model.addAttribute("paginationInfo", paginationInfo); // 페이징 정보 추가

return "list/listdetail";
}





























  
  
// 삭제 함수 : post 방식, uuid(기본키)
@PostMapping("/list/delete")
public String deleteList(@RequestParam(defaultValue = "") String uuid) throws Exception {
   log.info("테스트 : " + uuid);
   listService.deleteList(uuid);
   return "redirect:/list"; // 전체조회 강제이동

}
 
//상세조회 페이지 열기 :
@GetMapping("/list/update")
public String updateDeptView(@RequestParam String uuid, Model model) 
          throws Exception {

 ListVO listVO = listService.selectList(uuid);

 model.addAttribute("listVO", listVO);
 return "list/listupdate";
}

@PostMapping("/list/update/update")
public String updateList(@RequestParam String uuid, 
                         @ModelAttribute ListVO listVO, 
                         @RequestParam(required = false) MultipartFile image) throws Exception {

    // 이미지를 수정할 때, 새 이미지가 업로드되었는지 확인
    if (image != null && !image.isEmpty()) {
        // 새 이미지 파일을 DB에 저장
        listVO.setListData(image.getBytes());  // 이미지 데이터 저장
        // 수정된 이미지를 DB에 저장할 URL 설정
        listVO.setListUrl("http://localhost:8000/kwon/list/list/" + uuid);  // DB에 저장될 URL
    }

 
    listService.updateList(listVO); // DB 업데이트

    return "redirect:/list";  // 수정 완료 후 전체 목록 페이지로 리디렉션
}
}
