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
					
					<form action="tag/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="TAG_ID" id="TAG_ID" value="${pd.TAG_ID}"/>
						<input type="hidden" name="TAGCATEGORY_ID" id="TAGATEGORY_ID" value="${TAGCATEGORY_ID}"/>
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
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入名称" title="名称" style="width:98%;" onblur="tagIsNull();"/></td>
							</tr>
							<tr>
								<td style="width: 75px; text-align: right; padding-top: 13px;">标签关系:</td>
								<td>
									<select id="TAGPARENTCATEGORY" name="TAGPARENTCATEGORY" style="width: 30%" onchange="diseaseChange('${pd.TAGCATEGORY_ID}')">
										<c:forEach items="${varList}" var="va" varStatus="vs">
										<c:choose>
											<c:when test="${pd.TAGPARENTCATEGORY eq va.TAGCATEGORY_ID}">
											<option selected value="${va.TAGCATEGORY_ID}" >${va.NAME}</option>
											</c:when>
											<c:otherwise>
											<option value="${va.TAGCATEGORY_ID}">${va.NAME}</option>
											</c:otherwise>
											</c:choose>
											</c:forEach>
									</select>
									<select id="TAGPARENT" name="TAGPARENT" style="width: 30%">
										<c:forEach items="${varListTag}" var="dis" varStatus="vs">
											<c:if test="${dis.TAG_ID eq pd.TAGPARENT }">
												<option value="${dis.TAG_ID }" selected="selected">${dis.NAME}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入描述信息" title="描述" style="width:98%;"/></td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">字段名称:</td>
								<td><input type="text" name="fieldName" id="fieldName" value="${pd.fieldName}" maxlength="512" placeholder="这里输入字段名称" title="字段名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">字段类型:</td>
								<td><input type="text" name="fieldType" id="fieldType" value="${pd.fieldType}" maxlength="512" placeholder="这里输入字段属性" title="字段属性" style="width:98%;"/></td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">表达式:</td>
								<td><input type="text" name="EXPRESSION" id="EXPRESSION" value="${pd.EXPRESSION}" maxlength="255" placeholder="这里输入表达式" title="表达式" style="width:98%;"/></td>
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
		var a = true;
		$(top.hangge());
		function tagIsNull(){
			var name = $("#NAME").val();
			$.ajax({
				url:"<%=basePath%>tag/tagIsNull",
				type:"post",
				data:{"name":name},
		  		async : false,
				cache : false,
				success:function(data){
					if(data == 'no'){
						alert("标签已经存在,请重新输入!");
						a=false;
					}else if(data == "yes"){
						a=true;
					}
				}
			})
		}
		
		 //选择标签分类时两级联动查询
		function diseaseChange(TAGCATEGORY_ID){
			var TAGCATEGORY_ID = $("#TAGPARENTCATEGORY").get(0).options[$("#TAGPARENTCATEGORY").get(0).selectedIndex].value;
			$.ajax({
				url:"<%=basePath%>tag/refreshTag.do",
				type : "post",
				data : {
					"TAGCATEGORY_ID" : TAGCATEGORY_ID
				},
				success : function(data) {
					var msg = eval(data);
					var str = "";
					for (var i = 0; i < msg.length; i++) {
						str += "<option value="+msg[i].TAG_ID+">"	
								+ msg[i].NAME + "</option>";
					}
					$("#TAGPARENT").html(str);
				}
			});
		} 
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
			if(a){
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}else{
				alert("请修改标签名称!");
			}
			
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>