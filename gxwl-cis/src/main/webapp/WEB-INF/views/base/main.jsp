<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>${system_name}</title>
	
    <link rel="shortcut icon" href="${ctx}/resources/images/logo_16.ico">
	<link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome.min.css">
	<!--[if IE 7]>
	<link rel="stylesheet" href="${ctx}/resources/libs/${fontAwesome}/css/font-awesome-ie7.min.css">
	<![endif]-->
	<link rel="stylesheet" href="${ctx}/resources/libs/${jqueryEasyui}/themes/metro-blue/easyui.css">
	<link rel="stylesheet" href="${ctx}/resources/libs/${jqueryEasyui}/themes/icon.css">
	<link rel="stylesheet" href="${ctx}/resources/css/gxwlui.css">
	<link rel="stylesheet" href="${ctx}/resources/css/main.css">
	<style type="text/css">
		#mainTabs .tabs-header{border:none;padding:0}
	</style>
</head>
<body>
<div class="c">
	<div class="top">
		<div class="title">
			<img src="${ctx}/resources/images/logo_48.png">
			<div>
				青海省民和县川口镇海鸿<br>智慧社区的管理平台系统
			</div>
		</div>
		<div class="info">
			<img src="${ctx}/resources/images/base/na-imgbg.png">
			<div>
				<p class="p1">
					<a href="#"><span></span>&nbsp;<i class="fa fa-angle-double-down"></i></a>
					<input id="meshId" type="hidden">
					<input id="meshName" type="hidden">
				</p>
				<p class="p2"><shiro:principal/>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${ctx}/logout">安全退出</a></p>
			</div>
		</div>
		<div class="divider"></div>
		<div class="menus"><ul></ul></div>
	</div>
	<div class="middle">
		<div id="mainTabs" class="easyui-tabs g-tabs1" style="width:100%; height:100%;"></div>
	</div>
	<div class="bottom"></div>
</div>
<div id="dialog"></div>
<div id="innerDialog"></div>

<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/libs/${jqueryEasyui}/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/main.js"></script>

<script type="text/javascript">
$(function () {
	
	$('#mainTabs').tabs('hideHeader');
	
	var ctx = '${ctx}';
	var serId = <shiro:principal property="userId"/>;
	var realname = '<shiro:principal/>';
	
	var	main = window.createMain({
			ctx: ctx,
			cacheOptions: {
	        	resource: {
	        		url: ctx+'/resource/getResourceByResourceType',
	        		method: 'POST',
	        		data: {
	        			resourceType: 'module'
	        		},
	        		done: function(res) {
	        			if (res.rows) {
			                var resources = {};
			                res.rows.forEach(function(x) {
			                    resources[x.resourceCode] = x;
			                });
			                main.resources = resources;
			                main.resources.array = res.rows;
			            }
	        		}
	        	},
	        	dict: {
	        		url: ctx+'/dict/getDictList',
	        		done: function(res) {
	        			if (res) {
	        				var Dict = function(options) {
	        					var dicts = {};
	        					options.data.forEach(function(x) {
	        						if (dicts[x.dictTypeCode]) {
										dicts[x.dictTypeCode][x.dictCode] = x;
										dicts[x.dictTypeCode].list.push(x);
	        						}
	        						else {
	        							dicts[x.dictTypeCode] = {};
	        							dicts[x.dictTypeCode].list = [];
	        							dicts[x.dictTypeCode][x.dictCode] = x;
	        							dicts[x.dictTypeCode].list.push(x);
	        						}
	        					});
	        					this.dicts = dicts;
	        				};
	        				Dict.prototype.getDictName = function(dictTypeCode, dictCode) {
						        return this.dicts[dictTypeCode][dictCode].dictName;
						    };
						    Dict.prototype.getDictList = function(dictTypeCode) {
						        return this.dicts[dictTypeCode].list;
						    };
	        				main.dict = new Dict({data:res});
	        			}
	        		}
	        	}
	        }
		});

	main.ready(function() {
		var resources = main.resources;
		
		resources.array.sort(function(a, b) {
			return a.seq - b.seq;
		});
		
		resources.array.forEach(function(x) {
			$('.menus>ul').append('<li><a href="#'+x.resourceCode+'"><p class="pic"><i class="'+x.imagePath+'"></i></p><p class="txt">'+x.resourceLabel+'</p></a></li>');
		});
		
		_addTab(window.location.hash ? window.location.hash.substring(1) : '');
	});
	
	function _addTab(resourceCode) {
		if (resourceCode) {
			var resource = main.resources[resourceCode],
				icon = resource.imagePath || 'fa fa-file-text',
				id = resource.resourceId,
				title = '<i class="'+icon+'"></i>&nbsp;'+resource.resourceLabel,
				url = ctx + resource.url;
				
			if (resource.url) {
				main.addTab({
					id: id,
					title: title,
					url: url
				});
				$('.active').removeClass('active');
				$('[href="#'+resourceCode+'"]').parent().addClass('active');
			}
			else {
				main.warn('温馨提示', '模块开发中...');
			}
		}
	}
	
	
	$(document).on('click', '.menus a', function(e) {
			var resourceCode = $(this).attr('href').substring(1);
			_addTab(resourceCode);
		}).on('click', '.p1 a', function(e) {
			e.preventDefault();
			_selectMesh();
		});
});

</script>
</body>
</html>