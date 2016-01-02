package com.buildstuff.springmvc.service;

import java.util.HashMap;
import java.util.List;

public interface GraphService {

	HashMap<String,List<Integer>> getGraphDataByAdvertiser(String advertiser); 
}
