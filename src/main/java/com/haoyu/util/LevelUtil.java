package com.haoyu.util;

import org.apache.commons.lang3.StringUtils;
//部门层级计算工具
public class LevelUtil {

    public final static String SEPARATOR = ".";

    public final static String ROOT = "0";

    // 0
    // 0.1
    // 0.1.2
    // 0.1.3
    // 0.4
    //根据parent的层级描述和parentid进行层级计算
    public static String calculateLevel(String parentLevel, int parentId) {
        if (StringUtils.isBlank(parentLevel)) {
            return ROOT;
        } else {
            return StringUtils.join(parentLevel, SEPARATOR, parentId);
        }
    }
    //工具测试案例
    public static void main(String[] args) {
    	//1.11
		String temp=StringUtils.join("1",".",11);
		System.out.println(temp);
    }
}
