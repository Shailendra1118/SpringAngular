package com.buildstuff.springmvc.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("graphService")
@Transactional
public class GraphServiceImpl implements GraphService {

	public HashMap<String,List<Integer>> getGraphDataByAdvertiser(String advertiser){		
		HashMap<String, List<Integer>> map = new HashMap<String, List<Integer>>();
		if(advertiser.startsWith("AT&T") || advertiser.equals("1")){
			//int[] values = {1,2,8,4,5,12,7};
			//covert array to Integer list		
			map.put("x-axis", Arrays.asList(1,2,8,4,5,12,7));
			map.put("y-axis", Arrays.asList(23,343,11,34,55,61,500));
		}else if(advertiser.startsWith("Mecy")){
			map.put("x-axis", Arrays.asList(1,30,8,4,5,50,7));
			map.put("y-axis", Arrays.asList(34,189,23,44,300,12,80));
		}else{
			map.put("x-axis", Arrays.asList(50,30,8,20,5,10,7));
			map.put("y-axis", Arrays.asList(1,2,8,4,5,12,7));
		}
		
		return map;
	}
	
	
}
