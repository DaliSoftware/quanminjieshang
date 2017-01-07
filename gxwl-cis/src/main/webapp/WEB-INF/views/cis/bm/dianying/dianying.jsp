<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>

<title>固定党日计划信息</title>
<link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome.min.css" type="text/css">
<!--[if IE 7]> 
	<link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome.min.css"> 
<![endif]-->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/libs/${jqueryEasyui}/themes/metro-blue/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/libs/${jqueryEasyui}/themes/icon.css">
<link rel="stylesheet" href="${ctx}/resources/css/gxwlui.css">
<link rel="stylesheet" href="${ctx}/resources/css/page.css">
</head>

<body>
<div class="g-layout">	
	<div class="g-toolbar">
	    <a id="add" onclick="baseInfo.add();" class="easyui-linkbutton toolbar g-button"><i class="fa fa-plus"></i>新增</a>
	    <a id="edit" onclick="baseInfo.edit();" class="easyui-linkbutton toolbar g-button"><i class="fa fa-edit"></i>编辑</a>
	    <a id="save" onclick="baseInfo.save();" class="easyui-linkbutton toolbar g-button"><i class="fa fa-floppy-o"></i>保存</a>
	    <a id="del" onclick="baseInfo.del();" class="easyui-linkbutton toolbar g-button"><i class="fa fa-trash-o"></i>删除</a>
	    <a id="download" onclick="openDownloadPage();" class="easyui-linkbutton toolbar g-button"><i class="fa fa-trash-o"></i>下载</a>
	    <a onclick="uploadBtn.fileupload('click'); return false;" title="上传头像" id="upfile" class="easyui-linkbutton toolbar g-button"><i class="fa fa-trash-o"></i>上传剧照</a>
	    <a id="delImage" onclick="baseInfo.delImage();" class="easyui-linkbutton toolbar g-button"><i class="fa fa-trash-o"></i>删除剧照</a>
	</div>
	
	<div id="mainTab" class="easyui-tabs g-container g-tabs1" data-options="fit:true,border:false">
	    <div title="列表" style="position:relative;">
		    <div class="query-area">
			    <form id="queryForm" method="post">
				    <table class="g-form" class="formCls" cellpadding="0" cellspacing="0">
						<tr>	
							<td class="form-cell-1">
	            				<label class="form-label">类型</label>
	            				<input id="q_type_EQ" name="q_type_EQ" class="easyui-combobox form-control"
				     						style="width:${comboboxWidth};height:${comboboxHeight}px">
	            			</td>
							<td class="form-cell-1">
	            				<label class="form-label">名称</label>
	            				<input class="easyui-validatebox form-control" name="q_name_LIKE"  />
	            			</td>
