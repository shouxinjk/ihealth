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
					
					<form action="disease/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="DISEASE_ID" id="DISEASE_ID" value="${pd.DISEASE_ID}"/>
						<input type="hidden" name="DISEASECATEGORY_ID" id="DISEASECATEGORY_ID" value="${DISEASECATEGORY_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">上级:</td>
								<td>
									<div class="col-xs-4 label label-lg label-light arrowed-in arrowed-right">
										<b>${null == pds.NAME ?'(无) 此部门为顶级':pds.NAME}</b>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">疾病名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入名称" title="名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">症状说明:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入描述" title="描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否遗传倾向:</td>
								<td>
									<c:if test="${ pd.ISINHERITABLE eq 1}">
										<label><input type="radio" name="ISINHERITABLE" value="1" checked="checked"/><span>是</span></label>
										<label><input type="radio" name="ISINHERITABLE" value="0"/><span>否</span></label>
									</c:if>
									<c:if test="${ pd.ISINHERITABLE eq 0}">
										<label><input type="radio" name="ISINHERITABLE" value="1"/><span>是</span></label>
										<label><input type="radio" name="ISINHERITABLE" value="0" checked="checked"/><span>否</span></label>
									</c:if>
									<c:if test="${ pd.ISINHERITABLE eq null}">
										<label><input type="radio" name="ISINHERITABLE" value="1"/><span>是</span></label>
										<label><input type="radio" name="ISINHERITABLE" value="0" checked="checked"/><span>否</span></label>
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否高发:</td>
								<td>
									<c:if test="${pd.ISHIGHINCIDENCE eq 1}">
										<label><input type="radio" name="ISHIGHINCIDENCE" value="1" checked="checked"/><span>是</span></label>
										<label><input type="radio" name="ISHIGHINCIDENCE" value="0"/><span>否</span></label>
									</c:if>
									<c:if test="${pd.ISHIGHINCIDENCE eq 0}">
										<label><input type="radio" name="ISHIGHINCIDENCE" value="1"/><span>是</span></label>
										<label><input type="radio" name="ISHIGHINCIDENCE" value="0" checked="checked"/><span>否</span></label>
									</c:if>
									<c:if test="${pd.ISHIGHINCIDENCE eq null}">
										<label><input type="radio" name="ISHIGHINCIDENCE" value="1" checked="checked"/><span>是</span></label>
										<label><input type="radio" name="ISHIGHINCIDENCE" value="0" /><span>否</span></label>
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">显示标签:</td>
								<td>
									<c:if test="${pd.ISALABLE eq 1}">
										<label><input type="radio" name="ISALABLE" value="1" checked="checked"/><span>是</span></label>
										<label><input type="radio" name="ISALABLE" value="0"/><span>否</span></label>
									</c:if>
									<c:if test="${pd.ISALABLE eq 0}">
										<label><input type="radio" name="ISALABLE" value="1"/><span>是</span></label>
										<label><input type="radio" name="ISALABLE" value="0" checked="checked"/><span>否</span></label>
									</c:if>
									<c:if test="${pd.ISALABLE eq null}">
										<label><input type="radio" name="ISALABLE" value="1" checked="checked"/><span>是</span></label>
										<label><input type="radio" name="ISALABLE" value="0" /><span>否</span></label>
									</c:if>
								</td>
							</tr>
							<c:if test="${msg eq 'edit'}">
								<tr>
									<td
										style="width: 75px; text-align:center; padding-top:35px;">疾病关系:</td>
									<td>
										<table border="1" id="disease"
											style="width: 100%; line-height: 25px;">
											<!-- 头部 -->
											<thead>
												<tr>
													<th style="text-align:center;">引发疾病</th>
													<th style="text-align:center;">引发类型</th>
													<th style="text-align:center;">引发描述</th>
													<th style="text-align:center;">操作</th>
												</tr>
											</thead>
											<!-- 引发疾病关系显示 -->
										 	<tbody id="DANGERTBODY" style="text-align:center;">
												<c:forEach items="${varSouList}" var="sou" varStatus="vs1">
														<tr>
															<td>${sou.NAME}</td>
															<td><span>${sou.INITIATIONTE}</span></td>
															<td><span>${sou.INITIATIONDESCRIBE}</span></td>
															<td>
																<a onclick="delSou('${sou.DISEASE_DID}');">删除</a>
															</td>
														</tr>
												</c:forEach>
											</tbody>
											
											<!-- 引发疾病添加 -->
											<tr>
												<td style="width:25%;">
													<select name="DISEASECATEGORY" id="DISEASECATEGORY"  title="疾病分类" style="width:100%;" onchange="diseaseChange('${va.DISEASECATEGORY_ID}')">
														<c:forEach items="${varList}" var="va" varStatus="vs">
														<option selected value="${va.DISEASECATEGORY_ID}" >${va.NAME}</option>
														</c:forEach>
														</select>
														<select name="INITIATIONDISEASE" id="INITIATIONDISEASE"   title="引发疾病" style="width:100%;">
														<c:forEach items="${disease}" var="va" varStatus="vs">
														<option selected value="${va.DISEASE_ID}" >${va.NAME}</option>
														</c:forEach>
														</select>
												</td>
												<td style="width:10%;"> 
													<select name="INITIATIONTE" id=INITIATIONTE  title="引发类型" style="width:100%;">
														<option >可能</option>
														<option >必然</option>
													</select>
												</td>
												<td>
													<input type="text" name="INITIATIONDESCRIBE" id="INITIATIONDESCRIBE" value="${var.INITIATIONDESCRIBE}" maxlength="255" placeholder="这里输入引发描述" title="引发描述" style="width:100%;"/>
												</td>
												
												<td style="text-align:center;">
												<a id="addTableTr"
													onclick="addTabelg('DANGERTBODY')">增加</a>
												</td>
											</tr>
										</table> 
									</td>
								</tr>
							</c:if>
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
		
		function addTabelg(){
			var DISEASE_ID = $('#DISEASE_ID').val();
			var DISEASECATEGORY = $('#DISEASECATEGORY').val();
			var INITIATIONDISEASE = $('#INITIATIONDISEASE option:selected').val();
			var INITIATIONTE = $('#INITIATIONTE option:selected').val();
			var INITIATIONDESCRIBE = $('#INITIATIONDESCRIBE').val();
			$.ajax({
				url:"<%=basePath%>disease/addSou.do",
				type:"post",
				data:{"DISEASE_ID":DISEASE_ID,"INITIATIONDISEASE":INITIATIONDISEASE,"INITIATIONTE":INITIATIONTE,"INITIATIONDESCRIBE":INITIATIONDESCRIBE,"DISEASECATEGORY":DISEASECATEGORY},
				success:function(data){
					var json = eval(data);
					var str = '';
					 for(var i = 0;i<json.length;i++){
						str+='<tr>'+
						'<td>'+json[i].NAME+'<input type="hidden" value="'+json[i].DISEASE_ID+'"/></td>'+
						'<td><span>'+json[i].INITIATIONTE+'</span></td>'+
						'<td><span>'+json[i].INITIATIONDESCRIBE+'</span></td>'+
						'<td><a onclick="delSou(\''+json[i].DISEASE_DID+'\')">删除</a><input type="hidden" name="DISEASE_DID" id="DISEASE_DID" value="'+json[i].DISEASE_DID+'" /></td>'+
						'</tr>';
						}
					  $("#DANGERTBODY").html(str); 
				}
			});
		}
		
		//删除疾病关系
		function delSou(DISEASE_DID){
			var DISEASE_ID = $('#DISEASE_ID').val();
			$.ajax({
				url:'<%=basePath%>disease/delSou.do',
				type:"post",
				data:{"DISEASE_DID":DISEASE_DID,"DISEASE_ID":DISEASE_ID},
				success:function(data){
					var json = eval(data);
					var str = '';
					for(var i = 0;i<json.length;i++){
						str+='<tr>'+
						'<td>'+json[i].NAME+'<input type="hidden" value="'+json[i].DISEASE_ID+'"/></td>'+
						'<td><span>'+json[i].INITIATIONTE+'</span></td>'+
						'<td><span>'+json[i].INITIATIONDESCRIBE+'</span></td>'+
						'<td><a onclick="delSou(\''+json[i].DISEASE_DID+'\')">删除</a><input type="hidden" name="DISEASE_DID" id="DISEASE_DID" value="'+json[i].DISEASE_DID+'" /></td>'+
						'</tr>';
					}
					$("#DANGERTBODY").html(str); 
				}
			})
		}
		
		 //选择疾病分类时两级联动查询
		function diseaseChange(DISEASECATEGORY_ID){
			var DISEASECATEGORY_ID = $("#DISEASECATEGORY").get(0).options[$("#DISEASECATEGORY").get(0).selectedIndex].value;
			$.ajax({
				url:"<%=basePath%>disease/refreshDisease.do",
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
					$("#INITIATIONDISEASE").html(str);
				}
			});
		} 
		
		$(top.hangge());
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#ISINHERITABLE").val()==""){
				$("#ISINHERITABLE").tips({
					side:3,
		            msg:'请输入是否遗传倾向',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISINHERITABLE").focus();
			return false;
			}
			if($("#ISHIGHINCIDENCE").val()==""){
				$("#ISHIGHINCIDENCE").tips({
					side:3,
		            msg:'请输入是否高发',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISHIGHINCIDENCE").focus();
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