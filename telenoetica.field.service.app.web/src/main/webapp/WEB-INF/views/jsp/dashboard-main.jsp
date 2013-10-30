<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<head>

<spring:url value="/resources/css/screen.css" var="resourceCmxUrl"/>
<spring:url value="/resources/css/redmond/jquery-ui-1.10.3.custom.min.css" var="resourceJqUiCssUrl"/>
<spring:url value="/resources/css/jquery.jqplot.min.css" var="resourceJqplotCssUrl"/>
<spring:url value="/resources/js/jquery-1.9.1.min.js" var="resourceJq1Url"/>
<spring:url value="/resources/js/jquery.validate.min.js" var="resourceJqvUrl"/>
<spring:url value="/resources/js/application.js" var="resourceAppJsUrl"/>
<spring:url value="/resources/js/jquery-ui-1.10.3.custom.min.js" var="resourceJqUiUrl"/>
<spring:url value="/resources/js/jqplot.barRenderer.min.js" var="barRendererUrl"/>
<spring:url value="/resources/js/jqplot.categoryAxisRenderer.min.js" var="categoryAxisRendererUrl"/>
<spring:url value="/resources/js/jqplot.canvasTextRenderer.min.js" var="canvasTextRendererUrl"/>
<spring:url value="/resources/js/jqplot.canvasAxisTickRenderer.min.js" var="canvasAxisTickRendererUrl"/>
<spring:url value="/resources/js/jqplot.canvasOverlay.min.js" var="canvasOverlayUrl"/>
<spring:url value="/resources/js/jqplot.canvasAxisLabelRenderer.min.js" var="canvasAxisLabelRendererUrl"/>
<spring:url value="/resources/js/jqplot.pointLabels.min.js" var="pointLabelsUrl"/>
<spring:url value="/resources/js/jquery.jqplot.min.js" var="jqplotUrl"/>
<spring:url value="/resources/js/jqplot.pieRenderer.min.js" var="jqplotPieRendererUrl"/>


<link href="${resourceJqplotCssUrl}" rel="stylesheet" type="text/css" />
<link href="${resourceCmxUrl}" rel="stylesheet" type="text/css" />
<link href="${resourceJqUiCssUrl}" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${resourceJq1Url}"></script>
<script type="text/javascript" src="${resourceJqvUrl}"></script>
<script type="text/javascript" src="${resourceJqUiUrl}"></script>
<script type="text/javascript" src="${jqplotUrl}"></script>
<script type="text/javascript" src="${barRendererUrl}"></script>
<script type="text/javascript" src="${categoryAxisRendererUrl}"></script>
<script type="text/javascript" src="${pointLabelsUrl}"></script>

<script type="text/javascript" src="${canvasTextRendererUrl}"></script>
<script type="text/javascript" src="${canvasAxisTickRendererUrl}"></script>
<script type="text/javascript" src="${canvasOverlayUrl}"></script>
<script type="text/javascript" src="${canvasAxisLabelRendererUrl}"></script>
<script type="text/javascript" src="${jqplotPieRendererUrl}"></script>

</head>
<body>
</body>
</html>
