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
public class ComicVO extends Criteria {
	
	
	
	
	  private String uuid;            // 기본키
	   private String comicTitle;       // 제목   
	   private String comicContent;     // 내용   
	   private byte[] comicData;        // 이미지파일   
	   private MultipartFile image;    // 내부적 사용(이미지파일)   
	   private String comicUrl;         // 다운로드 url(클릭:이미지 다운로드됨)   
	   private String comicDescription; // 설명
	    private String comicGenre;       // 장르
	    private Double averageRating; 
	    
	    
	    
		public ComicVO(String uuid, String comicTitle, String comicContent, byte[] comicData) {
			super();
			this.uuid = uuid;
			this.comicTitle = comicTitle;
			this.comicContent = comicContent;
			this.comicData = comicData;
		}



		public ComicVO(String comicTitle, String comicContent, byte[] comicData) {
			super();
			this.comicTitle = comicTitle;
			this.comicContent = comicContent;
			this.comicData = comicData;
		}



		public ComicVO(String comicTitle, String comicContent, byte[] comicData, String comicDescription,
				String comicGenre) {
			super();
			this.comicTitle = comicTitle;
			this.comicContent = comicContent;
			this.comicData = comicData;
			this.comicDescription = comicDescription;
			this.comicGenre = comicGenre;
		}
	   
	
	    // 추가된 생성자 : uuid, listTitle, listContent, listData, listDescription, listGenre, image
	    public ComicVO(String uuid, String comicTitle, String comicContent, byte[] comicData, String comicDescription, String comicGenre, MultipartFile image) {
	        this.uuid = uuid;
	        this.comicTitle = comicTitle;
	        this.comicContent = comicContent;
	        this.comicData = comicData;
	        this.comicDescription = comicDescription;
	        this.comicGenre = comicGenre;
	        this.image = image;
	    }
	
	
	
	

}
