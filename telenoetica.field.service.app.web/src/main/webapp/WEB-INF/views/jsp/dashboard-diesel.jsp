<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<head>
<spring:url value="/resources/css/jquery.jqplot.min.css" var="resourceJqplotCssUrl"/>

<spring:url value="/resources/js/jqplot.barRenderer.min.js" var="barRendererUrl"/>
<spring:url value="/resources/js/jqplot.categoryAxisRenderer.min.js" var="categoryAxisRendererUrl"/>

<spring:url value="/resources/js/jqplot.canvasTextRenderer.min.js" var="canvasTextRendererUrl"/>
<spring:url value="/resources/js/jqplot.canvasAxisTickRenderer.min.js" var="canvasAxisTickRendererUrl"/>
<spring:url value="/resources/js/jqplot.canvasOverlay.min.js" var="canvasOverlayUrl"/>
<spring:url value="/resources/js/jqplot.canvasAxisLabelRenderer.min.js" var="canvasAxisLabelRendererUrl"/>

<spring:url value="/resources/js/jqplot.pointLabels.min.js" var="pointLabelsUrl"/>
<spring:url value="/resources/js/jquery.jqplot.min.js" var="jqplotUrl"/>

<link href="${resourceJqplotCssUrl}" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${jqplotUrl}"></script>
<script type="text/javascript" src="${barRendererUrl}"></script>
<script type="text/javascript" src="${categoryAxisRendererUrl}"></script>
<script type="text/javascript" src="${pointLabelsUrl}"></script>

<script type="text/javascript" src="${canvasTextRendererUrl}"></script>
<script type="text/javascript" src="${canvasAxisTickRendererUrl}"></script>
<script type="text/javascript" src="${canvasOverlayUrl}"></script>
<script type="text/javascript" src="${canvasAxisLabelRendererUrl}"></script>


<script type="text/javascript">

	$().ready(function() {
		drawGraph();
	});
	function drawGraph(input) {
		 var s1 = [[1993, 3.5], [1992, 4.4], [1993, 6.0], [1994, 9.1], [1995, 12.0], [1996, 14.4],[1997, 3.5], [1998, 4.4], [1999, 6.0], [2000, 9.1], [2001, 12.0], [2002, 14.4],[2003, 3.5], [2004, 4.4], [2005, 6.0], [2006, 9.1], [2007, 12.0], [2008, 14.4],[2009, 3.5], [2010, 4.4], [2011, 6.0], [2012, 9.1], [2013, 12.0], [2014, 14.4]];
	     
		    var grid = {
		        gridLineWidth: 0.5,
		        gridLineColor: 'rgb(235,235,235)',
		        drawGridlines: true
		    };
		     
		    plot1 = $.jqplot('chart1', [s1], {
		        series:[{
		            renderer:$.jqplot.BarRenderer,
		            rendererOptions: {
		                barWidth: 10
		            }
		        }],
		        axes: {
		            xaxis: {
		                renderer: $.jqplot.CategoryAxisRenderer
		            }
		        },
		        grid: grid,
		        canvasOverlay: {
		            show: true,
		            objects: [
		                {horizontalLine: {
		                    name: 'pebbles',
		                    y: 10,
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
	<div style="height: 700px;">
	<div id="chart1" style="height:400px;width:auto; margin-left:10px;overflow: scroll;">
	</div>
	<br>
	</div>
</body>
</html>
