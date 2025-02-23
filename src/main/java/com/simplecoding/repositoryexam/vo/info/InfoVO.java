package com.simplecoding.repositoryexam.vo.info;


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
public class InfoVO extends Criteria {
	
	
	private String email;
	private String password;
	private String name;
    private String codeName;

	

}
