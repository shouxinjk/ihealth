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
					
					<form action="enterprise/${msg}.do" name="Form" id="Form" method="post">
						<input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="姓名" title="姓名" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td><input type="text" name="SEX" id="SEX" value="${pd.SEX}" maxlength="255" placeholder="性别" title="性别" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">生日:</td>
								<td><input type="text" name="BIRTHDAY" id="BIRTHDAY" value="${pd.BIRTHDAY}" maxlength="255" placeholder="这里输入生日" title="生日" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="255" placeholder="这里输入联系人电话" title="联系人电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">身高:</td>
								<td><input type="text" name="HEIGHT" id="HEIGHT" value="${pd.HEIGHT}" maxlength="255" placeholder="身高" title="身高" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">体重:</td>
								<td>
									<input type="hidden" name="ALLDISEASE" id="ALLDISEASE" value=""/>
									<input type="hidden" name="FIMALYDISEASE" id="FIMALYDISEASE" value=""/>
									<input type="hidden" name="GUANDISEASE" id="GUANDISEASE" value=""/>
									<input type="hidden" name="TAG" id="TAG" value=""/>
									<input type="text" name="WEIGHT" id="WEIGHT" value="${pd.WEIGHT}" maxlength="255" placeholder="体重" title="体重" style="width:98%;"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">个人疾病:</td>
								<td style="width:75px;text-align: left;padding-top: 13px;" id="allDisease" colspan="3">
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">家族疾病:</td>
								<td style="width:75px;text-align: left;padding-top: 13px;" id = "allFimalyDiseaseStr" colspan="3">
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">关注疾病:</td>
								<td style="width:75px;text-align: left;padding-top: 13px;" id="allGuanDiseaseStr" colspan="3">
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">生活方式:</td>
								<td style="width:75px;text-align: left;padding-top: 13px;" id="userTags" colspan="3"></td>
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
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#BIRTHDAY").val()==""){
				$("#BIRTHDAY").tips({
					side:3,
		            msg:'输入生日，格式：20160925',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#BIRTHDAY").focus();
				return false;
			}else{
				$("#BIRTHDAY").val($.trim($("#BIRTHDAY").val()));
			}	
			var ALLDISEASE = "";
			$('input[name="allDisease"]:checked').each(function(){ 
				ALLDISEASE+=$(this).val()+","; 
			}); 
			ALLDISEASE = ALLDISEASE.substring(0,ALLDISEASE.length-1);
			var FIMALYDISEASE = "";
			$('input[name="allFimalyDisease"]:checked').each(function(){ 
				FIMALYDISEASE+=$(this).val()+","; 
			}); 
			FIMALYDISEASE = FIMALYDISEASE.substring(0,FIMALYDISEASE.length-1);
			var GUANDISEASE = "";
			$('input[name="allGuanDisease"]:checked').each(function(){ 
				GUANDISEASE+=$(this).val()+","; 
			}); 
			GUANDISEASE = GUANDISEASE.substring(0,GUANDISEASE.length-1);
			var TAG = "";
			$('input[name="userTags"]:checked').each(function(){ 
				TAG+=$(this).val()+","; 
			}); 
			TAG = TAG.substring(0,TAG.length-1);
			$("#ALLDISEASE").val(ALLDISEASE);
			$("#FIMALYDISEASE").val(FIMALYDISEASE);
			$("#GUANDISEASE").val(GUANDISEASE);
			$("#TAG").val(TAG);
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			var USER_ID = $("#USER_ID").val();
			$.ajax({
				url:"/ihealth/enterprise/getDiseaseAndTag.do",
				type:"post",
				data:{"USER_ID":USER_ID},
				success:function(data){
					var allDisease = data.allDisease;//个人所有疾病
					var allFimaly = data.allFimaly;//所有家族疾病
					var allGuan = data.allGuan;//所有关注疾病
					var allUserDisease = data.allUserDisease;//用户个人疾病信息
					var allUserFimaly = data.allUserFimaly;//用户家族疾病信息
					var allUserGuan = data.allUserGuan;//用户关注疾病信息
					var tags = data.tags;//所有标签信息
					var userTags = data.userTags;//用户标签信息
					var allDiseaseStr = "";
					for(var i =0;i<allDisease.length;i++){
						allDiseaseStr +="<label>"+
							"<input type=\"checkbox\" value=\""+allDisease[i].DISEASE_ID+"\" style=\"margin-left: 30px;\" name=\"allDisease\" ";
						for(var j=0;j<allUserDisease.length;j++){
							if(allDisease[i].DISEASE_ID == allUserDisease[j].DISEASE_ID){
								allDiseaseStr += "checked = \"checked\" ";
							}
						}
							allDiseaseStr +="/>"+
						"<span>"+allDisease[i].NAME+"</span>"+
					"</label>";
					}
					$("#allDisease").html(allDiseaseStr);
					var allFimalyDiseaseStr = "";
					for(var i =0;i<allFimaly.length;i++){
						allFimalyDiseaseStr +="<label>"+
							"<input type=\"checkbox\" value=\""+allFimaly[i].DISEASE_ID+"\" style=\"margin-left: 30px;\" name=\"allFimalyDisease\" ";
						for(var j=0;j<allUserFimaly.length;j++){
							if(allFimaly[i].DISEASE_ID == allUserFimaly[j].DISEASE_ID){
								allFimalyDiseaseStr += "checked = \"checked\" ";
							}
						}
						allFimalyDiseaseStr +="/>"+
						"<span>"+allFimaly[i].NAME+"</span>"+
					"</label>";
					}
					$("#allFimalyDiseaseStr").html(allFimalyDiseaseStr);
					var allGuanDiseaseStr = "";
					for(var i =0;i<allGuan.length;i++){
						allGuanDiseaseStr +="<label>"+
							"<input type=\"checkbox\" value=\""+allGuan[i].DISEASE_ID+"\" style=\"margin-left: 30px;\" name=\"allGuanDisease\" ";
						for(var j=0;j<allUserGuan.length;j++){
							if(allGuan[i].DISEASE_ID == allUserGuan[j].DISEASE_ID){
								allGuanDiseaseStr += "checked = \"checked\" ";
							}
						}
						allGuanDiseaseStr +="/>"+
						"<span>"+allGuan[i].NAME+"</span>"+
					"</label>";
					}
					$("#allGuanDiseaseStr").html(allGuanDiseaseStr);
					var userTagStr = "";
					for(var i =0;i<tags.length;i++){
						userTagStr +="<label>"+
							"<input type=\"checkbox\" value=\""+tags[i].TAG_ID+"\" style=\"margin-left: 30px;\" name=\"userTags\" ";
						for(var j=0;j<userTags.length;j++){
						/* 	if(tags[i].TAG_ID == userTags[j].TAG_ID){
								userTagStr+="checked='checked' ";							
							} */
						}
						userTagStr +="/>"+
						"<span>"+tags[i].NAME+"</span>"+
					"</label>";
					}
					$("#userTags").html(userTagStr);
				}
			});
		});
		</script>
</body>
</html>