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
					
					<form action="enterprise/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ENTERPRISE_ID" id="ENTERPRISE_ID" value="${pd.ENTERPRISE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">企业全程:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入企业全程" title="企业全程" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">企业简称:</td>
								<td><input type="text" name="ABBREVIATION" id="ABBREVIATION" value="${pd.ABBREVIATION}" maxlength="255" placeholder="这里输入企业简称" title="企业简称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">企业logo:</td>
								<td><input type="text" name="LOGO" id="LOGO" value="${pd.LOGO}" maxlength="255" placeholder="这里输入企业logo" title="企业logo" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人电话:</td>
								<td><input type="text" name="TELEPHONE" id="TELEPHONE" value="${pd.TELEPHONE}" maxlength="255" placeholder="这里输入联系人电话" title="联系人电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">地理位置:</td>
								<td><input type="text" name="LOCATION" id="LOCATION" value="${pd.LOCATION}" maxlength="255" placeholder="这里输入地理位置" title="地理位置" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">企业状态:</td>
								<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="这里输入企业状态" title="企业状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经度纬度位置:</td>
								<td><input type="text" name="POSITION" id="POSITION" value="${pd.POSITION}" maxlength="255" placeholder="这里输入经度纬度位置" title="经度纬度位置" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">营业执照信息:</td>
								<td><input type="text" name="BUSINESSLICENSE" id="BUSINESSLICENSE" value="${pd.BUSINESSLICENSE}" maxlength="255" placeholder="这里输入营业执照信息" title="营业执照信息" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">上级公司:</td>
								<td><input type="text" name="PARENTID" id="PARENTID" value="${pd.PARENTID}" maxlength="255" placeholder="这里输入上级公司" title="上级公司" style="width:98%;"/></td>
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
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入企业全程',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#ABBREVIATION").val()==""){
				$("#ABBREVIATION").tips({
					side:3,
		            msg:'请输入企业简称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ABBREVIATION").focus();
			return false;
			}
			if($("#LOGO").val()==""){
				$("#LOGO").tips({
					side:3,
		            msg:'请输入企业logo',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOGO").focus();
			return false;
			}
			if($("#TELEPHONE").val()==""){
				$("#TELEPHONE").tips({
					side:3,
		            msg:'请输入联系人电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TELEPHONE").focus();
			return false;
			}
			if($("#LOCATION").val()==""){
				$("#LOCATION").tips({
					side:3,
		            msg:'请输入地理位置',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOCATION").focus();
			return false;
			}
			if($("#STATUS").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请输入企业状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS").focus();
			return false;
			}
			if($("#POSITION").val()==""){
				$("#POSITION").tips({
					side:3,
		            msg:'请输入经度纬度位置',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#POSITION").focus();
			return false;
			}
			if($("#BUSINESSLICENSE").val()==""){
				$("#BUSINESSLICENSE").tips({
					side:3,
		            msg:'请输入营业执照信息',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BUSINESSLICENSE").focus();
			return false;
			}
			if($("#PARENTID").val()==""){
				$("#PARENTID").tips({
					side:3,
		            msg:'请输入上级公司',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PARENTID").focus();
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