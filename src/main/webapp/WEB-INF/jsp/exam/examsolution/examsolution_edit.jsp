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
					
					<form action="examsolution/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="EXAMSOLUTION_ID" id="EXAMSOLUTION_ID" value="${pd.EXAMSOLUTION_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">检查手段分组标记:</td>
								<td><input type="text" name="SUBGROUP" id="SUBGROUP" value="${pd.SUBGROUP}" maxlength="255" placeholder="这里输入检查手段分组标记" title="检查手段分组标记" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">干预手段对应风险:</td>
								<td><input type="text" name="RISKTYPE" id="RISKTYPE" value="${pd.RISKTYPE}" maxlength="255" placeholder="这里输入干预手段对应风险" title="干预手段对应风险" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">开始检查年龄:</td>
								<td><input type="number" name="STARTAGE" id="STARTAGE" value="${pd.STARTAGE}" maxlength="32" placeholder="这里输入开始检查年龄" title="开始检查年龄" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">结束检查年龄:</td>
								<td><input type="text" name="ENDAGE" id="ENDAGE" value="${pd.ENDAGE}" maxlength="255" placeholder="这里输入结束检查年龄" title="结束检查年龄" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">医学检查手段:</td>
								<td><input type="text" name="FEATURES" id="FEATURES" value="${pd.FEATURES}" maxlength="255" placeholder="这里输入医学检查手段" title="医学检查手段" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建该记录员工id:</td>
								<td><input type="text" name="CREATEBY" id="CREATEBY" value="${pd.CREATEBY}" maxlength="255" placeholder="这里输入创建该记录员工id" title="创建该记录员工id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建该记录时间:</td>
								<td><input class="span10 date-picker" name="CREATEON" id="CREATEON" value="${pd.CREATEON}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建该记录时间" title="创建该记录时间" style="width:98%;"/></td>
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
		            msg:'请输入检查手段分组标记',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBGROUP").focus();
			return false;
			}
			if($("#RISKTYPE").val()==""){
				$("#RISKTYPE").tips({
					side:3,
		            msg:'请输入干预手段对应风险',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RISKTYPE").focus();
			return false;
			}
			if($("#STARTAGE").val()==""){
				$("#STARTAGE").tips({
					side:3,
		            msg:'请输入开始检查年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STARTAGE").focus();
			return false;
			}
			if($("#ENDAGE").val()==""){
				$("#ENDAGE").tips({
					side:3,
		            msg:'请输入结束检查年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ENDAGE").focus();
			return false;
			}
			if($("#FEATURES").val()==""){
				$("#FEATURES").tips({
					side:3,
		            msg:'请输入医学检查手段',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FEATURES").focus();
			return false;
			}
			if($("#CREATEBY").val()==""){
				$("#CREATEBY").tips({
					side:3,
		            msg:'请输入创建该记录员工id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATEBY").focus();
			return false;
			}
			if($("#CREATEON").val()==""){
				$("#CREATEON").tips({
					side:3,
		            msg:'请输入创建该记录时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATEON").focus();
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