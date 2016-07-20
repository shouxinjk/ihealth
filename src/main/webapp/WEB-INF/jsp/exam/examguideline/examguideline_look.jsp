<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

							<form action="examguideline/${msg }.do" name="Form" id="Form"
								method="post">
								<input type="hidden" name="EXAMGUIDELINE_ID"
									id="EXAMGUIDELINE_ID" value="${pd.EXAMGUIDELINE_ID}" />
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width: 75px; text-align: right; padding-top: 13px;">指南名称:</td>
											<td>
												${pd.GNAME}
											</td>
											<td style="width: 75px; text-align: right; padding-top: 13px;">指南来源:</td>
											<td>
												${pd.ORIGINATE}
											</td>
										</tr>
										
										<tr>
											<td style="width: 75px; text-align: right; padding-top: 13px;">疾病名称:</td>
											<td>
												${pd.DNAME }
											</td>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">关注因素:</td>
											<td>
												${pd.CONCERNEDFACTORS}
											</td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">高危人群界定方法:</td>
											<td><textarea rows="3" cols="10" name="HIGHRISKDEFINE"
													id="HIGHRISKDEFINE" placeholder="这里输入高危人群识别脚本"
													title="高危人群识别脚本" style="width: 98%;">${pd.HIGHRISKDEFINE}</textarea>
												<%-- <input type="text" name="HIGHRISKEXPRESSION" id="HIGHRISKEXPRESSION" value="${pd.HIGHRISKEXPRESSION}" maxlength="255" placeholder="这里输入高危人群识别脚本" title="高危人群识别脚本" style="width:98%;"/>
								 --%></td>
										</tr>
										<c:if test="${msg eq 'edit'}">
											<tr>
												<td
													style="width: 75px; text-align: right; padding-top: 13px;">高危人群检查指南:</td>
												<td>
													<table border="1" id="GAOWEI"
														style="width: 100%; line-height: 25px;">
														<thead>
															<tr>
																<th>检查手段</th>
																<th>检查特性</th>
																<th>开始年龄</th>
																<th>分组</th>
																<th>频率</th>
																<th></th>
															</tr>
														</thead>
														<tbody id="DANGERTBODY">
															<c:forEach items="${varSouList}" var="sou" varStatus="vs1">
																<c:if test="${sou.RISKTYPE eq 'high' }">
																	<tr>
																		<td>${sou.INAME}</td>
																		<td><span>${sou.FEATURES}</span><input
																			type="hidden" value="${sou.EXAMITEM_ID }" /></td>
																		<td><span>${sou.STARTAGE}</span></td>
																		<td><span>${sou.SUBGROUP}</span></td>
																		<td>${sou.FNAME}<input type="hidden"
																			value="${sou.EXAMFREQUENCY_ID}"></td>
																		<td><a onclick="delSou('${sou.EXAMSOLUTION_ID}','DANGERTBODY','high');">删除</a><input type="hidden"
																			name="EXAMSOLUTION_ID" id="EXAMSOLUTION_ID"
																			value="${sou.EXAMSOLUTION_ID}" /></td>
																	</tr>
																</c:if>
															</c:forEach>
														</tbody>
													</table> 
												</td>
											</tr>
										</c:if>

										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">普通热群界定方法:</td>
											<td>
												${pd.LOWRISKDEFINE}
											</td>
										</tr>
										<c:if test="${msg eq 'edit' }">
											<tr>
												<td
													style="width: 75px; text-align: right; padding-top: 13px;">普通人群检查指南:</td>
												<td>
													<table border="1" name="PUTONG" id="PUTONG"
														style="width: 100%; line-height: 25px;">
														<thead>
															<tr>
																<th>检查手段</th>
																<th>检查特性</th>
																<th>开始年龄</th>
																<th>分组</th>
																<th>频率</th>
																<th></th>
															</tr>
														</thead>
														<tbody id="ORDINARYTBODY">
															<c:forEach items="${varSouList}" var="sou" varStatus="vs2">
																<c:if test="${sou.RISKTYPE eq 'low' }">
																	<tr>
																		<td>${sou.INAME}
																		</td>
																		<td>${sou.FEATURES}<input
																			type="hidden" value="${sou.EXAMITEM_ID }" /></td>
																		<td><span>${sou.STARTAGE}</span></td>
																		<td><span>${sou.SUBGROUP}</span></td>
																		<td><span>${sou.FNAME}</span> <input
																			type="hidden" value="${sou.EXAMFREQUENCY_ID}"></td>
																		<td><a onclick="delSou('${sou.EXAMSOLUTION_ID}','ORDINARYTBODY','low');">删除</a><input type="hidden"
																			name="EXAMSOLUTION_ID" id="EXAMSOLUTION_ID"
																			value="${sou.EXAMSOLUTION_ID}" /></td>
																	</tr>
																</c:if>
															</c:forEach>
														</tbody>
													</table> 
												</td>
											</tr>
										</c:if>

										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-danger"
												onclick="top.Dialog.close();">取消</a></td>
										</tr>
									</table>
								</div>
								<div id="zhongxin2" class="center" style="display: none">
									<br /> <br /> <br /> <br /> <br /> <img
										src="static/images/jiazai.gif" /><br />
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
		$(top.hangge());

		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
		});
	</script>
</body>
</html>