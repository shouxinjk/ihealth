<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<link type="text/css" rel="stylesheet" href="plugins/zTree/2.6/zTreeStyle.css" />
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div style="margin:0 auto;width:100%;height: 200px;overflow: auto;">
							<div style="width:33%; float:left;margin-left: 1%;">
								<span>标签信息</span>
								<ul id="leftTree" class="tree"></ul>
							</div>
							<div style="width:33%; float:left;">
								<span>既往病史</span>
								<ul id="centerTree" class="tree"></ul>
							</div>
							<div style="width:33%; float:left;">
								<span>家族遗传病史</span>
								<ul id="rightTree" class="tree"></ul>
							</div>
						</div>
						<div class="col-xs-12">
								<span style="color:red;">*&nbsp;号所标识的列为必填列</span> 
								<form action="user/${msg }.do" name="userForm" id="userForm" method="post">
									<input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<c:if test="${fx != 'head'}">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span> 角色:</td>
											<td id="juese">
											<select class="chosen-select form-control" name="ROLE_ID" id="role_id" data-placeholder="请选择角色" style="vertical-align:top;" style="width:98%;" >
											<option value=""></option>
											<c:forEach items="${roleList}" var="role">
												<option value="${role.ROLE_ID }" <c:if test="${role.ROLE_ID == pd.ROLE_ID }">selected</c:if>>${role.ROLE_NAME }</option>
											</c:forEach>
											</select>
											</td>
										</tr>
										</c:if>
										<c:if test="${fx == 'head'}">
											<input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }" type="hidden" />
										</c:if>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span> 用户名:</td>
											<td><input type="text" name="USERNAME" id="loginname" value="${pd.USERNAME }" maxlength="32" placeholder="这里输入用户名" title="用户名" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span> 编号:</td>
											<td><input type="text" name="NUMBER" id="NUMBER" value="${pd.NUMBER }" maxlength="32" placeholder="这里输入编号" title="编号" onblur="hasN('${pd.USERNAME }')" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span> 密码:</td>
											<td><input type="password" name="PASSWORD" id="password"  maxlength="32" placeholder="输入密码 	" title="密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span> 确认密码:</td>
											<td><input type="password" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">生日:</td>
											<td><input type="text" name="BIRTHDAY" id="BIRTHDAY"  value="${pd.BIRTHDAY }"  maxlength="32" placeholder="这里输入生日" title="生日" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">性别:</td>
											<td><input type="text" name="SEX" id="SEX"  value="${pd.SEX }"  maxlength="32" placeholder="这里输入性别" title="性别" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">出生地:</td>
											<td><input type="text" name="BIRTHPLACE" id="BIRTHPLACE"  value="${pd.BIRTHPLACE }"  maxlength="32" placeholder="这里输入出生地" title="出生地" style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span> 姓名:</td>
											<td><input type="text" name="NAME" id="name"  value="${pd.NAME }"  maxlength="32" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span> 手机号:</td>
											<td><input type="number" name="PHONE" id="PHONE"  value="${pd.PHONE }"  maxlength="32" placeholder="这里输入手机号" title="手机号" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span> 邮箱:</td>
											<td><input type="email" name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="hasE('${pd.USERNAME }')" style="width:98%;"/></td>
										</tr>
										
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">昵称:</td>
											<td><input type="text" name="ALIAS" id="ALIAS"  value="${pd.ALIAS }" maxlength="32" placeholder="这里输入昵称" title="昵称" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">居住地:</td>
											<td><input type="text" name="LIVEPLACE" id="LIVEPLACE"  value="${pd.LIVEPLACE }" maxlength="32" placeholder="这里输入居住地" title="居住地" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">婚姻状态:</td>
											<td><input type="text" name="MARRIAGESTATUS" id="MARRIAGESTATUS"  value="${pd.MARRIAGESTATUS }" maxlength="32" placeholder="这里输入婚姻状态" title="婚姻状态" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">职业:</td>
											<td><input type="text" name="CAREER" id="CAREER"  value="${pd.CAREER }" maxlength="32" placeholder="这里输入职业" title="职业" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">学历:</td>
											<td><input type="text" name="DEGREE" id="DEGREE"  value="${pd.DEGREE }" maxlength="32" placeholder="这里输入学历" title="学历" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户图像:</td>
											<td><input type="text" name="AVATAR" id="AVATAR"  value="${pd.AVATAR }" maxlength="32" placeholder="这里输入用户图像" title="用户图像" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">身高:</td>
											<td><input type="text" name="HEIGHT" id="HEIGHT"  value="${pd.HEIGHT }" maxlength="32" placeholder="这里输入身高" title="身高" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">体重:</td>
											<td><input type="text" name="WEIGHT" id="WEIGHT"  value="${pd.WEIGHT }" maxlength="32" placeholder="这里输入体重" title="体重" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">备注:</td>
											<td><input type="text" name="BZ" id="BZ"value="${pd.BZ }" placeholder="这里输入备注" maxlength="64" title="备注" style="width:98%;"/></td>
										</tr>
										<tr style="display:none;">
											<td><input type="hidden" name="tagIds" id="tagIds"/></td>	
										</tr>

										<tr style="display:none;">
											<td><input type="hidden" name="diseaseId" id="diseaseId"/></td>
										</tr>
										
										<tr style="display:none;">
											<td><input type="hidden" name="fhdiseaseId" id="fhdiseaseId"/></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
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
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="plugins/zTree/2.6/jquery.ztree-2.6.min.js"></script>
</body>
<script type="text/javascript">
	var zTree;
	var zTrees;
	var zTreess;
	$(document).ready(function(){
		initTag();
		initDisease();
		initfhDisease();
	});
	
	var id = $("#user_id").val();
	//获取关联的标签
	$.ajax({
		url:"user/findTagsById/"+id,
		type:"post",
		dataType:"json",
		success:function(data){
			var tags = data.tagList;
			for (var i = 0; i < tags.length; i++) {
				var node = zTree.getNodeByParam("id",tags[i].tag_id);
				node.checked = true;
				zTree.updateNode(node);
			}
			
		}
	});
	
	//获取关联的既往疾病
	$.ajax({
		url:"user/findDiseasesById/"+id,
		type:"post",
		dataType:"json",
		success:function(data){
			var diseases = data.diseaseList;
			for (var i = 0; i < diseases.length; i++) {
				var nodes = zTrees.getNodeByParam("id",diseases[i].disease_id);
				nodes.checked = true;
				zTree.updateNode(nodes);
			}
			
		}
	});
	
	//获取关联的家族遗传疾病
	$.ajax({
		url:"user/findFhDiseasesById/"+id,
		type:"post",
		dataType:"json",
		success:function(data){
			var diseases = data.fhdiseaseList;
			for (var i = 0; i < diseases.length; i++) {
				var nodes = zTreess.getNodeByParam("id",diseases[i].disease_id);
				nodes.checked = true;
				zTree.updateNode(nodes);
			}
			
		}
	});
	
	//加载既往疾病信息
	function initDisease(){
		var setting = {
			showLine : true, //是否显示节点间的连线 
			checkable: true, //带有复选框
			checkType : { "Y": "s", "N": "s" }
		}
		var zns = '${zTreeNodess}';
		var zTreeNodess = eval(zns);
		zTrees = $("#centerTree").zTree(setting, zTreeNodess);
		
	}
	
	//加载家族遗传疾病信息
	function initfhDisease(){
		var setting = {
			showLine : true, //是否显示节点间的连线 
			checkable: true, //带有复选框
			checkType : { "Y": "s", "N": "s" }
		}
		var zns = '${zTreeNodess}';
		var zTreeNodesss = eval(zns);
		zTreess = $("#rightTree").zTree(setting, zTreeNodesss);
	}
	
	//加载标签信息
	function initTag(){
		var setting = {
			showLine : true,//是否显示节点间的连线 
			checkable: true,
			checkType : { "Y": "s", "N": "s" }
		};
		var zn = '${zTreeNodes}';
		var zTreeNodes = eval(zn);
		zTree = $("#leftTree").zTree(setting, zTreeNodes);
	}
	
	function check(){
		tagOnCheck();
		diseaseOnCheck();
		fhDiseaseOnCheck();
	}
	
	//获取选中的家族遗传病史
	function fhDiseaseOnCheck(){
		var str = "";
		var nodes = zTreess.getCheckedNodes(true);
		for(var i=0;i<nodes.length;i++){
			if(nodes[i].id!=undefined){
				str += nodes[i].id + ",";
			}		
		}
		str = str.substring(0,str.length - 1);
		$("#fhdiseaseId").val(str);
	}
	
	//获取选中的既往疾病ID
	function diseaseOnCheck(){
		var str = "";
		var nodes = zTrees.getCheckedNodes(true);
		for(var i=0;i<nodes.length;i++){
			if(nodes[i].id!=undefined){
				str += nodes[i].id + ",";
			}		
		}
		str = str.substring(0,str.length - 1);
		$("#diseaseId").val(str);
	}
	
	//获取选中的标签ID
	function tagOnCheck(){
		var str = "";
		var nodes = zTree.getCheckedNodes(true);
		for(var i=0;i<nodes.length;i++){
			if(nodes[i].id!=undefined){
				str += nodes[i].id + ",";
			}
		}
		//去掉字符串最后一个逗号
		str = str.substring(0,str.length - 1);
		$("#tagIds").val(str);
	}
	
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	//保存
	function save(){
		if($("#role_id").val()==""){
			$("#juese").tips({
				side:3,
	            msg:'选择角色',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#role_id").focus();
			return false;
		}
		if($("#loginname").val()=="" || $("#loginname").val()=="此用户名已存在!"){
			$("#loginname").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#loginname").focus();
			$("#loginname").val('');
			$("#loginname").css("background-color","white");
			return false;
		}else{
			$("#loginname").val(jQuery.trim($('#loginname').val()));
		}
		
		if($("#NUMBER").val()==""){
			$("#NUMBER").tips({
				side:3,
	            msg:'输入编号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#NUMBER").focus();
			return false;
		}else{
			$("#NUMBER").val($.trim($("#NUMBER").val()));
		} 
		if($("#user_id").val()=="" && $("#password").val()==""){
			$("#password").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#password").focus();
			return false;
		}
		if($("#password").val()!=$("#chkpwd").val()){
			
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#chkpwd").focus();
			return false;
		}
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#name").focus();
			return false;
		} 
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#PHONE").val()==""){
			
			$("#PHONE").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}else if($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
			$("#PHONE").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}
		if($("#EMAIL").val()==""){
			
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}else if(!ismail($("#EMAIL").val())){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}
		if($("#user_id").val()==""){
			hasU();
		}else{
			check();
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $.trim($("#loginname").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasU.do',
	    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#userForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#loginname").css("background-color","#D16E6C");
					setTimeout("$('#loginname').val('此用户名已存在!')",500);
				 }
			}
		});
	}
	
	//判断电话号码是否存在
	function hasPhone(){
		var USERNAME = $.trim($("#PHONE").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasPhone.do',
	    	data: {PHONE:PHONE,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#userForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#loginname").css("background-color","#D16E6C");
					setTimeout("$('#loginname').val('此手机号码已存在!')",500);
				 }
			}
		});
	}
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $.trim($("#EMAIL").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱 '+EMAIL+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#EMAIL").val('');
				 }
			}
		});
	}
	
	//判断编码是否存在
	function hasN(USERNAME){
		var NUMBER = $.trim($("#NUMBER").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasN.do',
	    	data: {NUMBER:NUMBER,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#NUMBER").tips({
							side:3,
				            msg:'编号 '+NUMBER+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#NUMBER").val('');
				 }
			}
		});
	}
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
</script>
</html>