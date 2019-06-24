package com.haoyu.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchOrderDto {

    private String keyword;

    private Date fromTime;//yyyy-MM-dd HH:mm:ss

    private Date toTime;
	
    private Integer search_status=0;
}
