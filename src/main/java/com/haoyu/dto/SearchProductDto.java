package com.haoyu.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchProductDto {

    private String keyword;

    private String search_source;
    
    private Integer search_status;
    
    private Integer pid;
}
