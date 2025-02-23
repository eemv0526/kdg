package com.simplecoding.repositoryexam.vo.anno;




import com.simplecoding.repositoryexam.vo.common.Criteria;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@ToString
@Setter
@AllArgsConstructor
@NoArgsConstructor
@SuppressWarnings("serial")
public class AnnoVO extends Criteria{
	
	   private int ano;               // ANO : 기본키 (NUMBER)
	    private String title;           // TITLE : 제목 (VARCHAR2)
	    private String content;         // CONTENT : 내용 (CLOB)
	
	
	

}
