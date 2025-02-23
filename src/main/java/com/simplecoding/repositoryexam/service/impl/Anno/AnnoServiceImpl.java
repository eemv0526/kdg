package com.simplecoding.repositoryexam.service.impl.Anno;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simplecoding.repositoryexam.mapper.anno.AnnoMapper;

import com.simplecoding.repositoryexam.service.Anno.AnnoService;
import com.simplecoding.repositoryexam.vo.anno.AnnoVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;


@Service
public class AnnoServiceImpl implements AnnoService {
	
	
//	객체지향코딩 : DB 와 연결된 객체 - DeptMapper
	@Autowired
	private AnnoMapper annoMapper;

//	함수 재정의 : source
	@Override
	public List<?> selectAnnoList(Criteria searchVO) throws Exception {
		// TODO : 전체 조회
		return annoMapper.selectAnnoList(searchVO);
	}
	
//	개수 세기 함수 : source 
	@Override
	public int selectAnnoListTotCnt(Criteria searchVO) {
		// TODO deptMapper.개수세기함수 실행
		return annoMapper.selectAnnoListTotCnt(searchVO);
	}
	
//	insert 함수 : source 
	@Override
	public void insertAnno(AnnoVO annoVO) throws Exception {
		// TODO deptMapper 의 insert 함수 실행 : 내부 sql 문 실행
		annoMapper.insert(annoVO);
	}
	
//	상세조회 : source
	@Override
	public AnnoVO selectAnno(int ano) throws Exception {
		// TODO deptMapper 의 상세조회 함수 실행
		AnnoVO annoVO = annoMapper.selectAnno(ano);
		return annoVO;
	}
	@Override
	   public void updateAnno(AnnoVO annoVO) throws Exception {
	      // TODO: deptMapper의 수정 함수 실행
	      
	      annoMapper.update(annoVO);
	   }

	@Override
	public void deleteAnno(AnnoVO annoVO) throws Exception{
		// TODO Auto-generated method stub
		annoMapper.delete(annoVO);
	}
	


	
	
	
	
	
	
	
	
	
	

}
