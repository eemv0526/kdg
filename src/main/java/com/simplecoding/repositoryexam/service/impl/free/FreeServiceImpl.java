package com.simplecoding.repositoryexam.service.impl.free;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.simplecoding.repositoryexam.mapper.free.FreeMapper;
import com.simplecoding.repositoryexam.service.free.FreeService;
import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.free.FreeVO;


@Service
public class FreeServiceImpl implements FreeService{
	
	@Autowired FreeMapper freeMapper;
	
	
	@Override
	public List<?> selectFreeList(Criteria searchVO) throws Exception {
		// TODO Auto-generated method stub
		return freeMapper.selectFreeList(searchVO);
	}

	@Override
	public int selectFreeListTotCnt(Criteria searchVO) {
		// TODO Auto-generated method stub
		return freeMapper.selectFreeListTotCnt(searchVO);
	}

	@Override
	public void insertFree(FreeVO freeVO) throws Exception {
		// TODO Auto-generated method stub
		

		// TODO fileDbMapper의 insert 함수 실행 ( 내부 sql 실행)
		// 업무 로직 추가 :
		// 1) 기본키를 자동 생성 : java의 자동 생성 기능 (UUID 만들기-유일한 문자) -> 첨부파일이름 사용
		String newUuid = UUID.randomUUID().toString(); // 새 uuid
		// 2) 첨부 파일 다운로드 받기 : 다운로드 URL 필요.
		// => http://localhost:8000/advanced/fileDb/첨부파일명(uuid)
		String fileDownloadURL = generateDownloadUrl(newUuid);
		// 3) fileDbVO 객체에 위의 값을 수정하기
		freeVO.setUuid(newUuid);
		freeVO.setFreeUrl(fileDownloadURL);
		// 4) fileDbMapper의 insert 실행
		freeMapper.insert(freeVO);
		
	}

	
	public String generateDownloadUrl(String uuid) {
		return ServletUriComponentsBuilder // url 만들어주는 자바 객체
				.fromCurrentContextPath() // spring 기본 주소 제공 : http://localhost:8000
				.path("/free/free/") // advanced/fileDb
				.path(uuid) // /uuid
				.toUriString(); // 위의 것을 모두 조합 http://localhost:8000/advanced/fileDb/첨부파일명(uuid) 완성됨

	}

	

	@Override
	public FreeVO selectFree(String uuid) throws Exception {
		
		FreeVO freeVO = freeMapper.selectFree(uuid);
		

		
		return freeVO;
	}
	
	
	
	@Override
	public void deleteFree(String uuid) throws Exception {
		// TODO Auto-generated method stub
		freeMapper.delete(uuid);
		
	}

	@Override
	public void updateFree(FreeVO freeVO) throws Exception {
		// TODO Auto-generated method stub
		 freeMapper.update(freeVO);
	}

	
	
	
	
	
	

}
