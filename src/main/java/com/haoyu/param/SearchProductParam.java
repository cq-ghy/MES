package com.haoyu.param;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SearchProductParam{

    private String keyword;

    private String search_source;
	
    private Integer search_status;
    
    private Integer pid;
}
