<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>YuMeRest</title>  
    <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }

      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }

    </style>
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>  <!-- put it first -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <link rel="stylesheet" href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css" /

  </head>
  <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container" ng-controller="UserController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Insertion Orders</span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.user.id" /> 
                      <div class="row">
                          <div class="form-group col-md-8">                             
                              <div class="col-md-5">
                                  <input type="text" ng-model="ctrl.user.address" class="form-control input-sm" placeholder="Search your insertion order"/>
                              </div>
                          </div>
                      </div>   
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.user.id ? '+ INSERTION ORDER' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
<!--                               <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button> -->
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Orders</span></div>
                <div ng-repeat="company in ctrl.companies">        
               	  <div>
	                <label for="prettyJSON" ng-click = 'fetchGraphData()'><input id="prettyJSON" type="checkbox" ng-model="prettyJSON" ng-click="ctrl.fetchGraphData(company)"> {{company.username}}</label>
	                Timeline data
<!-- 	                <timeline-dir style="height: 100px">	                	 -->
<!-- 	                </timeline-dir> -->
	              </div>	                
                  <div class="panel-collapse" collapse="collaspe2">
					 <div class="panel-body">
						 <highchart id="chart1" config="ctrl.configBookCntbyClassAlot[company.id]" ng-show="prettyJSON"
							class="col-md-5"></highchart>							
<!-- 						 <label class="col-md-2 control-lable" ng-show="prettyJSON" for="file">Attributes</label> -->
						 <div>
						 <button ng-show="prettyJSON" type="button" style="float:right;" ng-click="ctrl.reset()" class="btn btn-warning btn-sm">EXIT</button>
						 	<button ng-disabled="" ng-show="prettyJSON" type="button" style="float:right;" ng-click="ctrl.reset()" class="btn btn-warning btn-sm">EXPLORE</button>
						 </div>
						 <div class="form-group">
<!-- 							 <div class="form-group"> -->
							 <div class="col-sm-5">
								 <h4 ng-show="prettyJSON" style="color: #438EA9; font-weight: normal;">
										<i class="fa fa-envelope-o"></i> {{company.username}}
										 <label ng-show="prettyJSON" style="color: #438AA9; font-weight: lighter;">
											<i class="fa fa-envelope-o"></i> Advertiser<legend></legend>								
								 		</label>								
								 </h4>
							 </div>	
							 <div class="col-sm-5">
								 <h4 ng-show="prettyJSON" style="color: #438EA9; font-weight: normal;">
										<i class="fa fa-envelope-o"></i> {{company.email}}
										 <label ng-show="prettyJSON" style="color: #438AA9; font-weight: lighter;">
											<i class="fa fa-envelope-o"></i> Impressions<legend></legend>								
								 		</label>								
								 </h4>
							 </div>								  					
						 </div>
					 </div>					
				  </div>
			    </div>
				
				
				
				
<!--                 <div class="row-fluid"> -->
<!--                     <label for="prettyJSON"><input id="prettyJSON" type="checkbox" ng-model="prettyJSON"> Pretty JSON</label> -->
<!--                 </div> -->
<!--                 <div class="row-fluid"> -->
<!--                     <pre ng-show="prettyJSON"> -->
<!-- 							{{ chartConfig | json }} -->
<!--                     </pre> -->
<!--                     <pre ng-show="!prettyJSON"> -->
<!-- 							{{ chartConfig }} -->
<!--                     </pre> -->
<!--                 </div> -->
              </div>
          </div>
      </div>
      
    <script src="<c:url value='/static/bower_components/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/static/bower_components/angular/angular.min.js' />"></script>
	<script src="<c:url value='/static/bower_components/bootstrap/dist/js/bootstrap.min.js'/>"></script>
	<script	src="<c:url value='/static/bower_components/angular-ui-router/release/angular-ui-router.min.js'/>"></script>
	<script src="<c:url value='/static/vendor/highcharts/js/highcharts.min.js' />"></script>
	<script src="<c:url value='/static/bower_components/highcharts-ng/dist/highcharts-ng.min.js' />"></script>
	<script src="<c:url value='/static/bower_components/angular-animate/angular-animate.min.js' />"></script>
	<script src="<c:url value='/static/bower_components/angular-strap/dist/angular-strap.min.js' />"></script>
	<script	src="<c:url value='/static/bower_components/angular-strap/dist/angular-strap.tpl.min.js' />"></script>

	
<!--       <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script> -->
<!--       <script src="http://code.highcharts.com/stock/highstock.src.js"></script> -->
<!-- 	  <script src="http://code.highcharts.com/highcharts.src.js"></script> -->
<!-- 	  <script src="https://rawgithub.com/pablojim/highcharts-ng/master/src/highcharts-ng.js"></script> -->
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/user_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
  </body>
</html>