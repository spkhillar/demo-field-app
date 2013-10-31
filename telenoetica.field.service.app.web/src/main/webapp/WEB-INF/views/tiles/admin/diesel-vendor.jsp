<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type='text/javascript'>

$(function() {
	var actionUrl = webContextPath + "/admin/diselvendor/list";
	$("#grid").jqGrid(
			{
				url : actionUrl,
				datatype : 'json',
				mtype : 'GET',
				colNames : [ 'Id', 'Name'],
				colModel : [ {
					name : 'id',
					index : 'id',
					width : 55,
					hidden : true
				}, {
					name : 'name',
					index : 'name',
					width : 60
				}],
				postData : {},
				rowNum : 20,
				rowList : [ 20, 30, 40,50],
				height : 475,
				width : 900,
				rownumbers : true,
				pager : '#pager',
				sortname : 'name',
				viewrecords : true,
				sortorder : "asc",
				caption : "Site List",
				emptyrecords : "Empty records",
				loadonce : false,
				hidegrid : false,
				loadComplete : function() {
				},
				jsonReader : {
					root : "rows",
					page : "page",
					total : "total",
					records : "records",
					repeatitems : false,
					cell : "cell",
					id : "id"
				}
			});

	$("#grid").jqGrid('navGrid', '#pager', {
		edit : false,
		add : false,
		del : false,
		search : false,
		refreshtext : "Refresh",
		refreshtitle : "Refresh"
	}, {}, {}, {}, { //search
		sopt : [],
		closeOnEscape : true,
		multipleSearch : false,
		closeAfterSearch : false
	});
});
	
	
</script>
</head>
<body>

<div id="siteListDiv">
	<table id='grid'></table>
	<div id='pager'></div>
</div>
</body>
</html>