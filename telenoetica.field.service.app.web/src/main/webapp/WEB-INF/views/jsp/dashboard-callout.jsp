<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<jsp:include page="dashboard-main.jsp"></jsp:include>
<head>
<script type="text/javascript">

$().ready(function(){
	
	var jsonurl = webContextPath + "/rest/web/customerImpacted";
	var homePageData = populateDataForCvScreen(jsonurl);
	  var data = homePageData;
		});
	
function populateDataForCvScreen(url) {
	var ret = null;
	$.ajax({
		// have to use synchronous here, else the function 
		// will return before the data is fetched
		async : false,
		url : url,
		success : function(data) {
			ret = data.listData;
			drawBarChartForCV(ret);
		}
	});
	return ret;
}

function drawBarChartForCV(data){
	 var plot1 = jQuery.jqplot ('barChartForCVDashboard',  [data], 
			    { 
				  title: 'Top Customers Impacted',
				    series:[{renderer:$.jqplot.BarRenderer}],
				    axesDefaults: {
				        tickRenderer: $.jqplot.CanvasAxisTickRenderer ,
				        tickOptions: {
				          angle: -30,
				          fontSize: '10pt'
				        }
				    },
				    axes: {
				      xaxis: {
				        renderer: $.jqplot.CategoryAxisRenderer
				      }
				    }
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
	<div id="barChartForCVDashboard" style="height:825px;width:850px;">
	</div>
</body>
</html>