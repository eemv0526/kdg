package com.simplecoding.repositoryexam.vo.free;

import java.sql.Date;

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
public class FreeVO extends Criteria{
	
	
	  private String uuid;            // 기본키
	   private String freeTitle;       // 제목   
	   private String freeContent;     // 내용   
	   private byte[] freeData;        // 이미지파일   
	   private MultipartFile image;    // 내부적 사용(이미지파일)   
	   private String freeUrl;         // 다운로드 url(클릭:이미지 다운로드됨)   
	   private int freeId;
	    private String freeAuthor;       // 작성자
	    private Date freeCreatedDate;    // 작성시간
	   
	   
	public FreeVO(String uuid, String freeTitle, String freeContent, byte[] freeData) {
		super();
		this.uuid = uuid;
		this.freeTitle = freeTitle;
		this.freeContent = freeContent;
		this.freeData = freeData;
	}
	public FreeVO(String freeTitle, String freeContent, byte[] freeData) {
		super();
		this.freeTitle = freeTitle;
		this.freeContent = freeContent;
		this.freeData = freeData;
	}
	
	
	
	
	

}
