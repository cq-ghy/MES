package com.haoyu.dto;

import java.util.Date;

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
public class SearchFactoryDto {

    private String keyword;

    private Date fromTime;//yyyy-MM-dd HH:mm:ss

    private Date toTime;
    
    private Integer storageid;

    private String search_prostatus;

}
