<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />

<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<link type="text/css" rel="stylesheet"
	href="plugins/zTree/2.6/zTreeStyle.css" />
<script type="text/javascript"
	src="plugins/zTree/2.6/jquery.ztree-2.6.min.js"></script>
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
					
						<div>
							<div style="width:48%; float:left;">
								<span>标签信息</span>
								<ul id="leftTree" class="tree"></ul>
							</div>
							<div style="width:48%; float:right;">
								<span>疾病信息</span>
								<ul id="rightTree" class="tree"></ul>
							</div>
						</div>
						
						<div class="col-xs-12">
							<form action="article/${msg }.do" name="Form" id="Form"
								method="post">
								<input type="hidden" name="ARTICLE_ID" id="ARTICLE_ID"
									value="${pd.ARTICLE_ID}" />
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">标题:</td>
											<td><input type="text" name="TITLE" id="TITLE"
												value="${pd.TITLE}" maxlength="255" placeholder="这里输入标题"
												title="标题" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">作者:</td>
											<td><input type="text" name="AUTHOR" id="AUTHOR"
												value="${pd.AUTHOR}" maxlength="255" placeholder="这里输入作者"
												title="作者" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">照片url:</td>
											<td><input type="text" name="LOGOURL" id="LOGOURL"
												value="${pd.LOGOURL}" maxlength="255"
												placeholder="这里输入照片url" title="照片url" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">内容url:</td>
											<td><input type="text" name="URL" id="URL"
												value="${pd.URL}" maxlength="255" placeholder="这里输入内容url"
												title="内容url" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">摘要:</td>
											<td><textarea rows="8" cols="30" maxlength="200"
													name="SUMMARY" id="SUMMARY" placeholder="这里输入摘要" title="摘要"
													style="width: 98%; resize: none;">${pd.SUMMARY}</textarea>
											</td>
										</tr>

										<tr>
											<td><input type="hidden" name="tagIds" id="tagIds"/></td>	
										</tr>

										<tr>
											<td><input type="hidden" name="diseaseId" id="diseaseId"/></td>
										</tr>

										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
												class="btn btn-mini btn-danger"
												onclick="top.Dialog.close();">取消</a></td>
										</tr>
									</table>
								</div>

								<div id="zhongxin2" class="center" style="display: none">
									<br />
									<br />
									<br />
									<br />
									<br />
									<img src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green">提交中...</h4>
								</div>

							</form>

							<div id="zhongxin2" class="center" style="display: none">
								<img src="static/images/jzx.gif" style="width: 50px;" /><br />
								<h4 class="lighter block green"></h4>
							</div>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->




	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		var zTree;
		var zTrees;
		$(document).ready(function(){
			initTag();
			initDisease();
		});
		
		var id = $("#ARTICLE_ID").val();
		//获取关联的标签
		$.ajax({
			url:"article/findTagsById/"+id,
			type:"post",
			dataType:"json",
			success:function(data){
				var tags = data.tagList;
				for (var i = 0; i < tags.length; i++) {
					var node = zTree.getNodeByParam("id",tags[i].tag_id);
					node.checked = true;
					zTree.updateNode(node);
				}
				
			}
		});
		
		//获取关联的疾病
		$.ajax({
			url:"article/findDiseasesById/"+id,
			type:"post",
			dataType:"json",
			success:function(data){
				var diseases = data.diseaseList;
				for (var i = 0; i < diseases.length; i++) {
					var nodes = zTrees.getNodeByParam("id",diseases[i].disease_id);
					nodes.checked = true;
					zTree.updateNode(nodes);
				}
				
			}
		});
		
		//加载疾病信息
		function initDisease(){
			var setting = {
				showLine : true, //是否显示节点间的连线 
				checkable: true, //带有复选框
				checkType : { "Y": "s", "N": "s" }
			}
			var zns = '${zTreeNodess}';
			var zTreeNodess = eval(zns);
			zTrees = $("#rightTree").zTree(setting, zTreeNodess);
			
		}							
		
		//加载标签信息
		function initTag(){
			var setting = {
				showLine : true,//是否显示节点间的连线 
				checkable: true,
				checkType : { "Y": "s", "N": "s" }
			};
			var zn = '${zTreeNodes}';
			var zTreeNodes = eval(zn);
			zTree = $("#leftTree").zTree(setting, zTreeNodes);
		}
		
		function check(){
			tagOnCheck();
			diseaseOnCheck();
		}
		
		//获取选中的疾病ID
		function diseaseOnCheck(){
			var str = "";
			var nodes = zTrees.getCheckedNodes(true);
			for(var i=0;i<nodes.length;i++){
				if(nodes[i].id!=undefined){
					str += nodes[i].id + ",";
				}		
			}
			str = str.substring(0,str.length - 1);
			$("#diseaseId").val(str);
		}
		
		//获取选中的标签ID
		function tagOnCheck(){
			var str = "";
			var nodes = zTree.getCheckedNodes(true);
			for(var i=0;i<nodes.length;i++){
				if(nodes[i].id!=undefined){
					str += nodes[i].id + ",";
				}
			}
			//去掉字符串最后一个逗号
			str = str.substring(0,str.length - 1);
			$("#tagIds").val(str);
		}
	
	
		$(top.hangge());
		//保存
		function save(){
			
			if($("#TITLE").val()==""){
				$("#TITLE").tips({
					side:3,
		            msg:'请输入标题',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TITLE").focus();
			return false;
			}
			if($("#AUTHOR").val()==""){
				$("#AUTHOR").tips({
					side:3,
		            msg:'请输入作者',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AUTHOR").focus();
			return false;
			}
			if($("#LOGOURL").val()==""){
				$("#LOGOURL").tips({
					side:3,
		            msg:'请输入照片url',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOGOURL").focus();
			return false;
			}
			if($("#URL").val()==""){
				$("#URL").tips({
					side:3,
		            msg:'请输入内容url',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#URL").focus();
			return false;
			}
			if($("#SUMMARY").val()==""){
				$("#SUMMARY").tips({
					side:3,
		            msg:'请输入摘要',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUMMARY").focus();
			return false;
			}
			check();
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>