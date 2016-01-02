package com.buildstuff.springmvc.controller;
 
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.buildstuff.springmvc.model.User;
import com.buildstuff.springmvc.service.GraphService;
import com.buildstuff.springmvc.service.UserService;
 
@RestController
public class HelloWorldRestController {
 
    @Autowired
    UserService userService;  
    
    @Autowired
    GraphService graphService; 
     
    @RequestMapping(value = "/user/", method = RequestMethod.GET)
    public ResponseEntity<List<User>> listAllUsers() {
        List<User> users = userService.findAllUsers();
        if(users.isEmpty()){
            return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<User>>(users, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/graph/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<HashMap<String, List<Integer>>> getGraphDataByAdvertiser
    									(@PathVariable("id") String id ) {
    	HashMap<String,List<Integer>> data = graphService.getGraphDataByAdvertiser(id);
    	//System.out.println("IN GETGRAPHADVERT "+id);
        if(data.isEmpty()){
            return new ResponseEntity<HashMap<String,List<Integer>>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<HashMap<String,List<Integer>>>(data, HttpStatus.OK);
    }
 
 
  
 
}