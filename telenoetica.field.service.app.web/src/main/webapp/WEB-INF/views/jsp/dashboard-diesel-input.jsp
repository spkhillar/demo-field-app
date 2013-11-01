<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<html>
<jsp:include page="dashboard-main.jsp"></jsp:include>
<head>
<script type="text/javascript">
	$().ready(function() {
		$("#openDieselReportBtn").button();
		$("#startDate").datepicker({
			dateFormat : "dd-mm-yy"
		});
		$("#endDate").datepicker({
			dateFormat : "dd-mm-yy"
		});
		dieselTopConsumerData();
	});
	
	function dieselTopConsumerData(){
		$.ajax({
			type : "get",
			url : webContextPath + "/diesel/top10",
			async : false,
			success : function(data, textStatus) {
				drawGraph(data.listData);
				console.log('....data....', data);
			},
			error : function(textStatus, errorThrown) {
				alert(textStatus + "" + errorThrown);
			}
		});
	}
	
	function openDieselReport(){
		console.log('opening file');
		var filterField = $("#searchFieldName").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		if($.trim(startDate) == 0){
			startDate = "null";
		}
		if($.trim(endDate) == 0){
			endDate = "null";
		}
		//console.log('filterField=',filterField+'.startDate=',startDate,'.endDate=',endDate);
		var url = webContextPath+'/jsp/dashboard/diesel/report/'+filterField+'/'+startDate+'/'+endDate;
		console.log('..url.',url);
		window.open(url);
	}
	function drawGraph(listData) {
		if(listData == null || listData == undefined){
			listData = [[0,0]];
		}
		    var grid = {
		        gridLineWidth: 0.5,
		        gridLineColor: 'rgb(235,235,235)',
		        drawGridlines: false
		    };	
		     
		    plot1 = $.jqplot('dieselTopConsumers', [listData], { 
		    	animate: true,
		        // Will animate plot on calls to plot1.replot({resetAxes:true})
		        animateReplot: true,
		    	title : "Top 10 Diesel Consumers(Last 30 Days)",
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
		                autoscale : true
		            }
		        },
		        grid: grid
		    });

	}
</script>
<style type="text/css">

#reportCriteriaSearchForm { width: 850px; }
#reportCriteriaSearchForm label.error {
	margin-left: 10px;
	width: auto;
	display: inline;
}

</style>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div id="dieselTopConsumers" style="height:200px;width:600px; margin-left:130px;">
	
</div>
	<form:form id="reportCriteriaSearchForm" name="reportCriteriaSearchForm" modelAttribute="reportCriteriaSearchForm" cssClass="cmxform">
		<fieldset>
			<p>
				<label>Filter Field</label> 
				<form:select path="searchFieldName" items="${dieselVisitSelectionFields}" ></form:select>
			</p>
			<p>
				<label>Start Date </label> 
				<form:input path="startDate"/>
			</p>
			<p>
				<label>End Date </label> 
				<form:input path="endDate"/>
			</p>
		</fieldset>
	</form:form>
	<button id="openDieselReportBtn" onclick="openDieselReport();"> Generate Report</button>
</body>
</html>
