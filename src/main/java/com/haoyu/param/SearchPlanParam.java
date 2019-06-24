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
public class SearchPlanParam {

    private String keyword;

    private String fromTime;//yyyy-MM-dd HH:mm:ss

    private String toTime;
    
    private String search_status;
    
    private String search_msource;
	
}