<!-- 		    				<td class="form-cell-1">
		    					<label class="form-label">编号</label>
		    					<input id="q_number_LIKE" name="q_number_LIKE"  class="easyui-validatebox form-control" />
		    				</td> -->
		    				<td class="form-cell-1">
		    					<label class="form-label">关键字</label>
		    					<input name="q_keyword_LIKE"  class="easyui-validatebox form-control" />
		    				</td>		    				
							<td class="form-cell-1 f-button">
								<a onclick="tableInfo.query();" class="easyui-linkbutton g-button"><i class="fa fa-search"></i>查询</a>
								<a onclick="clearQueryForm('#queryForm');" class="easyui-linkbutton g-button"><i class="fa fa-reply"></i>重置</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="list-area" style="top:50px;">
				<table id="listGrid" style="height:100%"></table>
			</div>
         
     	</div>
	     
	     <!-- data-options="disabled:true" -->
	     <div id="minute" data-options="disabled:true"  title="详细"   >
	   		<form id="baseForm"  action="">
			    <fieldset>
	    	    <legend>基础信息 </legend>
	    		<input id="id" name="id" type="hidden" />
				<input id="createrId" name="createrId" type="hidden" />
				<input id="createTime" name="createTime" type="hidden" />
				<input id="suipians" name="suipians" type="hidden" />
				<input id="images" name="images" type="hidden"/>
	    		<table class="g-form" cellpadding="0" cellspacing="0" >
	    			<tbody>
		     			<tr>
		     				<td class="form-cell-1">
			            		<label class="form-label">编号</label>
			            		<input id="number" name="number"  class="easyui-validatebox form-control" />
			          		</td>
		     				<td class="form-cell-1">
			            		<label class="form-label">名称</label>
			            		<input class="easyui-validatebox form-control" id="name" name="name"/>
			          		</td>		          		
		     				<td class="form-cell-1" colspan="1">
		     					<label class="form-label">类别</label>
		     					<input id="type" name="type" class="easyui-combobox form-control"
				     						style="width:${comboboxWidth};height:${comboboxHeight}px">	
		     				</td>
		     				<td class="form-cell-1">
			            		<label class="form-label">导演</label>
			            		<input class="easyui-validatebox form-control" id="daoyan" name="daoyan">
			          		</td>	
		     			</tr>
		     			
		     			
		     			<tr>
		     				<td class="form-cell-1" colspan="1">
		     					<label class="form-label">格式</label>
		     					<input class="easyui-validatebox form-control" id="geshi" name="geshi">
		     				</td>
		     				<td class="form-cell-1">
			            		<label class="form-label">分辨率</label>
			            		<input class="easyui-validatebox form-control" id="fenbianlv" name="fenbianlv">
			          		</td>	
		     				<td class="form-cell-1">
			            		<label class="form-label">下载次数</label>
			            		<input class="easyui-validatebox form-control" id="downloadCount" name="downloadCount" />
			          		</td>
		     				<td class="form-cell-1">
			            		<label class="form-label">评分</label>
			            		<input class="easyui-validatebox form-control" id="pingfen" name="pingfen"/>
			          		</td>			          		
		     			</tr>
		     			
		     			<tr>
		     				<td class="form-cell-4"  colspan="4">
		     					<label class="form-label">领衔主演</label>
		     					<input class="easyui-validatebox form-control" id="yanyuan" name="yanyuan"/>
		     				</td>
		     			</tr>
		     			
		     			
		     			<tr>
		     				<td class="form-cell-4"  colspan="4">
		     					<label class="form-label">摘要</label>
		     					<textarea rows="6" class="easyui-validatebox form-control"  name="zhaiyao"></textarea>
		     				</td>
		     			</tr>
		     			
						<tr>
		     				<td class="form-cell-1" colspan="1">
		     					<label class="form-label">处理方式</label>
		     					<input class="easyui-validatebox form-control" id="jiamiFanshi" name="jiamiFanshi">
		     				</td>
		     				<td class="form-cell-1">
			            		<label class="form-label">资源状态</label>
			            		<input class="easyui-validatebox form-control" id="status" name="status" >
			          		</td>
			          		<td class="form-cell-1">
			            		<label class="form-label">保存在</label>
			            		<input id="panfu" name="panfu" class="easyui-combobox form-control"
		     						style="width:${comboboxWidth};height:${comboboxHeight}px;">
			          		</td>			          		
		     			</tr>
		     			
	     			</tbody>
	     		</table>
     			</fieldset>
     		</form>
     		<div id="images_div" style="text-align: center;">
     			<h3>剧照</h3>
     		</div>
    		<div style="display: none;" id="addPhoto"></div>
     		
	     </div>
</div>

</div>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/fileupload.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/lookup.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/gxwl.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/public.js"></script>

<script type="text/javascript" >
var addNewRecord = false; //新增记录？
var editRecord = false;   //编辑记录？？
//当前登入的用户的id
var userId = <shiro:principal property="userId"/>;
var userName = "<shiro:principal/>";
var uploadBtn;
var count = 0;
var selectedRows = new Array();
var thisUiConfig = {
	main : window.parent.main,	
	ctx : "${ctx}",
	url : "dianying",
	id : "#id",    //表单中主键字段对应的控件的Id属性值
	tableList : "#listGrid",
	queryForm : "#queryForm",
	mainTab : "#mainTab",
	baseForm : "#baseForm",
	detailsTableId : "#dg_dangriMingxiList",
	getId : function (){
		return $(thisUiConfig.id).val();
	}
};

$(function (){
	tabs.init();
	tableInfo.init();
	baseInfo.init();
	initCombobox();
	importDoc.init();
	setFormItemDisabled(thisUiConfig.baseForm, true, null);
	document.onkeydown = hotkey; //当onkeydown 事件发生时调用hotkey函数  
});

