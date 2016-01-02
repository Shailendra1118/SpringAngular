'use strict';

App.factory('UserService', ['$http', '$q', function($http, $q){

	return {
		
			fetchAllUsers: function() {
					return $http.get('http://localhost:8080/user/')
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching users');
										return $q.reject(errResponse);
									}
							);
			},
			
			fetchGraphData: function(advertiserId) {
				console.log("in fetch Graph data service method "+advertiserId);
				return $http.get('http://localhost:8080/graph/'+advertiserId)
						.then(
								function(response){
									return response.data;
								}, 
								function(errResponse){
									console.error('Error while fetching users');
									return $q.reject(errResponse);
								}
						);
		}   
	
		    
		
		
	};

}]);
