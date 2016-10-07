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
					
					<form action="medicalexamitem/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MEDICALEXAMITEM_ID" id="MEDICALEXAMITEM_ID" value="${pd.MEDICALEXAMITEM_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">医学体检项目:</td>
								<td>
									<select id="ITEMCATESELECT" onchange="itemChange()">
									</select>
									
									<select id="ITEMSELECT" NAME="EXAMITEM_ID">
										<c:if test="${msg eq 'edit' }">
											<option value="${item.EXAMITEM_ID }">${item.NAME}</option>
										</c:if>
									</select>
									
									
								</td>
							</tr>
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">体检中心:</td>
									<td>
										<select name="MEDICALCENTER_ID" id="MEDICALCENTER_ID">
											<c:forEach items="${pds}" var="pds" varStatus="vs">
												<c:if test="${pd.MEDICALCENTER_ID eq pds.MEDICALCENTER_ID }">
													<option value="${pds.MEDICALCENTER_ID}" selected="selected">${pds.NAME }</option>
												</c:if>
												<option value="${pds.MEDICALCENTER_ID}">${pds.NAME }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入体检项目名称" title="体检项目名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">说明:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入体检项目说明" title="体检项目说明" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">特征:</td>
								<td><input type="text" name="FEATURES" id="FEATURES" value="${pd.FEATURES}" maxlength="255" placeholder="这里输入体检项目特征" title="体检项目特征" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">销售价格:</td>
								<td><input type="number" name="SELLINGPRICE" id="SELLINGPRICE" value="${pd.SELLINGPRICE}" maxlength="32" placeholder="这里输入体检项目销售价格" title="体检项目销售价格" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">结算价格:</td>
								<td><input type="number" name="SETTLEMENTPRICE" id="SETTLEMENTPRICE" value="${pd.SETTLEMENTPRICE}" maxlength="32" placeholder="这里输入体检项目结算价格" title="体检项目结算价格" style="width:98%;"/></td>
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
		$(function(){
			$.ajax({
				url:"<%=basePath%>medicalexamitem/listCategory.do",
				type:"post",
				success:function(data){
					var d = eval(data);
					listCategory(d);
					var t = $("#ITEMSELECT option:selected").text();
					if(t=="" || t==undefined){
						itemChange();
					}
					
				}
			});
		})
			$(top.hangge());
			
			function listCategory(data){
				for(var i=0;i<data.length;i++){
					var str = "<option value='"+data[i].EXAMCATEGORY_ID+"'>"+data[i].NAME+"</option>";
					$("#ITEMCATESELECT").append(str);
					if(data[i].subExamCategory != undefined){
						listCategory(data[i].subExamCategory);
					}
				}
			}
			
			//选择检查项目分类时两级联动查询
			function itemChange(){
				var ITEMCATEGORY_ID = $("#ITEMCATESELECT").get(0).options[$("#ITEMCATESELECT").get(0).selectedIndex].value;
				$.ajax({
					url:"<%=basePath%>medicalexamitem/refreshItem.do",
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
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入体检项目名称',
		            bg:'#AE81FF',
		            time:2
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
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>