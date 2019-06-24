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
public class SearchFactoryParam {

    private String keyword;

    private String fromTime;//yyyy-MM-dd HH:mm:ss

    private String toTime;
    
    private String storageid;
    
    private String search_prostatus;
}
