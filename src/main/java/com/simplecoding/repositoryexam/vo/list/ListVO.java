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
public class ListVO extends Criteria {
	
	
	  private String uuid;            // 기본키
	   private String listTitle;       // 제목   
	   private String listContent;     // 내용   
	   private byte[] listData;        // 이미지파일   
	   private MultipartFile image;    // 내부적 사용(이미지파일)   
	   private String listUrl;         // 다운로드 url(클릭:이미지 다운로드됨)   
	   private String listDescription; // 설명
	    private String listGenre;       // 장르
	   
	   
	    // 매개변수 4개짜리 생성자 : uuid, listTitle, listContent, listData
	    public ListVO(String uuid, String listTitle, String listContent, byte[] listData) {
	        super();
	        this.uuid = uuid;
	        this.listTitle = listTitle;
	        this.listContent = listContent;
	        this.listData = listData;
	    }

	    // 매개변수 3개짜리 생성자 : listTitle, listContent, listData
	    public ListVO(String listTitle, String listContent, byte[] listData) {
	        super();
	        this.listTitle = listTitle;
	        this.listContent = listContent;
	        this.listData = listData;
	    }

	    // 추가된 생성자 : listTitle, listContent, listData, listDescription, listGenre
	    public ListVO(String listTitle, String listContent, byte[] listData, String listDescription, String listGenre) {
	        this.listTitle = listTitle;
	        this.listContent = listContent;
	        this.listData = listData;
	        this.listDescription = listDescription;
	        this.listGenre = listGenre;
	    }

	    // 추가된 생성자 : uuid, listTitle, listContent, listData, listDescription, listGenre, image
	    public ListVO(String uuid, String listTitle, String listContent, byte[] listData, String listDescription, String listGenre, MultipartFile image) {
	        this.uuid = uuid;
	        this.listTitle = listTitle;
	        this.listContent = listContent;
	        this.listData = listData;
	        this.listDescription = listDescription;
	        this.listGenre = listGenre;
	        this.image = image;
	    }

	

	

		
	}