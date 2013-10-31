<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<jsp:include page="dashboard-main.jsp"></jsp:include>
<head>

<script type="text/javascript">

$().ready(function(){
	
	var jsonurl = webContextPath + "/maintenance/rest/web/sparesUsedMvDashboard";
	var homePageData = populateDataForMvScreen(jsonurl);
	  var data = homePageData;
	 
	});
	
	
function populateDataForMvScreen(url) {
	var ret = null;
	$.ajax({
		// have to use synchronous here, else the function 
		// will return before the data is fetched
		async : false,
		url : url,
		success : function(data) {
			ret = data.listData;
			drawPieChart(ret);
		}
	});
	return ret;
}

function drawPieChart(data){
	
	 var plot1 = jQuery.jqplot ('pieChartForMvDashboard', [data], 	
			    { 
		 		  title : "Spares Used/Replaced(Last 30 days)",
			      seriesDefaults: {
			        // Make this a pie chart.
			        renderer: jQuery.jqplot.PieRenderer, 
			        rendererOptions: {
			          // Put data labels on the pie slices.
			          // By default, labels show the percentage of the slice.
			        	showDataLabels: true,
			            dataLabels: 'value'
			        }
			      }, 
			      legend: { show:true, location: 'e' }
			    }
			  );
	
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
	<div id="pieChartForMvDashboard" style="height:825px;width:850px;">
	</div>
</body>
</html>