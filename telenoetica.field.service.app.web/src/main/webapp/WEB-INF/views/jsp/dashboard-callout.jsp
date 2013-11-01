<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<jsp:include page="dashboard-main.jsp"></jsp:include>
<head>
<script type="text/javascript">

$().ready(function(){
	
	var jsonurl = webContextPath + "/callout/customerImpacted";
	populateDataForCvScreen(jsonurl);
		});
	
function populateDataForCvScreen(url) {
	var ret = null;
	$.ajax({
		// have to use synchronous here, else the function 
		// will return before the data is fetched
		async : true,
		url : url,
		success : function(data) {
			ret = data.listData;
			drawBarChartForCV(ret);
		}
	});
	return ret;
}

function drawBarChartForCV(data){
	 var grid = {
		        gridLineWidth: 0.5,
		        gridLineColor: 'rgb(235,235,235)',
		        drawGridlines: false
		    };	
	 
	  $.jqplot('barChartForCVDashboard', [ data ], {
			// Only animate if we're not using excanvas (not in IE 7 or IE 8)..
			title : "Customer Impacted(Last 30 days)", 
			animate: true,
	        // Will animate plot on calls to plot1.replot({resetAxes:true})
	        animateReplot: true,
			 series:[{
		            renderer:$.jqplot.BarRenderer,
		            rendererOptions: {
		                barWidth: 10
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
<div style="height: 525px; width: 875px; overflow: scroll;"> 
	<div id="barChartForCVDashboard" style="height:500px;width:1450px;"> </div>
	</div>
</body>
</html>