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
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">指南名称:</td>
											<td><input type="text" name="NAME" id="NAME"
												value="${pd.GNAME}" maxlength="255" placeholder="这里输入指南名称"
												title="指南名称" style="width: 98%;" readonly="readonly"/></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">指南来源:</td>
											<td><input type="text" name="ORIGINATE" id="ORIGINATE"
												value="${pd.ORIGINATE}" maxlength="255" placeholder="这里输入指南来源"
												title="指南来源" style="width: 98%;" readonly="readonly"/></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">疾病类别:</td>
											<td>
												<input type="text" value="${pd.CNAME }" readonly="readonly" />
												<%-- <select id="DISEASECATEGORY" name="DISEASECATEGORY" style="width: 40%" onchange="diseaseChange('${pd.EXAMGUIDELINE_ID}')">
														<c:forEach items="${pds }" var="pds">
															<c:if test="${pds.DISEASECATEGORY_ID eq pd.DISEASECATEGORY_ID }">
																<option value="${pds.DISEASECATEGORY_ID }" selected="selected">${pds.NAME}</option>
															</c:if>
														</c:forEach>
												</select>
												 --%>
											</td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">疾病名称:</td>
											<td>
												<input type="text" value="${pd.DNAME }" readonly="readonly" />
												<%-- <select id="DISEASE_ID" name="DISEASE_ID"
													style="width: 40%">
														<c:forEach items="${varDisList}" var="dis" varStatus="vs">
															<c:if test="${dis.DISEASE_ID eq pd.DISEASE_ID }">
																<option value="${dis.DISEASE_ID }" selected="selected">${dis.NAME}</option>
															</c:if>
															<option value="${dis.DISEASE_ID }">${dis.NAME}</option>
														</c:forEach>
												</select> --%>
											</td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">关注因素:</td>
											<td><textarea rows="5" cols="10" name="CONCERNEDFACTORS"
													id="CONCERNEDFACTORS" placeholder="这里输入关注因素描述"
													title="关注因素描述" style="width: 98%;" readonly="readonly">${pd.CONCERNEDFACTORS}</textarea>
												<%-- 
									<input type="text" name="CONCERNEDFACTORS" id="CONCERNEDFACTORS" value="${pd.CONCERNEDFACTORS}" maxlength="255" placeholder="这里输入关注因素描述" title="关注因素描述" style="width:98%;"/>
								 --%></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">高危人群界定方法:</td>
											<td><textarea rows="3" cols="10" name="HIGHRISKDEFINE"
													id="HIGHRISKDEFINE" placeholder="这里输入高危人群识别脚本"
													title="高危人群识别脚本" style="width: 98%;" readonly="readonly">${pd.HIGHRISKDEFINE}</textarea>
												<%-- <input type="text" name="HIGHRISKEXPRESSION" id="HIGHRISKEXPRESSION" value="${pd.HIGHRISKEXPRESSION}" maxlength="255" placeholder="这里输入高危人群识别脚本" title="高危人群识别脚本" style="width:98%;"/>
								 --%></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">高危人群识别规则:</td>
											<td><textarea rows="3" cols="10" name="HIGHRISKEXPRESSION"
													id="HIGHRISKDEFINE"  style="width: 98%;" readonly="readonly">${pd.HIGHRISKEXPRESSION}</textarea>
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
																	</tr>
																</c:if>
															</c:forEach>
														</tbody>
													</table> <%-- <input type="text" name="LOWRISKDEFINE" id="LOWRISKDEFINE"
												value="${pd.LOWRISKDEFINE}" maxlength="255"
												placeholder="这里输入普通人群识别" title="普通人群识别" style="width: 98%;" /> --%>
												</td>
											</tr>
										</c:if>

										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">普通人群界定方法:</td>
											<td><textarea rows="3" cols="10" name="LOWRISKDEFINE"
													id="LOWRISKDEFINE" placeholder="这里输入普通人群识别脚本"
													title="普通人群识别脚本" style="width: 98%;" readonly="readonly">${pd.LOWRISKDEFINE}</textarea>
												<%-- <input type="text" name="LOWRISKEXPRESSION" id="LOWRISKEXPRESSION" value="${pd.LOWRISKEXPRESSION}" maxlength="255" placeholder="这里输入普通人群识别脚本" title="普通人群识别脚本" style="width:98%;"/>
								 --%></td>
										</tr>
										
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">普通人群识别规则:</td>
											<td><textarea rows="3" cols="10" name="LOWRISKEXPRESSION"
													id="LOWRISKDEFINE"  style="width: 98%;" readonly="readonly">${pd.LOWRISKEXPRESSION}</textarea>
												<%-- <input type="text" name="LOWRISKEXPRESSION" id="LOWRISKEXPRESSION" value="${pd.LOWRISKEXPRESSION}" maxlength="255" placeholder="这里输入普通人群识别脚本" title="普通人群识别脚本" style="width:98%;"/>
								 --%></td>
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
																	</tr>
																</c:if>
															</c:forEach>
														</tbody>
													</table> <%-- <input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="这里输入状态" title="状态" style="width:98%;"/>
								 --%>
												</td>
											</tr>
										</c:if>

										<tr>
											<td style="text-align: center;" colspan="10"> <a
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
	<%-- $(function(){
		$.ajax({
			url:"<%=basePath%>examguideline/listCategory.do",
			type:"post",
			success:function(data){
				var d = eval(data);
				listCategory(d);
			}
		});
		$.ajax({
			url:"<%=basePath%>examguideline/listDisease.do",
			type:"post",
			success:function(data){
				var d = eval(data);
				listDisease(d);
			}
		});
	}) --%>
		$(top.hangge());
		
		/* function listDisease(data){
			for(var i=0;i<data.length;i++){
				var str = "<option value='"+data[i].DISEASECATEGORY_ID+"'>"+data[i].NAME+"</option>";
				
				$("#DISEASECATEGORY").append(str);
				if(data[i].subDiseaseCategory != undefined){
					listDisease(data[i].subDiseaseCategory);
				}
			}
		}
	
		function listCategory(data){
			for(var i=0;i<data.length;i++){
				var str = "<option value='"+data[i].EXAMCATEGORY_ID+"'>"+data[i].NAME+"</option>";
				$("#ITEMCATESELECT").append(str);
				$("#ITEMCATESELECT2").append(str);
				if(data[i].subExamCategory != undefined){
					listCategory(data[i].subExamCategory);
				}
			}
		}
	 */
		
		
		/* //保存
		function save() {
			if ($("#NAME").val() == "") {
				$("#NAME").tips({
					side : 3,
					msg : '请输入名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#NAME").focus();
				return false;
			}

			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}

		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
		}); */
	</script>
</body>
</html>