package com.haoyu.param;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MesChistoryVo {
    private Integer id;

    private Integer chistoryFactoryid;

    private String chistoryStep;

    private String chistoryTime;

    private String chistoryGoal;

    private String chistoryResult;

    private Integer chistoryStorageid;

    private String chistoryRemark;

    private Integer chistoryStatus;

}