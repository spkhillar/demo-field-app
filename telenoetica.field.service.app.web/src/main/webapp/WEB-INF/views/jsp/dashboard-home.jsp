<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<head>
<script type="text/javascript">

	$().ready(function() {

		var jsonurl = webContextPath + "/rest/webHomeData";
		var homePageData = populateDataForHomeScreen(jsonurl);
		populateRoutineTableData(homePageData.routineVisits);
		populateCalloutTableData(homePageData.callOutVisits);
		populateDieselTableData(homePageData.dieselVisits);
		populateMaintenanceTableData(homePageData.maintenanceVisits);
		drawGraph(homePageData.chartData);
		drawGraphForDieselRecieved();
	});

	function populateDataForHomeScreen(url) {
		var ret = null;
		$.ajax({
			// have to use synchronous here, else the function 
			// will return before the data is fetched
			async : false,
			url : url,
			success : function(data) {
				ret = data;
			}
		});
		return ret;
	}
	
	function drawGraphForDieselRecieved() {
		var url = webContextPath + "/diesel/last7DaysReceived";
		$.ajax({
			// have to use synchronous here, else the function 
			// will return before the data is fetched
			async : true,
			url : url,
			success : function(data) {
				drawGraphForLast7DaysDieselReceivedBySites(data.listData);
			}
		});
	}

	function populateRoutineTableData(input) {
		$.each(input, function(i, row) {
			$('[name="routineTable"]').append(
					"<tr><td>" + row.siteId + "</td><td>" + row.createdAt
							+ "</td></tr>");
		});
	}
	function populateCalloutTableData(input) {
		$.each(input, function(i, row) {
			$('[name="calloutTable"]').append(
					"<tr><td>" + row.siteId + "</td><td>" + row.createdAt
							+ "</td></tr>");
		});
	}
	function populateDieselTableData(input) {
		$.each(input, function(i, row) {
			$('[name="dieselTable"]').append(
					"<tr><td>" + row.siteId + "</td><td>" + row.createdAt
							+ "</td></tr>");
		});
	}

	function populateMaintenanceTableData(input) {

		$.each(input, function(i, row) {
			$('[name="maintenanceTable"]').append(
					"<tr><td>" + row.siteId + "</td><td>" + row.createdAt
							+ "</td></tr>");
		});

	}
	function drawGraph(input) {
		$.jqplot.config.enablePlugins = true;
		var ticks = [ 'Routine Visit', 'Call-Out Visit', 'Diesel Visit',
				'Maintenance Visit' ];
		 var grid = {
			        gridLineWidth: 0.5,
			        gridLineColor: 'rgb(235,235,235)',
			        drawGridlines: false
			    };	
		 
		 plot1 = $.jqplot('chartLast7DaysDiv', [ input ], {
				// Only animate if we're not using excanvas (not in IE 7 or IE 8)..
				 animate: true,
      		  // Will animate plot on calls to plot1.replot({resetAxes:true})
        		animateReplot: true,
				title : "Visit Analysis Chart(Last 7 Days)",
				 series:[{
			            renderer:$.jqplot.BarRenderer,
			            rendererOptions: {
			                barWidth: 30
			            },
			            pointLabels: { 
			            	show: true 
			            }
			        }],
			        axesDefaults: {
			            tickRenderer: $.jqplot.CanvasAxisTickRenderer ,
			            tickOptions: {
			              angle: -30,
			              fontSize: '10pt'
			            }
			        },
			        axes: {
			            xaxis: {
			                renderer: $.jqplot.CategoryAxisRenderer,
			                autoscale : true,
							ticks : ticks
			            }
			        },
			        grid: grid
			    });
	}
	function drawGraphForLast7DaysDieselReceivedBySites(input){
		
		if(input == null){
			input = [[0,0]];
		}
		 var grid = {
			        gridLineWidth: 0.5,
			        gridLineColor: 'rgb(235,235,235)',
			        drawGridlines: false
			    };	
		 
		 plot1 = $.jqplot('chartLast7DaysDieselDiv', [ input ], {
				// Only animate if we're not using excanvas (not in IE 7 or IE 8)..
				 animate: true,
      		  // Will animate plot on calls to plot1.replot({resetAxes:true})
        		animateReplot: true,
				title : "Disel Received (Last 7 Days)",
				 series:[{
			            renderer:$.jqplot.BarRenderer,
			            rendererOptions: {
			                barWidth: 30
			            },
			            pointLabels: { 
			            	show: true 
			            }
			        }],
			        axesDefaults: {
			            tickRenderer: $.jqplot.CanvasAxisTickRenderer ,
			            tickOptions: {
			              angle: -30,
			              fontSize: '10pt'
			            }
			        },
			        axes: {
			            xaxis: {
			                renderer: $.jqplot.CategoryAxisRenderer,
			                autoscale : true,
			            }
			        },
			        grid: grid
			    });
		
	}
</script>
<style type="text/css">
div.container {
	border: 0px solid #000000;
	overflow: hidden;
	width: 100%;
}

div.left {
	width: 400px;
	float: left;
}

div.right {
	width: 410px;
	float: right;
}
</style>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div style="height: auto;" id ="dashBoardHomeDiv">
	<div class="container" style="overflow: hidden; width: 100%">	
		<div class="left">	
			<div id="chartLast7DaysDiv" style="height:300px;">
			</div>
		</div>	
		<div class="right">	
			<div id="chartLast7DaysDieselDiv" style="height:300px;">
			</div>
		</div>
	</div>
	<br>
	<div class="container" style="overflow: hidden; width: 100%">	
		<div class="left">	
			<h5>Routine Visit</h5>
			<table id="newspaper-b" name="routineTable">
				<thead>
					<tr>
						<th scope="col">Site</th>
						<th scope="col">Visit Time</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<a href="${contextPath}/routine/list" style="float:right; font-weight: bold">View All</a>
		</div>
		<div class="right">
		<h5>Diesel Visit</h5>
			<table id="newspaper-b" name="dieselTable">
				<thead>
					<tr>
						<th scope="col">Site</th>
						<th scope="col">Visit Time</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
			<a href="${contextPath}/diesel/list" style="float:right; font-weight: bold">View All</a>
		</div>
		</div>
		<div class="container" style="overflow: hidden; width: 100%">
		<div class="left">		
			<h5>Call-Out Visit</h5>
			<table id="newspaper-b" name="calloutTable">
				<thead>
					<tr>
						<th scope="col">Site</th>
						<th scope="col">Visit Time</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<a href="${contextPath}/callout/list" style="float:right; font-weight: bold">View All</a>
		</div>
		<div class="right">	
			<h5>Maintenance Visit</h5>
			<table id="newspaper-b" name="maintenanceTable" style="float: right">
				<thead>
					<tr>
						<th scope="col">Site</th>
						<th scope="col">Visit Time</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<a href="${contextPath}/maintenance/list" style="float:right; font-weight: bold">View All</a>
		</div>
		</div>
	</div>
</body>
</html>
