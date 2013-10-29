<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<head>
<spring:url value="/resources/css/jquery.jqplot.min.css" var="resourceJqplotCssUrl"/>
<spring:url value="/resources/js/jquery-1.9.1.min.js" var="resourceJq1Url"/>
<spring:url value="/resources/js/jqplot.barRenderer.min.js" var="barRendererUrl"/>
<spring:url value="/resources/js/jqplot.categoryAxisRenderer.min.js" var="categoryAxisRendererUrl"/>

<spring:url value="/resources/js/jqplot.canvasTextRenderer.min.js" var="canvasTextRendererUrl"/>
<spring:url value="/resources/js/jqplot.canvasAxisTickRenderer.min.js" var="canvasAxisTickRendererUrl"/>
<spring:url value="/resources/js/jqplot.canvasOverlay.min.js" var="canvasOverlayUrl"/>
<spring:url value="/resources/js/jqplot.canvasAxisLabelRenderer.min.js" var="canvasAxisLabelRendererUrl"/>

<spring:url value="/resources/js/jqplot.pointLabels.min.js" var="pointLabelsUrl"/>
<spring:url value="/resources/js/jquery.jqplot.min.js" var="jqplotUrl"/>

<link href="${resourceJqplotCssUrl}" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${resourceJq1Url}"></script>
<script type="text/javascript" src="${jqplotUrl}"></script>
<script type="text/javascript" src="${barRendererUrl}"></script>
<script type="text/javascript" src="${categoryAxisRendererUrl}"></script>
<script type="text/javascript" src="${pointLabelsUrl}"></script>

<script type="text/javascript" src="${canvasTextRendererUrl}"></script>
<script type="text/javascript" src="${canvasAxisTickRendererUrl}"></script>
<script type="text/javascript" src="${canvasOverlayUrl}"></script>
<script type="text/javascript" src="${canvasAxisLabelRendererUrl}"></script>

<script type="text/javascript">

var webContextPathDiesel = "${pageContext.request.contextPath}";;
	$().ready(function() {
		dieselMedianData();
	});
	
	function dieselMedianData(){
		$.ajax({
			type : "get",
			url : webContextPathDiesel + "/diesel/median",
			async : false,
			success : function(data, textStatus) {
				if(data != null && data.medianValue != null && data.listData != null){
					if(data.listData.length >50){
						$("#dieselMedianChart").css("width", "+=2300");
					}
					drawGraph(data.medianValue,data.listData);
				}
				console.log('....data....', data);
			},
			error : function(textStatus, errorThrown) {
				alert(textStatus + "" + errorThrown);
			}
		});
	}
	function drawGraph(median,listData) {
		 var s1 = [[1949, 3.5], [1950, 4.4],[1951, 3.5], [1952, 4.4],[1953, 3.5], [1954, 4.4],[1955, 3.5], [1956, 4.4],[1957, 3.5], [1958, 4.4], [1959, 6.0],[1960, 3.5], [1961, 4.4],[1962, 3.5], [1963, 4.4],[1964, 3.5], [1965, 4.4],[1966, 3.5], [1967, 4.4],[1968, 3.5], [1969, 4.4], [1970, 6.0], [1971, 9.1],[1972, 3.5], [1973, 4.4], [1974, 6.0], [1975, 9.1],[1976, 3.5], [1977, 4.4], [1978, 6.0], [1979, 9.1], [1980, 12.0], [1981, 14.4],[1982, 3.5],[1983, 3.5], [1984, 4.4], [1985, 6.0], [1986, 9.1], [1987, 12.0], [1988, 14.4],[1989, 3.5], [1990, 4.4],[1991, 3.5], [1992, 4.4], [1993, 6.0], [1994, 9.1], [1995, 12.0], [1996, 14.4],[1997, 3.5], [1998, 4.4], [1999, 6.0], [2000, 9.1], [2001, 12.0], [2002, 14.4],[2003, 3.5], [2004, 4.4], [2005, 6.0], [2006, 9.1], [2007, 12.0], [2008, 14.4],[2009, 3.5], [2010, 4.4], [2011, 6.0], [2012, 9.1], [2013, 12.0], [2014, 14.4]];
	     
		    var grid = {
		        gridLineWidth: 0.5,
		        gridLineColor: 'rgb(235,235,235)',
		        drawGridlines: false
		    };	
		     
		    plot1 = $.jqplot('dieselMedianChart', [listData], {
		        series:[{
		            renderer:$.jqplot.BarRenderer,
		            rendererOptions: {
		                barWidth: 10
		            },
		            pointLabels: { 
		            	show: true 
		            }
		        }],
		        axes: {
		            xaxis: {
		                renderer: $.jqplot.CategoryAxisRenderer,
		                autoscale : true
		            }
		        },
		        grid: grid,
		        canvasOverlay: {
		            show: true,
		            objects: [
		                {horizontalLine: {
		                    name: 'pebbles',
		                    y: median,
		                    lineWidth: 3,
		                    xOffset: 0,
		                    color: 'rgb(89, 198, 154)',
		                    shadow: false
		                }}
		            ]
		        }
		    });

	}
</script>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div style="height: 700px; width: auto">
	<div id="dieselMedianChart" style="height:500px;width:700px; margin-left:10px;">
	</div>
	<br>
	</div>
</body>
</html>
