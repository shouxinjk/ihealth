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
					
					<form action="checkuppackage/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CHECKUPPACKAGE_ID" id="CHECKUPPACKAGE_ID" value="${pd.CHECKUPPACKAGE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">生成该记录的标记:</td>
								<td><input type="text" name="WORKER" id="WORKER" value="${pd.WORKER}" maxlength="255" placeholder="这里输入生成该记录的标记" title="生成该记录的标记" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">该记录生成时间:</td>
								<td><input class="span10 date-picker" name="GENERATEDTIME" id="GENERATEDTIME" value="${pd.GENERATEDTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="该记录生成时间" title="该记录生成时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">开始生效时间:</td>
								<td><input class="span10 date-picker" name="EFFECTIVEFROM" id="EFFECTIVEFROM" value="${pd.EFFECTIVEFROM}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="开始生效时间" title="开始生效时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">失效时间:</td>
								<td><input class="span10 date-picker" name="EXPIREON" id="EXPIREON" value="${pd.EXPIREON}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="失效时间" title="失效时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态:</td>
								<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="这里输入状态" title="状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">版本:</td>
								<td><input type="text" name="REVISION" id="REVISION" value="${pd.REVISION}" maxlength="255" placeholder="这里输入版本" title="版本" style="width:98%;"/></td>
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
			if($("#WORKER").val()==""){
				$("#WORKER").tips({
					side:3,
		            msg:'请输入生成该记录的标记',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WORKER").focus();
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
			if($("#EFFECTIVEFROM").val()==""){
				$("#EFFECTIVEFROM").tips({
					side:3,
		            msg:'请输入开始生效时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EFFECTIVEFROM").focus();
			return false;
			}
			if($("#EXPIREON").val()==""){
				$("#EXPIREON").tips({
					side:3,
		            msg:'请输入失效时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPIREON").focus();
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