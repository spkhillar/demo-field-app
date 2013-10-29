<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<head>


<script type="text/javascript">

	$().ready(function() {
		$("#openDieselReportBtn").button();
	});
	
	function openDieselReport(){
		console.log('opening file');
		window.open(webContextPath+'/jsp/dashboard/diesel/report');
	}
</script>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div style="height: 700px;">
	<button id="openDieselReportBtn" onclick="openDieselReport();"> Generate Report</button>
	</div>
	<br>
</body>
</html>
