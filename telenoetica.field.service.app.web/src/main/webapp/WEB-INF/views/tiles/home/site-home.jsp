<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
  $(function() {
    $( "#tabs" ).tabs({
      collapsible: true
    });
  });
  </script>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="tabs">
  <ul>
    <li><a href="${contextPath}/jsp/dashboard/home">Home</a></li>
    <li><a href="${contextPath}/jsp/dashboard/diesel" target="_blank">Diesel Visit</a></li>
    <li><a href="${contextPath}/jsp/dashboard/maintenance">Maintenance Visit</a></li>
    <li><a href="${contextPath}/jsp/dashboard/callOut">Call-Out Visit</a></li>
  </ul>
 </div>
 
</body>
</html>