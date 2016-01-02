App.directive('timelineDir', function() {
  return {
	scope : {
      configTimeline : '='

	},
    restrict : 'E',
    templateUrl: 'views/timelinePage.html',

    link: function(scope, elem, attrs) {
      scope.configTimeline =
    	{
    		  chart: {
    	            type: 'bar'
    	        },
    	      options: {
    	          chart: {
    	              type: 'scatter'
    	          },
    	         yAxis: { 
    	            title: {
    	                text: 'Progress',
    	            }
    	        }
    	      },
    	      series: [
    	               {
    	              	 name: 'Days',
    	              	 data: [23,343,11,34,55,61,500],
    	              	 color: 'red',
    	              	 lineWidth: 1,
    	              	 step: false
    	               }
    	               ],
    	      title: {
    	          text: ''
    	      },
    	      xAxis: {
    	          categories: ["apple"],
    	         //labels : { y : 20, rotation: -45 },
    	          title: {
    	                text: '',
    	            }
    	      },
    	      credits: {
    	          enabled: false
    	      },
    	      loading: false
    	  };
    }
  };
});