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
					
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">检查项目分组</td>
								<td>${pd.SUBGROUP}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">检查项目名称</td>
								<td>${pd.NAME}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">特性</td>
								<td>${pd.FEATURES}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">检查频率</td>
								<td>${pd.FREQUENCY}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态</td>
								<td>${pd.STATUS}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">指南来源</td>
								<td>${pd.ORIGINATE}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">详细描述</td>
								<td colspan="3">${pd.DESCRIPTION}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">用于产生该记录的标记</td>
								<td>${pd.WORKER}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">版本:</td>
								<td>${pd.REVISION}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">系统标记</td>
								<td>${pd.SYSFLAG}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建该记录的时间</td>
								<td>${pd.CREATEON}</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">concernedfactors</td>
								<td>${pd.concernedfactors}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">disease_name：</td>
								<td>${pd.disease_name}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">riskType</td>
								<td>${pd.riskType}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">solution_id</td>
								<td>${pd.solution_id}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">riskDefine</td>
								<td>${pd.riskDefine}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">startage</td>
								<td>${pd.startage}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">endage</td>
								<td>${pd.endage}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">该记录生成时间:</td>
								<td>${pd.GENERATEDTIME}</td>
							</tr>
							
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
	
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