package com.haoyu.test;

import org.junit.Test;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class UtilsTest {

	@Test
	public void mapTest() {
		Multimap<String, String> map = ArrayListMultimap.create();
		map.put("1","a");
		map.put("1","b");
		map.put("1","c");
		map.put("2","a2");
		map.put("2","b2");
		map.put("2","c2");
		map.put("3","a3");
		map.put("3","b3");
		map.put("3","c3");
		System.out.println(map.get("1"));
	}
	
}
