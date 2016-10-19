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
					<form action="subhealth/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SUBHEALTH_ID" id="SUBHEALTH_ID" value="${pd.SUBHEALTH_ID}"/>
						<input type="hidden" name="SUBHEALTHCATEGORY_ID" id="SUBHEALTHCATEGORY_ID" value="${pd.SUBHEALTHCATEGORY_ID}"/>
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
								<td style="width:75px;text-align: right;padding-top: 13px;">名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="50" placeholder="这里输入名称" title="名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width: 75px; text-align: right; padding-top: 13px;">亚健康关系:</td>
								<td>
									<select id="SUBHEALTHPARENTCATEGORY" name="SUBHEALTHPARENTCATEGORY" style="width: 30%" onchange="subhealthChange('${pd.SUBHEALTHCATEGORY_ID}')">
										<c:forEach items="${varList}" var="va" varStatus="vs">
										<c:choose>
											<c:when test="${pd.SUBHEALTHPARENTCATEGORY eq va.SUBHEALTHCATEGORY_ID}">
											<option selected value="${va.SUBHEALTHCATEGORY_ID}" >${va.NAME}</option>
											</c:when>
											<c:otherwise>
											<option value="${va.SUBHEALTHCATEGORY_ID}">${va.NAME}</option>
											</c:otherwise>
											</c:choose>
											</c:forEach>
									</select>
									<select id="SUBHEALTHPARENT" name="SUBHEALTHPARENT" style="width: 30%">
										<c:forEach items="${varListSubhealth}" var="su" varStatus="vs">
											<c:if test="${su.SUBHEALTH_ID eq pd.SUBHEALTHPARENT }">
												<option value="${su.SUBHEALTH_ID }" selected="selected">${su.NAME}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="512" placeholder="这里输入描述" title="描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否为按钮:</td>
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
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">附加表达式:</td>
								<td><input type="text" name="EXPRESSION" id="EXPRESSION" value="${pd.EXPRESSION}" maxlength="1024" placeholder="这里输入附加表达式" title="附加表达式" style="width:98%;"/></td>
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
		            msg:'请输入名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#DESCRIPTION").val()==""){
				$("#DESCRIPTION").tips({
					side:3,
		            msg:'请输入描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIPTION").focus();
			return false;
			}
			if($("#ISALABLE").val()==""){
				$("#ISALABLE").tips({
					side:3,
		            msg:'请输入是否为按钮',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISALABLE").focus();
			return false;
			}
			if($("#SUBHEALTHCATEGORY_ID").val()==""){
				$("#SUBHEALTHCATEGORY_ID").tips({
					side:3,
		            msg:'请输入亚健康分类id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBHEALTHCATEGORY_ID").focus();
			return false;
			}
			if($("#EXPRESSION").val()==""){
				$("#EXPRESSION").tips({
					side:3,
		            msg:'请输入附加表达式',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EXPRESSION").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		 //选择亚健康分类时两级联动查询
		function subhealthChange(SUBHEALTHCATEGORY_ID){
			var SUBHEALTHCATEGORY_ID = $("#SUBHEALTHPARENTCATEGORY").get(0).options[$("#SUBHEALTHPARENTCATEGORY").get(0).selectedIndex].value;
			$.ajax({
				url:"<%=basePath%>subhealth/refreshSubhealth.do",
				type : "post",
				data : {
					"SUBHEALTHCATEGORY_ID" : SUBHEALTHCATEGORY_ID
				},
				success : function(data) {
					var msg = eval(data);
					var str = "";
					for (var i = 0; i < msg.length; i++) {
						str += "<option value="+msg[i].SUBHEALTH_ID+">"	
								+ msg[i].NAME + "</option>";
					}
					$("#SUBHEALTHPARENT").html(str);
				}
			});
		} 
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>