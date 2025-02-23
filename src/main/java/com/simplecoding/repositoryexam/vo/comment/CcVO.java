package com.simplecoding.repositoryexam.vo.comment;

import java.time.LocalDateTime;

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
public class CcVO extends Criteria {
	
	
	
    private int comicId;          // 댓글의 고유 ID (PK, 자동 증가)
    private String uuid;          // 특정 만화책의 UUID
    private String email;         // 작성자 이메일
    private int rating;           // 별점 (1~5)
    private String comicComment;  // 댓글 내용
    private LocalDateTime createTime;  // 작성 시간
	
	

}
