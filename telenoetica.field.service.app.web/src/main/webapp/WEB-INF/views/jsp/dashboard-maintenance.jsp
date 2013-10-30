<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<jsp:include page="dashboard-main.jsp"></jsp:include>
<head>

<script type="text/javascript">

$().ready(function(){
	
	var jsonurl = webContextPath + "/rest/web/dashboardData";
	var homePageData = populateDataForHomeScreen(jsonurl);
	  var data = homePageData;
	  var plot1 = jQuery.jqplot ('chart1', [data], 
	    { 
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
	});
	
function populateDataForHomeScreen(url) {
	var ret = null;
	$.ajax({
		// have to use synchronous here, else the function 
		// will return before the data is fetched
		async : false,
		url : url,
		success : function(data) {
			ret = data.listData;
		}
	});
	return ret;
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
	<div id="chart1" style="height:825px;width:850px;">
	</div>
</body>
</html>