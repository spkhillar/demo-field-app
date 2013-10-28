<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<head>
<spring:url value="/resources/css/jquery.jqplot.min.css" var="resourceJqplotCssUrl"/>

<spring:url value="/resources/js/jqplot.barRenderer.min.js" var="barRendererUrl"/>
<spring:url value="/resources/js/jqplot.categoryAxisRenderer.min.js" var="categoryAxisRendererUrl"/>
<spring:url value="/resources/js/jqplot.pointLabels.min.js" var="pointLabelsUrl"/>
<spring:url value="/resources/js/jquery.jqplot.min.js" var="jqplotUrl"/>
<spring:url value="/resources/js/jqplot.pieRenderer.min.js" var="jqplotUrl"/>

<link href="${resourceJqplotCssUrl}" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${jqplotUrl}"></script>
<script type="text/javascript" src="${barRendererUrl}"></script>
<script type="text/javascript" src="${categoryAxisRendererUrl}"></script>
<script type="text/javascript" src="${pointLabelsUrl}"></script>

<script type="text/javascript">

$().ready(function(){
	
	var jsonurl = webContextPath + "/rest/web/dashboardData";
	var homePageData = populateDataForHomeScreen(jsonurl);
	  var data = [
	    ['Heavy Industry', 12],['Retail', 9], ['Light Industry', 14], 
	    ['Out of home', 16],['Commuting', 7], ['Orientation', 9]
	  ];
	  var plot1 = jQuery.jqplot ('chart1', [data], 
	    { 
	      seriesDefaults: {
	        // Make this a pie chart.
	        renderer: jQuery.jqplot.PieRenderer, 
	        rendererOptions: {
	          // Put data labels on the pie slices.
	          // By default, labels show the percentage of the slice.
	          showDataLabels: true
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
			ret = data;
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
	<div style="height: 700px;">
	<div id="chart1" style="height:200px;width:600px; margin-left:130px;">
	
	</div>
<h1>Page Under Construction. Page will be available shortly.</h1>
</body>
</html>