var tabs = {
		thisTabIndex : 0,
		init : function (){
			$(thisUiConfig.mainTab).tabs("disableTab", 1);
			$(thisUiConfig.mainTab).tabs({
				//切换标签时调用
				onSelect : function(title, index) {
					tabs.thisTabIndex = index;
					if (index == 0) { // 选中列表标签
						setFormItemDisabled(thisUiConfig.baseForm, true, null);
						setFormItemDisabled(thisUiConfig.queryForm, false, null);
						$(thisUiConfig.baseForm).form("clear");
						
						if ($(thisUiConfig.tableList).datagrid("getSelections").length > 0) {
							$(thisUiConfig.mainTab).tabs("enableTab", 1);
						} else {
							$(thisUiConfig.mainTab).tabs("disableTab", 1);
						}
						$("#images_div").empty();
						
						$.ajax({
							type: "post",
							url: "${ctx}/resource/offsimi",
							data:{open: "colse"}
						});
						editRecord = false;
						addNewRecord = false;
						enableButtons();
					} else if (index == 1) { // 选中详细标签
				    	tabs.initDetailsTab();
					}
				}
			});
		},
		initDetailsTab : function(){
			$(thisUiConfig.detailsTableId).datagrid("acceptChanges");
			$(thisUiConfig.detailsTableId).datagrid("unselectAll");
			if (tableInfo.thisRow) {
				$(thisUiConfig.baseForm).form("load", tableInfo.thisRow);
				
				var panfu = tableInfo.thisRow.url.charAt(0);
				$("#panfu").combobox('select', panfu);
				
				
				var open = tableInfo.thisRow.jiamiFanshi == 0 ? "on" : "open";
				$.ajax({
					type: "post",
					url: "${ctx}/resource/offsimi",
					data:{open: open}
				}).done(function(){
					var images = $("#images").val().split(",");
					for(var i = 0; i < images.length; i ++){
						if(images[i]){
							var imgUrl = thisUiConfig.ctx + "/doc/show/"+ images[i];
							var image = "<div id='image_"+ images[i] +"' style='margin:10px 0;'>"
							   +"<input type='image' name='images' value='"+ images[i] +"' src='"+ imgUrl +"' ><br/>"
							   +"<input type='checkbox' name='check_image' value='"+ images[i] +"'/></div>";
							$("#images_div").append(image);	
						}
					}
					$(":checkbox").hide();
					enableButtons();
				});				
			}
			enableButtons();
		}
};


