<!doctype html>
<html>
<head>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
    <script src="http://code.highcharts.com/stock/highstock.src.js"></script>
    <script src="http://code.highcharts.com/highcharts.src.js"></script>
    <script src="https://rawgithub.com/pablojim/highcharts-ng/master/src/highcharts-ng.js"></script>
    <script src="/static/js/app.js"></script>
</head>
<body>
<h2>Highcharts-ng example</h2>

<div ng-app="myapp">
    <div ng-controller="myctrl">
        <div class="row">
            <div class="span9">
                <div class="row">
                    <highchart id="chart1" config="chartConfig" class="span5" ></highchart>
                </div>
                <div class="row-fluid">
                    <label for="prettyJSON"><input id="prettyJSON" type="checkbox" ng-model="prettyJSON"> Pretty JSON</label>
                </div>
                <div class="row-fluid">
                    <pre ng-show="prettyJSON">
							{{ chartConfig | json }}
                    </pre>
                    <pre ng-show="!prettyJSON">
							{{ chartConfig }}
                    </pre>
                </div>
            </div>
            <div class="span4">
                <div class="row-fluid">Title <input ng-model="chartConfig.title.text"></div>
                <div class="row-fluid">Subtitle <input ng-model="chartConfig.subtitle.text"></div>
                <div class="row-fluid">Width <input ng-model="chartConfig.size.width"></div>
                <div class="row-fluid">Height <input ng-model="chartConfig.size.height"></div>
                <div class="row-fluid"><button ng-click="reflow()">reflow</button></div>
                <div class="row-fluid">Default Type <select ng-model="chartConfig.options.chart.type" ng-options="t.id as t.title for t in chartTypes"></select></div>
                <div class="row-fluid">Stack <select ng-model="chartConfig.options.plotOptions.series.stacking" ng-options="t.id as t.title for t in chartStack"></select></div>
                <div class="row-fluid"><label><input type="checkbox" ng-model="chartConfig.loading"> is loading</label></div>
                <div class="row-fluid"><label><input type="checkbox" ng-model="chartConfig.credits.enabled"> credits</label></div>
                <h4>Series</h4>
                <div class="row-fluid" ng-repeat="ser in chartSeries">
                    <div class="span12 well">
                        <div class="row-fluid">Title <input ng-model="ser.name"></div>
                        <div class="row-fluid">Type <select ng-model="ser.type" ng-options="t.id as t.title for t in chartTypes"></select></div>
                        <div class="row-fluid">Color <input ng-model="ser.color"></div>
                        <div class="row-fluid">Width <input ng-model="ser.lineWidth"></div>
                        <div class="row-fluid">Dash Style <select ng-model="ser.dashStyle" ng-options="ds.id as ds.title for ds in dashStyles"></select></div>
                        <div class="row-fluid"><label><input type="checkbox" ng-model="ser.connectNulls"> interpolate</label></div>
                        <div class="row-fluid"><button ng-click="removeSeries($index)">Delete</button></div>
                    </div>
                </div>
                <div class="row-fluid"><button ng-click="addSeries()">Add Series</button></div>
                <div class="row-fluid"><button ng-click="addPoints()">Add Points to Random Series</button></div>
                <div class="row-fluid"><button ng-click="removeRandomSeries()">Remove Random Series</button></div>
                <div class="row-fluid"><button ng-click="toggleHighCharts()">HighChart/HighStock</button></div>
                <div class="row-fluid"><button ng-click="replaceAllSeries()">Replace all series</button></div>
                <div class="row-fluid">Min: <input type="number" ng-model="chartConfig.xAxis.currentMin"></div>
                <div class="row-fluid">Max: <input type="number" ng-model="chartConfig.xAxis.currentMax"></div>
            </div>
        </div>
    </div>
</div>

</body>
</html>