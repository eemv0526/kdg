package com.simplecoding.repositoryexam.service.impl.list;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.simplecoding.repositoryexam.mapper.comment.CcMapper;
import com.simplecoding.repositoryexam.mapper.list.ComicMapper;

import com.simplecoding.repositoryexam.service.list.ComicService;
import com.simplecoding.repositoryexam.vo.comment.CcVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;
import com.simplecoding.repositoryexam.vo.list.ComicVO;

@Service
public class ComicServiceImpl implements ComicService {

	
	@Autowired ComicMapper comicMapper;
	@Autowired
    private CcMapper ccMapper;

	@Override
	public List<?> selectComicList(Criteria searchVO) throws Exception {
		// TODO Auto-generated method stub
		return comicMapper.selectComicList(searchVO);
	}

	@Override
	public int selectComicListTotCnt(Criteria searchVO) {
		// TODO Auto-generated method stub
		return comicMapper.selectComicListTotCnt(searchVO);
	}

	@Override
	public void insertComic(ComicVO comicVO) throws Exception {
		// TODO Auto-generated method stub
		

		// TODO fileDbMapper의 insert 함수 실행 ( 내부 sql 실행)
		// 업무 로직 추가 :
		// 1) 기본키를 자동 생성 : java의 자동 생성 기능 (UUID 만들기-유일한 문자) -> 첨부파일이름 사용
		String newUuid = UUID.randomUUID().toString(); // 새 uuid
		// 2) 첨부 파일 다운로드 받기 : 다운로드 URL 필요.
		// => http://localhost:8000/advanced/fileDb/첨부파일명(uuid)
		String fileDownloadURL = generateDownloadUrl(newUuid);
		// 3) fileDbVO 객체에 위의 값을 수정하기
		comicVO.setUuid(newUuid);
		comicVO.setComicUrl(fileDownloadURL);
		// 4) fileDbMapper의 insert 실행
		comicMapper.insert(comicVO);
		
	}

	
	public String generateDownloadUrl(String uuid) {
		return ServletUriComponentsBuilder // url 만들어주는 자바 객체
				.fromCurrentContextPath() // spring 기본 주소 제공 : http://localhost:8000
				.path("/comic/comic/") // advanced/fileDb
				.path(uuid) // /uuid
				.toUriString(); // 위의 것을 모두 조합 http://localhost:8000/advanced/fileDb/첨부파일명(uuid) 완성됨

	}

	
	
	
	
	
	@Override
	public ComicVO selectComic(String uuid) throws Exception {
		
		ComicVO comicVO = comicMapper.selectComic(uuid);
		

		
		return comicVO;
	}

	@Override
	public void deleteComic(String uuid) throws Exception {
		// TODO Auto-generated method stub
		comicMapper.delete(uuid);
		
	}

	@Override
	public void updateComic(ComicVO comicVO) throws Exception {
		// TODO Auto-generated method stub
		 comicMapper.update(comicVO);
	}

	
	
	
	 
	
	
	
	
	
	
	
	
	
	
	
	
}