//基础信息初始化
var baseInfo =  {
	saveUrl : thisUiConfig.ctx +"/"+ thisUiConfig.url + "/save",
	getUrl : thisUiConfig.ctx +"/"+ thisUiConfig.url + "/edit",
	delUrl : thisUiConfig.ctx +"/"+ thisUiConfig.url + "/softDelList",
	downloadUrl : thisUiConfig.ctx +"/"+ thisUiConfig.url + "/download",
	searchUrl : thisUiConfig.ctx +"/"+ thisUiConfig.url + "/search",
	init : function (){
		$(thisUiConfig.mainTab).find("form").each(function (){
			$(this).form("enableValidation");
			$(this).form("clear");
			var id ="#" + $(this).attr("id");
			setFormItemDisabled(id,true,null);
		});
		setFormItemDisabled(thisUiConfig.queryForm, false, null);
	},
	
	//保存基础数据时调用此方法
	save : function (){
		if($(thisUiConfig.baseForm).form("validate")){
	        $(thisUiConfig.detailsTableId).datagrid("acceptChanges");
			$(thisUiConfig.detailsTableId).datagrid("unselectAll");
			$("#images").val("");
			var images = "";
			$("input[name='images']").each(function(){
				if($(this).val()){
					images = images + $(this).val() + ",";
				}
				
			});
			
			$("#images").val(images);
			
			var data = getFormData(thisUiConfig.baseForm);
 			$.messager.progress();
			$.ajax({
				type : "POST",
				url : baseInfo.saveUrl,
				data : data
			}).done(function(result) {
				$("#images_div").empty();
				$(thisUiConfig.baseForm).form("load",result.row);
				$.messager.progress("close");
				tableInfo.refresh();       //刷新列表
				$.messager.show({
					title : "温馨提示",
					msg : "操作成功",
					timeout : 2500,
					showType : "slide"
				});
				
			}).fail(function(jqXHR, textStatus, errorThrown) {
				$.messager.progress("close");
				alert(errorThrown+"           "+textStatus+"       "+jqXHR);
				$.messager.alert("温馨提示", "保存出错！", "error");
			}); 
		}
	},
	
	//点击新增基础数据时调用此方法
	add : function (){
		addNewRecord = true;
		editRecord = true;
		tableInfo.thisRow = "";
		tableInfo.thisRowIndex = -1;
		$(document).find("form").each(function (){
			$(this).form("enableValidation");
			$(this).form("clear");
		});
		$(thisUiConfig.detailsTableId).datagrid("loadData",{ total: 0, rows: [] });
		$(thisUiConfig.tableList).datagrid("unselectAll");
		if(tabs.thisTabIndex != 1){
			$(thisUiConfig.mainTab).tabs("enableTab", 1);
			$(thisUiConfig.mainTab).tabs("select", 1);	
		}else{
			tabs.initDetailsTab();
		}
		setFormItemDisabled(thisUiConfig.baseForm, false, "number,downloadCount");
		$.ajax({
			type:"post",
			url:"${ctx}/coderule/generateCode/PAFDN"
		}).done(function(number){
			$("#number").val(number);
		});
	},
	download: function (){
		if (! tableInfo.thisRow) {
			$.messager.alert("温馨提示", "请选择要下载的资源！", "info");
			return;
		}
		
		$.messager.confirm("温馨提示", "确定下载选中的资源?",
			function(r) {
				if (r) {
					var rows = $("#listGrid").datagrid("getSelections");
					var teshu = $("#teshu").val();
					if(! teshu){
						teshu = 0;
					}
					var ids = "";
					rows.forEach(function(value, key){
						ids = ids + value.id +",";
					});
					
					$.ajax({
							url : baseInfo.downloadUrl,
							data:{
								ids: ids,
								sd: "F",
								teshu: teshu
							},
							type: "POST"
					}).done(function(data) {
						$.messager.progress("close");
						if (data.resultCode == "0") {
							$(thisUiConfig.baseForm).form("clear");
							if(tabs.thisTabIndex == 1){
								$(thisUiConfig.mainTab).tabs("select", 0);
							}
							$(thisUiConfig.mainTab).tabs("disableTab", 1);	
							tableInfo.thisRow = "";
							tableInfo.thisRowIndex = -1;
							
							// 重新获取数据
							tableInfo.refresh();
							$.messager.show({
								title : "温馨提示",
								msg : "操作成功",
								timeout : 2500,
								showType : "slide"
							});
						} else {
							$.messager.show({
								title : "温馨提示",
								msg : data.resultMsg,
								timeout : 2500,
								showType : "slide"
							});
						}
						}).fail(function() {
							$.messager.progress("close");
							$.messager.alert("温馨提示", "复制出错！", "error");
						});
				 }
			});
	},
	del:function (){
		if (! tableInfo.thisRow) {
			$.messager.alert("温馨提示", "请选择删除的信息！", "info");
			return;
		}
		$.messager.confirm("温馨提示", "确定删除选中的资源?",
			function(r) {
				if (r) {
					$.ajax({
							url : baseInfo.delUrl,
							data:{
								ids: tableInfo.thisRow.id
							},
							type: "POST"
					}).done(function(data) {
						$.messager.progress("close");
						if (data.resultCode == "0") {
							$(thisUiConfig.baseForm).form("clear");
							if(tabs.thisTabIndex == 1){
								$(thisUiConfig.mainTab).tabs("select", 0);
							}
							$(thisUiConfig.mainTab).tabs("disableTab", 1);	
							tableInfo.thisRow = "";
							tableInfo.thisRowIndex = -1;
							
							// 重新获取数据
							tableInfo.refresh();
							$.messager.show({
								title : "温馨提示",
								msg : "操作成功",
								timeout : 2500,
								showType : "slide"
							});
						} else {
							$.messager.show({
								title : "温馨提示",
								msg : data.resultMsg,
								timeout : 2500,
								showType : "slide"
							});
						}
						}).fail(function() {
							$.messager.progress("close");
							$.messager.alert("温馨提示", "删除出错！", "error");
						});
				 }
			});
		
	},
	
	edit:function (){
		editRecord = true;
		if(tabs.thisTabIndex != 1){
			$(thisUiConfig.mainTab).tabs("enableTab", 1);
			$(thisUiConfig.mainTab).tabs("select", 1);
		}else{
			tabs.initDetailsTab();
		}
		setFormItemDisabled(thisUiConfig.baseForm, false, "number,downloadCount");
	},
	showImg : function (){
		var photofileID = $("#photofileID").val();
		var imgUrl = thisUiConfig.ctx + "/resources/images/base/1.png";
		if(photofileID && photofileID > 0){
			imgUrl = thisUiConfig.ctx + "/doc/show/"+ photofileID;
		}
		$("input[type='image']").attr("src", imgUrl);
	},
	
	delImage: function(){
		$(":checked").each(function(){
			$("#image_"+ $(this).val()).remove();
		});
	}
};

