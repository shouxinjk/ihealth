<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="checkupitem/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CHECKUPITEM_ID" id="CHECKUPITEM_ID" value="${pd.CHECKUPITEM_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">检查项目分组:</td>
								<td><input type="text" name="SUBGROUP" id="SUBGROUP" value="${pd.SUBGROUP}" maxlength="255" placeholder="这里输入检查项目分组" title="检查项目分组" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">检查项目名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入检查项目名称" title="检查项目名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">特性:</td>
								<td><input type="text" name="FEATURES" id="FEATURES" value="${pd.FEATURES}" maxlength="255" placeholder="这里输入特性" title="特性" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">检查频率:</td>
								<td><input type="text" name="FREQUENCY" id="FREQUENCY" value="${pd.FREQUENCY}" maxlength="255" placeholder="这里输入检查频率" title="检查频率" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态:</td>
								<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="这里输入状态" title="状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">指南来源:</td>
								<td><input type="text" name="ORIGINATE" id="ORIGINATE" value="${pd.ORIGINATE}" maxlength="255" placeholder="这里输入指南来源" title="指南来源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">详细描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入详细描述" title="详细描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">该记录生成时间:</td>
								<td><input class="span10 date-picker" name="GENERATEDTIME" id="GENERATEDTIME" value="${pd.GENERATEDTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="该记录生成时间" title="该记录生成时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用于产生该记录的标记:</td>
								<td><input type="text" name="WORKER" id="WORKER" value="${pd.WORKER}" maxlength="255" placeholder="这里输入用于产生该记录的标记" title="用于产生该记录的标记" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">版本:</td>
								<td><input type="number" name="REVISION" id="REVISION" value="${pd.REVISION}" maxlength="32" placeholder="这里输入版本" title="版本" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">系统标记:</td>
								<td><input type="text" name="SYSFLAG" id="SYSFLAG" value="${pd.SYSFLAG}" maxlength="255" placeholder="这里输入系统标记" title="系统标记" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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
		$(top.hangge());
		//保存
		function save(){
			if($("#SUBGROUP").val()==""){
				$("#SUBGROUP").tips({
					side:3,
		            msg:'请输入检查项目分组',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBGROUP").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入检查项目名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#FEATURES").val()==""){
				$("#FEATURES").tips({
					side:3,
		            msg:'请输入特性',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FEATURES").focus();
			return false;
			}
			if($("#FREQUENCY").val()==""){
				$("#FREQUENCY").tips({
					side:3,
		            msg:'请输入检查频率',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FREQUENCY").focus();
			return false;
			}
			if($("#STATUS").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请输入状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS").focus();
			return false;
			}
			if($("#ORIGINATE").val()==""){
				$("#ORIGINATE").tips({
					side:3,
		            msg:'请输入指南来源',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORIGINATE").focus();
			return false;
			}
			if($("#DESCRIPTION").val()==""){
				$("#DESCRIPTION").tips({
					side:3,
		            msg:'请输入详细描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIPTION").focus();
			return false;
			}
			if($("#GENERATEDTIME").val()==""){
				$("#GENERATEDTIME").tips({
					side:3,
		            msg:'请输入该记录生成时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GENERATEDTIME").focus();
			return false;
			}
			if($("#WORKER").val()==""){
				$("#WORKER").tips({
					side:3,
		            msg:'请输入用于产生该记录的标记',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WORKER").focus();
			return false;
			}
			if($("#REVISION").val()==""){
				$("#REVISION").tips({
					side:3,
		            msg:'请输入版本',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REVISION").focus();
			return false;
			}
			if($("#SYSFLAG").val()==""){
				$("#SYSFLAG").tips({
					side:3,
		            msg:'请输入系统标记',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SYSFLAG").focus();
			return false;
			}
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