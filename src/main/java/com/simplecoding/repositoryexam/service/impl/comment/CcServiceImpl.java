package com.simplecoding.repositoryexam.service.impl.comment;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.simplecoding.repositoryexam.mapper.comment.CcMapper;
import com.simplecoding.repositoryexam.service.comment.CcService;
import com.simplecoding.repositoryexam.vo.comment.CcVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

@Service
public class CcServiceImpl implements CcService{

	
	
//	객체지향코딩 : DB 와 연결된 객체 - DeptMapper
	@Autowired
	private CcMapper ccMapper;

//	함수 재정의 : source
	@Override
	public List<?> selectCcList(Criteria searchVO) throws Exception {
		// TODO : 전체 조회
		return ccMapper.selectCcList(searchVO);
	}
	
//	개수 세기 함수 : source 
	@Override
	public int selectCcListTotCnt(Criteria searchVO) {
		// TODO deptMapper.개수세기함수 실행
		return ccMapper.selectCcListTotCnt(searchVO);
	}
	
//	insert 함수 : source 
	@Override
	public void insertCc(CcVO ccVO) throws Exception {
		// TODO deptMapper 의 insert 함수 실행 : 내부 sql 문 실행
		ccMapper.insert(ccVO);
	}
	
//	상세조회 : source
	@Override
	public CcVO selectCc(String uuid) throws Exception {
		// TODO deptMapper 의 상세조회 함수 실행
		CcVO ccVO = ccMapper.selectCc(uuid);
		return ccVO;
	}
	
	
    @Override
    public List<CcVO> getCommentsByComicUuid(String uuid) {
        // CcMapper를 통해 uuid로 댓글 조회
        return ccMapper.getCommentsByUuid(uuid);
    }
	
	

    @Override
    public Double getAverageRating(String uuid) {
        return ccMapper.selectAverageRating(uuid);
    }
	
    @Override
	public void deleteCc(CcVO ccVO) throws Exception{
		// TODO Auto-generated method stub
		ccMapper.delete(ccVO);
	}
	
	
	

}
