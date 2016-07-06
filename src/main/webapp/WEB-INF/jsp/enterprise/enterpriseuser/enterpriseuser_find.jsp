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
						<input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td>${pd.NAME}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td>${pd.SEX}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">生日:</td>
								<td>${pd.BIRTHDAY}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td>${pd.PHONE}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">身高:</td>
								<td>${pd.HEIGHT}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">体重:</td>
								<td>${pd.WEIGHT}</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">个人疾病:</td>
								<td>
									<c:forEach items="${allDisease}" var="d">
										${d.NAME}、
									</c:forEach>
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">家族疾病:</td>
								<td>
									<c:forEach items="${fimalyDisease}" var="d">
										${d.NAME}、
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关注疾病:</td>
								<td>
									<c:forEach items="${inherDisease}" var="d">
										${d.NAME}、
									</c:forEach>
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">生活方式:</td>
								<td>
									<c:forEach items="${tags}" var="t">
										${t.NAME}、
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td style="width:75px;padding-top: 13px;text-align: center;" colspan="4">检查项目</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: center;padding-top: 13px;">项目名称</td>
								<td style="width:75px;text-align: center;padding-top: 13px;">项目描述</td>
								<td style="width:75px;text-align: center;padding-top: 13px;">检查频率</td>
								<td style="width:75px;text-align: center;padding-top: 13px;">检查特征</td>
							</tr>
							<c:forEach items="${checkupItems }" var="c">
								<tr>
									<td style="width:75px;text-align: center;padding-top: 13px;">${c.NAME }</td>
									<td style="width:75px;text-align: center;padding-top: 13px;">${c.DESCRIPTION }</td>
									<td style="width:75px;text-align: center;padding-top: 13px;">${c.FREQUENCY }</td>
									<td style="width:75px;text-align: center;padding-top: 13px;">${c.FEATURES }</td>
								</tr>
							</c:forEach>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
					</form>
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
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>