package com.simplecoding.repositoryexam.vo.list;

import org.springframework.web.multipart.MultipartFile;

import com.simplecoding.repositoryexam.vo.common.Criteria;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@SuppressWarnings("serial")
public class LnvVO extends Criteria {

	
	  private String uuid;            // 기본키
	   private String lnvTitle;       // 제목   
	   private String lnvContent;     // 내용   
	   private byte[] lnvData;        // 이미지파일   
	   private MultipartFile image;    // 내부적 사용(이미지파일)   
	   private String lnvUrl;         // 다운로드 url(클릭:이미지 다운로드됨)   
	   private String lnvDescription; // 설명
	    private String lnvGenre;       // 장르
	   
	   
	    // 매개변수 4개짜리 생성자 : uuid, listTitle, listContent, listData
	    public LnvVO(String uuid, String lnvTitle, String lnvContent, byte[] lnvData) {
	        super();
	        this.uuid = uuid;
	        this.lnvTitle = lnvTitle;
	        this.lnvContent = lnvContent;
	        this.lnvData = lnvData;
	    }

	    // 매개변수 3개짜리 생성자 : listTitle, listContent, listData
	    public LnvVO(String lnvTitle, String lnvContent, byte[] lnvData) {
	        super();
	        this.lnvTitle = lnvTitle;
	        this.lnvContent = lnvContent;
	        this.lnvData = lnvData;
	    }

	    // 추가된 생성자 : listTitle, listContent, listData, listDescription, listGenre
	    public LnvVO(String lnvTitle, String lnvContent, byte[] lnvData, String lnvDescription, String lnvGenre) {
	        this.lnvTitle = lnvTitle;
	        this.lnvContent = lnvContent;
	        this.lnvData = lnvData;
	        this.lnvDescription = lnvDescription;
	        this.lnvGenre = lnvGenre;
	    }

	    // 추가된 생성자 : uuid, listTitle, listContent, listData, listDescription, listGenre, image
	    public LnvVO(String uuid, String lnvTitle, String lnvContent, byte[] lnvData, String lnvDescription, String listGenre, MultipartFile image) {
	        this.uuid = uuid;
	        this.lnvTitle = lnvTitle;
	        this.lnvContent = lnvContent;
	        this.lnvData = lnvData;
	        this.lnvDescription = lnvDescription;
	        this.lnvGenre = lnvGenre;
	        this.image = image;
	    }

	
	
	
}
