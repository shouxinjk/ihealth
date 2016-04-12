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
					
					<form action="examguideline/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="EXAMGUIDELINE_ID" id="EXAMGUIDELINE_ID" value="${pd.EXAMGUIDELINE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">来源:</td>
								<td><input type="text" name="ORIGINATE" id="ORIGINATE" value="${pd.ORIGINATE}" maxlength="255" placeholder="这里输入来源" title="来源" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">指南详细描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入指南详细描述" title="指南详细描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关注因素描述:</td>
								<td><input type="text" name="CONCERNEDFACTORS" id="CONCERNEDFACTORS" value="${pd.CONCERNEDFACTORS}" maxlength="255" placeholder="这里输入关注因素描述" title="关注因素描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">高危人群识别:</td>
								<td><input type="text" name="HIGHRISKDEFINE" id="HIGHRISKDEFINE" value="${pd.HIGHRISKDEFINE}" maxlength="255" placeholder="这里输入高危人群识别" title="高危人群识别" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">高危人群识别脚本:</td>
								<td><input type="text" name="HIGHRISKEXPRESSION" id="HIGHRISKEXPRESSION" value="${pd.HIGHRISKEXPRESSION}" maxlength="255" placeholder="这里输入高危人群识别脚本" title="高危人群识别脚本" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">普通人群识别:</td>
								<td><input type="text" name="LOWRISKDEFINE" id="LOWRISKDEFINE" value="${pd.LOWRISKDEFINE}" maxlength="255" placeholder="这里输入普通人群识别" title="普通人群识别" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">普通人群识别脚本:</td>
								<td><input type="text" name="LOWRISKEXPRESSION" id="LOWRISKEXPRESSION" value="${pd.LOWRISKEXPRESSION}" maxlength="255" placeholder="这里输入普通人群识别脚本" title="普通人群识别脚本" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态:</td>
								<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="这里输入状态" title="状态" style="width:98%;"/></td>
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
			if($("#ORIGINATE").val()==""){
				$("#ORIGINATE").tips({
					side:3,
		            msg:'请输入来源',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ORIGINATE").focus();
			return false;
			}
			if($("#DESCRIPTION").val()==""){
				$("#DESCRIPTION").tips({
					side:3,
		            msg:'请输入指南详细描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIPTION").focus();
			return false;
			}
			if($("#CONCERNEDFACTORS").val()==""){
				$("#CONCERNEDFACTORS").tips({
					side:3,
		            msg:'请输入关注因素描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONCERNEDFACTORS").focus();
			return false;
			}
			if($("#HIGHRISKDEFINE").val()==""){
				$("#HIGHRISKDEFINE").tips({
					side:3,
		            msg:'请输入高危人群识别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HIGHRISKDEFINE").focus();
			return false;
			}
			if($("#HIGHRISKEXPRESSION").val()==""){
				$("#HIGHRISKEXPRESSION").tips({
					side:3,
		            msg:'请输入高危人群识别脚本',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HIGHRISKEXPRESSION").focus();
			return false;
			}
			if($("#LOWRISKDEFINE").val()==""){
				$("#LOWRISKDEFINE").tips({
					side:3,
		            msg:'请输入普通人群识别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOWRISKDEFINE").focus();
			return false;
			}
			if($("#LOWRISKEXPRESSION").val()==""){
				$("#LOWRISKEXPRESSION").tips({
					side:3,
		            msg:'请输入普通人群识别脚本',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LOWRISKEXPRESSION").focus();
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