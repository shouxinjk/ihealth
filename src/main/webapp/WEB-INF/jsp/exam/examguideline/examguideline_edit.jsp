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
												title="指南名称" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">疾病类别:</td>
											<td><select id="DISEASECATEGORY" name="DISEASECATEGORY"
												style="width: 40%"
												onchange="diseaseChange('${pd.EXAMGUIDELINE_ID}')">
													<c:forEach items="${pds }" var="disc" varStatus="va">
														<c:if
															test="${disc.DISEASECATEGORY_ID eq pd.DISEASECATEGORY_ID}">
															<option value="${disc.DISEASECATEGORY_ID }"
																selected="selected">${disc.NAME}</option>
														</c:if>
														<option value="${disc.DISEASECATEGORY_ID }">${disc.NAME}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">疾病名称:</td>
											<td><select id="DISEASE" name="DISEASE_ID"
												style="width: 40%">
													<c:forEach items="${varDisList}" var="dis" varStatus="vs">
														<c:if test="${dis.DISEASE_ID eq pd.DISEASE_ID }">
															<option value="${dis.DISEASE_ID }" selected="selected">${dis.NAME}</option>
														</c:if>
														<option value="${dis.DISEASE_ID }">${dis.NAME}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">关注因素:</td>
											<td><textarea rows="5" cols="10" name="CONCERNEDFACTORS"
													id="CONCERNEDFACTORS" placeholder="这里输入关注因素描述"
													title="关注因素描述" style="width: 98%;">${pd.CONCERNEDFACTORS}</textarea>
												<%-- 
									<input type="text" name="CONCERNEDFACTORS" id="CONCERNEDFACTORS" value="${pd.CONCERNEDFACTORS}" maxlength="255" placeholder="这里输入关注因素描述" title="关注因素描述" style="width:98%;"/>
								 --%></td>
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
																<th>频率</th>
																<th></th>
															</tr>
														</thead>
														<tbody id="DANGERTBODY">
															<c:forEach items="#{varSouList}" var="sou" varStatus="vs">
																<c:if test="${sou.RISKTYPE eq 0 }">
																	<tr>
																		<td>${sou.INAME}</td>
																		<td><span>${sou.FEATURES}</span><input
																			type="hidden" value="${sou.EXAMITEM_ID }" /></td>
																		<td><span>${sou.STARTAGE}</span></td>
																		<td>${sou.FNAME}<input type="hidden"
																			value="${sou.EXAMFREQUENCY_ID}"></td>
																		<td><a onclick="delSou('${sou.EXAMSOLUTION_ID}','DANGERTBODY',0);">删除</a><input type="hidden"
																			name="EXAMSOLUTION_ID" id="EXAMSOLUTION_ID"
																			value="${sou.EXAMSOLUTION_ID}" /></td>
																	</tr>
																</c:if>
															</c:forEach>
														</tbody>
														<tr>
															<td>
																<select name="ITEMCATESELECT2" ID="ITEMCATESELECT2" onchange="itemChange2()">
																	<c:forEach items="${varItemCategoryList}" var="itemCategory"
																		varStatus="vasc">
																		<c:if test="${itemCategory.PARENT_ID =='0' }">
																			<option value="${itemCategory.EXAMCATEGORY_ID }">${itemCategory.NAME}</option>	
																			<c:forEach items="${varItemCategoryList}" var="itemCategory2">
																				<c:if test="${itemCategory2.PARENT_ID == itemCategory.EXAMCATEGORY_ID }">
																					<option value="${itemCategory2.EXAMCATEGORY_ID }">&nbsp;&nbsp;&nbsp;--${itemCategory2.NAME}</option>
																				</c:if>
																			</c:forEach>	
																		</c:if>
																	</c:forEach>
																</select> 
																<select name="ITEMSELECTG2" ID="ITEMSELECTG2">
																		<c:forEach items="${varItemList}" var="item"
																			varStatus="vas">
																			<option value="${item.EXAMITEM_ID}">${item.INAME}</option>
																		</c:forEach>
																</select>
															</td>
															<td> <input type="checkbox" name="FEATURESG" value="经济" />经济
																<input type="checkbox" name="FEATURESG" value="全面" />全面
																<input type="checkbox" name="FEATURESG" value="安全" />安全</td>
															<td><input type="text" id="STARTAGEG"
																style="width: 30px" /></td>
															<td><select name="FREQSELECT" id="FREQSELECTG">
																	<c:forEach items="${varFreqList }" var="freq">
																		<option value="${freq.EXAMFREQUENCY_ID }">${freq.NAME }</option>
																	</c:forEach>
															</select></td>
															<td><a id="addTableTr"
																onclick="addTabelg('DANGERTBODY',0)">增加</a> <input
																type="hidden" name="EXAMSOLUTION_IDG"
																id="EXAMSOLUTION_IDG" value="${sou.EXAMSOLUTION_ID}" /></td>
														</tr>
													</table> <%-- <input type="text" name="LOWRISKDEFINE" id="LOWRISKDEFINE"
												value="${pd.LOWRISKDEFINE}" maxlength="255"
												placeholder="这里输入普通人群识别" title="普通人群识别" style="width: 98%;" /> --%>
												</td>
											</tr>
										</c:if>

										<tr>
											<td
												style="width: 75px; text-align: right; padding-top: 13px;">普通热群界定方法:</td>
											<td><textarea rows="3" cols="10" name="LOWRISKDEFINE"
													id="LOWRISKDEFINE" placeholder="这里输入普通人群识别脚本"
													title="普通人群识别脚本" style="width: 98%;">${pd.LOWRISKDEFINE}</textarea>
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
																<th>频率</th>
																<th></th>
															</tr>
														</thead>
														<tbody id="ORDINARYTBODY">
															<c:forEach items="#{varSouList}" var="sou" varStatus="vs">
																<c:if test="${sou.RISKTYPE eq 1 }">
																	<tr>
																		<td>${sou.INAME}
																		</td>
																		<td>${sou.FEATURES}<input
																			type="hidden" value="${sou.EXAMITEM_ID }" /></td>
																		<td><span>${sou.STARTAGE}</span></td>
																		<td><span>${sou.FNAME}</span> <input
																			type="hidden" value="${sou.EXAMFREQUENCY_ID}"></td>
																		<td><a onclick="delSou('${sou.EXAMSOLUTION_ID}','ORDINARYTBODY',1);">删除</a> <input type="hidden"
																			name="EXAMSOLUTION_ID" id="EXAMSOLUTION_ID"
																			value="${sou.EXAMSOLUTION_ID}" /></td>
																	</tr>
																</c:if>
															</c:forEach>
														</tbody>
														<tr>
															<td>
																<select name="ITEMCATESELECT" ID="ITEMCATESELECT" onchange="itemChange()">
																	<c:forEach items="${varItemCategoryList}" var="itemCategory"
																		varStatus="vasc">
																		<c:if test="${itemCategory.PARENT_ID =='0' }">
																			<option value="${itemCategory.EXAMCATEGORY_ID }">${itemCategory.NAME}</option>	
																			<c:forEach items="${varItemCategoryList}" var="itemCategory2">
																				<c:if test="${itemCategory2.PARENT_ID == itemCategory.EXAMCATEGORY_ID }">
																					<option value="${itemCategory2.EXAMCATEGORY_ID }">&nbsp;&nbsp;&nbsp;--${itemCategory2.NAME}</option>
																				</c:if>
																			</c:forEach>	
																		</c:if>
																	</c:forEach>
																</select>
																<select name="ITEMSELECT" ID="ITEMSELECT">
																	<c:forEach items="${varItemList}" var="item"
																		varStatus="vas">
																		<option value="${item.EXAMITEM_ID }">${item.INAME}</option>
																	</c:forEach>
																</select>
															</td>
															<td>
															 <input type="checkbox" name="FEATURES" value="经济" />经济
																<input type="checkbox" name="FEATURES" value="全面" />全面
																<input type="checkbox" name="FEATURES" value="安全" />安全</td>
															<td><input type="text" id="STARTAGE"
																style="width: 30px" /></td>
															<td><select name="FREQSELECT" id="FREQSELECT">
																	<c:forEach items="${varFreqList }" var="freq">
																		<option value="${freq.EXAMFREQUENCY_ID }">${freq.NAME }</option>
																	</c:forEach>
															</select></td>
															<td><a id="addTableTr"
																onclick="addTabel('ORDINARYTBODY',1)">增加</a> <input
																type="hidden" name="EXAMSOLUTION_ID"
																id="EXAMSOLUTION_ID" value="${sou.EXAMSOLUTION_ID}" /></td>
														</tr>
													</table> <%-- <input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="255" placeholder="这里输入状态" title="状态" style="width:98%;"/>
								 --%>
												</td>
											</tr>
										</c:if>

										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
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
		
		function addTabel(id,status){
			var ITEMSELECT = $("#ITEMSELECT").get(0).options[$("#ITEMSELECT").get(0).selectedIndex].text;
			var ITEMSELECT_ID = $("#ITEMSELECT").get(0).options[$("#ITEMSELECT").get(0).selectedIndex].value;
			var FEATURES = "";
			$('input[name="FEATURES"]:checked').each(function(){ 
				FEATURES+=$(this).val()+","; 
				}); 
			FEATURES =FEATURES.substring(0,FEATURES.length-1); 
			var EXAMGUIDELINE_ID = $("#EXAMGUIDELINE_ID").val();
			var STARTAGE = $("#STARTAGE").val();
			var FREQSELECT = $("#FREQSELECT").get(0).options[$("#FREQSELECT").get(0).selectedIndex].text;
			var FREQSELECT_ID = $("#FREQSELECT").get(0).options[$("#FREQSELECT").get(0).selectedIndex].value;
			$.ajax({
				url:'<%=basePath%>examguideline/addSou.do',
				type:'post',
				data:{"FEATURES":FEATURES,"STARTAGE":STARTAGE,"EXAMITEM_ID":ITEMSELECT_ID,"EXAMFREQUENCY_ID":FREQSELECT_ID,"RISKTYPE":1,"EXAMGUIDELINE_ID":EXAMGUIDELINE_ID},
				success:function(data){
					var json = eval(data);
					var str = '';
					for(var i = 0;i<json.length;i++){
						if(json[i].RISKTYPE==1){
							str+='<tr>'+
							'<td>'+json[i].INAME+'</td><td>'+json[i].FEATURES+'<input type="hidden" value="'+json[i].EXAMITEM_ID+'"/></td>'+
							'<td><span>'+json[i].STARTAGE+'</span></td>'+
							'<td>'+json[i].FNAME+'<input type="hidden" value="'+json[i].EXAMFREQUENCY_ID+'"></td>'+
							'<td><a onclick="delSou(\''+json[i].EXAMSOLUTION_ID+'\',\''+id+'\','+status+')">删除</a><input type="hidden" name="EXAMSOLUTION_ID" id="EXAMSOLUTION_ID" value="'+json[i].EXAMSOLUTION_ID+'" /></td>'+
							'</tr>';
							/* str+='<tr>'+
							'<td><span>'+json[i].INAME+'('+json[i].FEATURES+')</span> <input'+
								'type="hidden" value="'+json[i].EXAMITEM_ID+'" /></td>'+
							'<td><span>'+json[i].STARTAGE+'</span></td>'+
							'<td><span>'+json[i].FNAME+'</span> <input'+
								'type="hidden" value="'+json[i].EXAMFREQUENCY_ID+'"></td>'+
							'<td><a onclick="delSou('${sou.EXAMSOLUTION_ID}','ORDINARYTBODY',1);">删除</a> <input type="hidden"'+
								'name="EXAMSOLUTION_ID" id="EXAMSOLUTION_ID"'+
								'value="${sou.EXAMSOLUTION_ID}" /></td>'+
						'</tr>'; */
						}
					}
					$("#ORDINARYTBODY").html(str);
				}
			});
		}
		
		
		function addTabelg(id,status){
			var ITEMSELECT = $("#ITEMSELECTG2").get(0).options[$("#ITEMSELECTG2").get(0).selectedIndex].text;
			var ITEMSELECT_ID = $("#ITEMSELECTG2").get(0).options[$("#ITEMSELECTG2").get(0).selectedIndex].value;
			var FEATURES = "";
			$('input[name="FEATURESG"]:checked').each(function(){ 
				FEATURES+=$(this).val()+","; 
				}); 
			FEATURES =FEATURES.substring(0,FEATURES.length-1); 
			var EXAMGUIDELINE_ID = $("#EXAMGUIDELINE_ID").val();
			var STARTAGE = $("#STARTAGEG").val();
			var NAME = $("#NAME").val();
			var FREQSELECT = $("#FREQSELECTG").get(0).options[$("#FREQSELECTG").get(0).selectedIndex].text;
			var FREQSELECT_ID = $("#FREQSELECTG").get(0).options[$("#FREQSELECTG").get(0).selectedIndex].value;
			$.ajax({
				url:'<%=basePath%>examguideline/addSou.do',
				type:'post',
				data:{"FEATURES":FEATURES,"STARTAGE":STARTAGE,"EXAMITEM_ID":ITEMSELECT_ID,"EXAMFREQUENCY_ID":FREQSELECT_ID,"RISKTYPE":0,"EXAMGUIDELINE_ID":EXAMGUIDELINE_ID},
				success:function(data){
					var json = eval(data);
					var str = '';
					for(var i = 0;i<json.length;i++){
						if(json[i].RISKTYPE==0){
							str+='<tr>'+
							'<td>'+json[i].INAME+'</td><td>'+json[i].FEATURES+'<input type="hidden" value="'+json[i].EXAMITEM_ID+'"/></td>'+
							'<td><span>'+json[i].STARTAGE+'</span></td>'+
							'<td>'+json[i].FNAME+'<input type="hidden" value="'+json[i].EXAMFREQUENCY_ID+'"></td>'+
							'<td><a onclick="delSou(\''+json[i].EXAMSOLUTION_ID+'\',\''+id+'\','+status+')">删除</a><input type="hidden" name="EXAMSOLUTION_ID" id="EXAMSOLUTION_ID" value="'+json[i].EXAMSOLUTION_ID+'" /></td>'+
							'</tr>';
						}
					}
					$("#DANGERTBODY").html(str);
				}
			});
		}
		
		//删除检查手段
		function delSou(id,tbodyID,status){
			var EXAMGUIDELINE_ID = $("#EXAMGUIDELINE_ID").val();
			$.ajax({
				url:'<%=basePath%>examguideline/delSou.do',
				type:"post",
				data:{"EXAMSOLUTION_ID":id,"EXAMGUIDELINE_ID":EXAMGUIDELINE_ID},
				success:function(data){
					var json = eval(data);
					var str = '';
					for(var i = 0;i<json.length;i++){
						if(json[i].RISKTYPE==status){
							str+='<tr>'+
							'<td>'+json[i].INAME+'</td><td>'+json[i].FEATURES+'<input type="hidden" value="'+json[i].EXAMITEM_ID+'" /></td>'+
							'<td><span>'+json[i].STARTAGE+'</span></td>'+
							'<td>'+json[i].FNAME+'<input type="hidden" value="'+json[i].EXAMFREQUENCY_ID+'"></td>'+
							'<td><a onclick="delSou(\''+json[i].EXAMSOLUTION_ID+'\',\''+tbodyID+'\','+status+')">删除</a><input type="hidden" name="EXAMSOLUTION_ID" id="EXAMSOLUTION_ID" value="'+json[i].EXAMSOLUTION_ID+'" /></td>'+
							'</tr>';
						}
					}
					$("#"+tbodyID).html(str);
				}
			})
		}
		//选择疾病分类时两级联动查询
		function diseaseChange(EXAMGUIDELINE_ID){
			var DISEASECATEGORY_ID = $("#DISEASECATEGORY").get(0).options[$("#DISEASECATEGORY").get(0).selectedIndex].value;
			$.ajax({
				url:"<%=basePath%>examguideline/refreshDisease.do",
				type : "post",
				data : {
					"DISEASECATEGORY_ID" : DISEASECATEGORY_ID
				},
				success : function(data) {
					var msg = eval(data);
					var str = "";
					for (var i = 0; i < msg.length; i++) {
						str += "<option value="+msg[i].DISEASE_ID+">"
								+ msg[i].NAME + "</option>";
					}
					$("#DISEASE").html(str);
				}
			});
		}
		
		//选择检查项目分类时两级联动查询
		function itemChange(){
			var ITEMCATEGORY_ID = $("#ITEMCATESELECT").get(0).options[$("#ITEMCATESELECT").get(0).selectedIndex].value;
			$.ajax({
				url:"<%=basePath%>examguideline/refreshItem.do",
				type : "post",
				data : {
					"ITEMCATEGORY_ID" : ITEMCATEGORY_ID
				},
				success : function(data) {
					var msg = eval(data);
					var str = "";
					for (var i = 0; i < msg.length; i++) {
						str += "<option value="+msg[i].EXAMITEM_ID+">"
								+ msg[i].INAME + "</option>";
					}
					$("#ITEMSELECT").html(str);
				}
			});
		}
		
		//选择检查项目分类时两级联动查询
		function itemChange2(){
			var ITEMCATEGORY_ID = $("#ITEMCATESELECT2").get(0).options[$("#ITEMCATESELECT2").get(0).selectedIndex].value;
			$.ajax({
				url:"<%=basePath%>examguideline/refreshItem.do",
				type : "post",
				data : {
					"ITEMCATEGORY_ID" : ITEMCATEGORY_ID
				},
				success : function(data) {
					var msg = eval(data);
					var str = "";
					for (var i = 0; i < msg.length; i++) {
						str += "<option value="+msg[i].EXAMITEM_ID+">"
								+ msg[i].INAME + "</option>";
					}
					$("#ITEMSELECTG2").html(str);
				}
			});
		}

		//保存
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
		});
	</script>
</body>
</html>