//列表加载
var tableInfo =  {
	thisRow : "",      //选中行的内容
	thisRowIndex : 0,  //选中行的下标	
	//初始化列表
	init : function (){
	
		$("#listGrid").datagrid({
			rownumbers : true,
			singleSelect : false,
			autoRowHeight : false,
			border : false,
			pageSize : defaultPageSize,
			pageList : defaultPageList,
			pagination : true,
			queryParams:  getFormData("#queryForm"),
			url : baseInfo.searchUrl,
			columns : [ [ {
				field : "id",
				hidden:true,
			}, {
				field : "number",
				title : "编号",
				width : 150,
				halign:'center',
				align:'left',
			},{
				field:"name",
				title:"电影名称",
				width:200,
				halign:'center',
				align:'left'
			},{
				 field:"type",
				 title:"类型",
				 width:150,
				 halign:'center',
				 align:'left'
			},{
				field:"yanyuan",
				title:"领衔主演",
				width:240,
				halign:'center',
				align:'left'
			},
			{
				field:"daoyan",
				title:"导演",
				width:120,
				halign:'center',
				align:'left'
			},{
				field:"geshi",
				title:"格式",
				width:120,
				halign:'center',
				align:'left'
			},{
				field:"fenbianlv",
				title:"分辨率",
				width:140,
				halign:'center',
				align:'left'
			}]],
			
			onSelect : function(rowIndex, rowData) {
				tableInfo.onSelectOrUnselect(rowIndex, rowData);
			},
			onUnselect : function(rowIndex, rowData) {
				tableInfo.onSelectOrUnselect(rowIndex, rowData);
			},
			onLoadSuccess : function(data) {
				$(thisUiConfig.tableList).datagrid("unselectAll");
				if(tableInfo.thisRow){
					$(thisUiConfig.tableList).datagrid("selectRow", tableInfo.thisRowIndex);
				}else{
					$(thisUiConfig.mainTab).tabs("disableTab", 1);
					enableButtons();
				}
				
				//新增记录时   选中第一行   将是否为新增记录标记设为false
				if(addNewRecord){
					addNewRecord = false;
					$(thisUiConfig.tableList).datagrid("selectRow", 0);
				}
			}
			
		});
		
		// 设置分页显示形式
		$(thisUiConfig.tableList).datagrid("getPager").pagination({
			layout : defaultPageLayout
		});
	},
	onSelectOrUnselect : function(rowIndex, rowData){
		var len = $(thisUiConfig.tableList).datagrid("getSelections").length;
		if(len == 1){
			tableInfo.thisRow = $(thisUiConfig.tableList).datagrid("getSelected");
			tableInfo.thisRowIndex = $(thisUiConfig.tableList).datagrid("getRowIndex", tableInfo.thisRow);
			
			if(tabs.thisTabIndex == 1){
				tabs.initDetailsTab();
			}else{
				$(thisUiConfig.mainTab).tabs("enableTab", 1);
			}
		}
		resetSelectedResource(rowData);
		enableButtons();
	},
	query : function (){
		tableInfo.thisRow = "";
		tableInfo.thisRowIndex = -1;
		var param = getFormData("#queryForm");
		$(thisUiConfig.tableList).datagrid("load", param);
	},
	refresh: function(){
		var param = getFormData("#queryForm");
		$(thisUiConfig.tableList).datagrid("load", param);
	}
};

