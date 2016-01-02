'use strict';

App.controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
          var self = this;
          self.user={id:null,username:'',address:'',email:''};
          self.users=[];
          self.configBookCntbyClassAlot=[];
          //self.companies = ["AT&T", "Bell Canada","Sprint"];

          
          self.load = function(){
          $scope.configBookCntbyClassAlot = {
                  title: {
                      text: ''
                  }
 		 	}
          }
              
          self.fetchAllUsers = function(){
              UserService.fetchAllUsers()
                  .then(
      					       function(data) {
      					    	    console.log("in fetchAllUsers- "+data);
      						        self.users = data;
      						        self.companies = data;
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };   

          self.fetchAllUsers();
          
         //self.setAdvertiserId = function(company){
          
          //code for graph data
          self.fetchGraphData = function(company){
        	  console.log("in fetch Graph data controller method "+company);
              UserService.fetchGraphData(company.id)
                  .then(
      					       function(data) {
      					    	    console.log("in fetchGraphData- "+data["y-axis"]);
      						        //self.users = data;
      					    	    var yAxis = data["y-axis"];
      					    	    var xAxix = data["x-axis"];
      					            self.configBookCntbyClassAlot[company.id] = {
      					                   options: {
      					                       chart: {
      					                           type: 'scatter'
      					                       },
      					                      yAxis: { 
      					                         title: {
      					                             text: 'Count',
      					                         }
      					                     }
      					                   },
      					                   series: [
      					                            {
      					                           	 name: 'Days',
      					                           	 data: yAxis,//[23,343,11,34,55,61,500],
      					                           	 color: 'red',
      					                           	 lineWidth: 1,
      					                           	 step: false
      					                            }
      					                            ],
      					                   title: {
      					                       text: ''
      					                   },
      					                   xAxis: {
      					                       categories: xAxix,//[1,2,8,4,5,12,7],
      					                      labels : { y : 20, rotation: -45 },
      					                       title: {
      					                             text: 'User',
      					                         }
      					                   },
      					                   credits: {
      					                       enabled: false
      					                   },
      					                   loading: false
      					               };
      						        
      					       },
            					function(errResponse){
            						console.error('Error while fetching Currencies');
            					}
      			       );
          };  
          
//          self.configBookCntbyClassAlot = {
//                   options: {
//                       chart: {
//                           type: 'scatter'
//                       },
//                      yAxis: { 
//                         title: {
//                             text: 'Count',
//                         }
//                     }
//                   },
//                   series: [
//                            {
//                           	 name: 'Days',
//                           	 data: [23,343,11,34,55,61,500],
//                           	 color: 'red',
//                           	 lineWidth: 1,
//                           	 step: false
//                            }
//                            ],
//                   title: {
//                       text: ''
//                   },
//                   xAxis: {
//                       categories: [1,2,8,4,5,12,7],
//                      labels : { y : 20, rotation: -45 },
//                       title: {
//                             text: 'User',
//                         }
//                   },
//                   credits: {
//                       enabled: false
//                   },
//                   loading: false
//               };
  

      }]);
