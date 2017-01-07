<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>选择用户</title>
	
    <link rel="shortcut icon" href="${ctx}/resources/images/logo_16.ico">
	<link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome.min.css">
	<!--[if IE 7]>
	<link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome-ie7.min.css">
	<![endif]-->
	<link rel="stylesheet" href="${ctx}/resources/libs/${jqueryEasyui}/themes/metro-blue/easyui.css">
	<link rel="stylesheet" href="${ctx}/resources/libs/${jqueryEasyui}/themes/icon.css">
	<link rel="stylesheet" href="${ctx}/resources/css/gxwlui.css">
	<link rel="stylesheet" href="${ctx}/resources/css/page.css">
</head>

<body>
<div class="g-layout">
	<!-- 查询区域 -->
	<div style="width:100%;padding:10px 10px;">
		<form id="queryForm" method="post">
			<table cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td><label>用户账号</label></td>
						<td>
		            		<input id="q_userName_LIKE" name="q_userName_LIKE" class="easyui-validatebox form-control"
		            			style="width:150px;margin:0 5px;">
	          			</td>
	          			<td><label>实际名称</label></td>
	          			<td>
		            		<input id="q_realname_LIKE" name="q_realname_LIKE" class="easyui-validatebox form-control"
		            			style="width:150px;margin:0 5px;">
	          			</td>
	          			<td>
	          				<a class="easyui-linkbutton g-button" onclick="download();"><i class="fa fa-search"></i>查询</a>
	          				<a class="easyui-linkbutton g-button" onclick="clearQueryForm('#queryForm');"><i class="fa fa-reply"></i>重置</a>
	          			</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<!-- 列表区域 -->
	<div id="list">
		<form id="resourceForm" action="">
			<input id="teshu" name="teshu" type="hidden">
			<input id="panfu" name="panfu" type="hidden">
			<table id="dg_resources" class="easyui-datagrid" style="height:310px;"></table>
		</form>
	</div>
	<div id="toolbar" class="dialog-button">
		<span>下载到<input id="tempSD" name="tempSD" class="easyui-validatebox form-control"
		            			style="width:150px;margin:0 5px;"></span>
		<a id="confirm" class="easyui-linkbutton g-button" onclick="downloadResource();"><i class="fa fa-check"></i>下载</a>
		<a id="cancel" class="easyui-linkbutton g-button" onclick="window.actions.cancel();"><i class="fa fa-times"></i>关闭</a>
	</div>
</div>

<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/gxwl.js"></script>

<script type="text/javascript">
	$(function() {
		
		var col;
		
		if (window.params.checkbox) {
			col = [[
					{field: '', checkbox: true},
					{field: "id", hidden: true},
					{field: "name", title: "名称", width: 240},
					{field: "type", title: "资源类型", width:100, formatter:function(value, row, index){
						if(value == "dy"){
							return "电影";
						}
					}}
				
			]];
		} else {
			col = [[
				{field: "id", hidden: true},
				{field: "name", title: "名称", width: 240},
				{field: "type", title: "资源类型", width:100, formatter:function(value, row, index){
					if(value == "dy"){
						return "电影";
					}
				}}
			]];
		}
		
		$("#dg_resources").datagrid({
			rownumbers: true,
			singleSelect: window.params.singleSelect,
			autoRowHeight: false,
			border: false,
			pageSize: 10,
			pageList: defaultPageList,
			pagination: true,
			columns: col
		});
		
		$("#dg_resources").datagrid("getPager").pagination({
			layout : defaultPageLayout
		}); 
			
		for(var i = 0; i < main.selectedResource.length; i ++){
			$("#dg_resources").datagrid("insertRow", {index : 0, row: main.selectedResource[i]});
		}
		$("#dg_resources").datagrid("checkAll");
	});
	function downloadResource() {
		var teshu = window.params.teshu;
		if(! teshu){
			teshu = 0;
		}
		$("#teshu").val(teshu);
		$("#panfu").val($("#tempSD").val());
		var ddd = setInterval(function (){resetMsg();}, 5000);
 		$.ajax({
			type : "POST",
			url : "${ctx}/resource/downloadall",
			data : getFormData("#resourceForm","","true")
		}).done(function(result) {
			parent.$.messager.show({
				title : "温馨提示",
				msg : "操作成功",
				timeout : 2500,
				showType : "slide"
			});
			clearInterval(ddd);
		}).fail(function(jqXHR, textStatus, errorThrown) {
			alert(textStatus+"            "+errorThrown);
			$.messager.alert("温馨提示", "保存出错！", "error");
		}); 
	}
	
	function resetMsg(){
 		$.ajax({
			type : "POST",
			url : "${ctx}/resource/getdownloadstatus"
		}).done(function(result) {
			$("#tempSD").val(result.danqian);
			
		}); 
	}
	
</script>

</body>
</html>