function resetSelectedResource(rowData){
	var row = new Object();
	row.type = "dy";
	row.id = rowData.id;
	row.name = rowData.name;
	
	
	selectedRows = main.selectedResource;
	if(! selectedRows){
		selectedRows = new Array();
	}
	var newArray = new Array();
	var buzai = true;
	for(var i = 0; i < selectedRows.length; i ++){
		if(selectedRows[i].type == row.type && selectedRows[i].id == row.id){
			buzai = false;
		}else{
			newArray[newArray.length] = selectedRows[i];
		}
	}
	if(buzai){
		newArray[newArray.length] = row;
	}
	main.selectedResource = newArray;
}

function enableButtons(ids) {
	// 把所有按钮设置为不可用
	$(".easyui-linkbutton.toolbar").linkbutton("disable");
	$(".easyui-splitbutton.toolbar").linkbutton("disable");
	
	//新增记录时 
	if(addNewRecord){
		$("#save").linkbutton("enable");
	}else{
		
		//编辑记录时
		if(editRecord){
			$("#add, #save, #del, #upfile, #delImage").linkbutton("enable");
			$(":checkbox").show();
		}
		
		//其他时候  多数是选中表格中一行记录时
		else if(tableInfo.thisRow){
			$("#add, #edit, #del, #download").linkbutton("enable");
		}
		else{
			$("#add").linkbutton("enable");
		}
	}
	
}

//日期格式化  
function  formatterDate (date){
	return date.formatDate("yyyy-MM-dd hh:mm");
}

var dict = main.dict;
var dicts = dict.dicts;
var comboboxConfig = {
		valueField: 'dictCode',
	    textField: 'dictName',
	    editable: false,
		panelHeight: 'auto',
		disabled : true
	};
function initCombobox(){
	comboboxConfig.data = dicts.panfu.list;
	$('#panfu').combobox(comboboxConfig);
	comboboxConfig.data = dicts.tvType.list;
	$("#type").combobox(comboboxConfig);
	comboboxConfig.disabled = false;
	$("#q_type_EQ").combobox(comboboxConfig);
}

function createComboboxData(){
	var mothArray = new Array();
	var moth = (new Date().formatDate("yyyy")) - 1;
	for(var i = moth; i < moth + 5; i ++){
		var mothData = new Object();
		mothData.dictCode = i;
		mothData.dictName = i;
		mothArray[mothArray.length] = mothData;
	}
	return mothArray;
}

function hotkey(e){  
	var theEvent = window.event || e;
    var code = theEvent.keyCode || theEvent.which;
	if((code == 65) && (theEvent.ctrlKey)){  
		count ++;
		if(count == 4){
			$("#queryForm").append("<input id='teshu' name='teshu' value='1' type='hidden' />");
			$.ajax({url:"${ctx}/resource/offwgms", type: "post"});
		}else if(count == 5){
			count = 0;
			$("#teshu").remove();
		}
	}  
}

var importDoc = {
		
	init : function (){
			
 		uploadBtn = $("#addPhoto").fileupload({
			url : thisUiConfig.ctx + "/doc/upload",
			upfile : "upfile",
			filetype : "jpg|jpeg|png",
			hidden : true,
			params : {
				directory : "photos"
			},
			onUploadComplete : function(result) {
				if (result.errcode) {
					$.messager.alert("温馨提示", result.errmsg, "info");
					return ;
				}
				var imgUrl = thisUiConfig.ctx + "/doc/show/"+ result.docId;
				var image = "<div id='image_"+ result.docId +"' style='margin:10px 0;'>"
							   +"<input type='image' name='images' value='"+ result.docId +"' src='"+ imgUrl +"' ><br/>"
							   +"<input type='checkbox' name='check_image' value='"+ result.docId +"'/></div>";
				$("#images_div").append(image);
			}
		});
	}
		
};


function openDownloadPage(){
	main.dialog({
		title : "下载列表",
		url : "${ctx}/dianying/downloadpage",
		width : 720,
		height : 460,
		contentWindow: {
			params: {
				singleSelect: false,
				checkbox: true,
				teshu:$("#teshu").val()
			},
			actions : {
				confirm : function(data) {
					baseInfo.save(data);
				},
				cancel : function() {
					main.closeDialog();
				}
			},
		}
	});
}


</script>

</body>
</html>