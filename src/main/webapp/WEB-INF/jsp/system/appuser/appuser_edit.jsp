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
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
						<!-- tree show -->
						<div id="treeShow"  style="display:none; margin:0 auto;width:100%;height: 200px;overflow: auto;">
							<div style="width:25%; float:left;">
								<span>标签信息</span>
								<ul id="tagTree" class="tree" style="overflow:auto"></ul>
							</div>
							
							<div style="width:25%; float:left;">
								<span>个人疾病</span>
								<ul id="personalTree" class="tree" style="overflow:auto"></ul>
							</div>
							<div style="width:25%; float:left;">
								<span>关注疾病</span>
								<ul id="focusTree" class="tree" style="overflow:auto"></ul>
							</div>
							
							<div style="width:25%; float:left;">
								<span>家族遗传疾病</span>
								<ul id="familyTree" class="tree" style="overflow:auto"></ul>
							</div>
						</div>
						
						<div class="col-xs-12">
						<span style="color:red;">*&nbsp;号所标识的列为必填列</span> 
						<form action="happuser/${msg }.do" name="userForm" id="userForm" method="post">
							
							<input type="hidden" name = "msg" id ="msg" value= "${msg }">
							<input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
							<div id="zhongxin" style="padding-top: 13px;">
							<table id="table_report" class="table table-striped table-bordered table-hover">
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>&nbsp;角色:</td>
									<td id="js">
									<select class="chosen-select form-control" name="ROLE_ID" id="role_id" data-placeholder="请选择等级" style="vertical-align:top;"  title="级别" style="width:98%;" >
									<option value=""></option>
									<c:forEach items="${roleList}" var="role">
										<option value="${role.ROLE_ID }" <c:if test="${role.ROLE_ID == pd.ROLE_ID }">selected</c:if>>${role.ROLE_NAME }</option>
									</c:forEach>
									</select>
									</td>
									<td style="width:79px;text-align: right;padding-top: 13px;">开通日期:</td>
									<td><input class="span10 date-picker" name="START_TIME" id="START_TIME" value="${pd.START_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="开通日期"  title="开通日期" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>&nbsp;用户名:</td>
									<td><input type="text" name="USERNAME" id="loginname" value="${pd.USERNAME }" placeholder="这里输入用户名" title="用户名" style="width:98%;" /></td>
									<td style="width:79px;text-align: right;padding-top: 13px;">到期日期:</td>
									<td><input class="span10 date-picker" name="END_TIME" id="END_TIME" value="${pd.END_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="到期日期" title="到期日期" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>&nbsp;编号:</td>
									<td><input type="text" name="NUMBER" id="NUMBER" value="${pd.NUMBER }" maxlength="32" placeholder="这里输入编号" title="编号" onblur="hasN('${pd.USERNAME }')" style="width:98%;" /></td>
									<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>&nbsp;邮箱:</td>
									<td><input type="email" name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="hasE('${pd.USERNAME }')" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>&nbsp;密码:</td>
									<td><input type="password" name="PASSWORD" id="password"  placeholder="输入密码"  title="密码" style="width:98%;" /></td>
									<td style="width:79px;text-align: right;padding-top: 13px;">手机号:</td>
									<td><input type="tel" name="PHONE" id="PHONE" value="${pd.PHONE }" placeholder="这里输入手机号" title="手机号" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>&nbsp;确认密码:</td>
									<td><input type="password" name="chkpwd" id="chkpwd"  placeholder="确认密码"  title="确认密码" style="width:98%;" /></td>
									<td style="width:79px;text-align: right;padding-top: 13px;">身份证号:</td>
									<td><input type="text" name="SFID" id="SFID" value="${pd.SFID }" placeholder="这里输入身份证号" title="身份证号" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">性别:</td>
									<td><input type="text" name="SEX" id="SEX" value="${pd.SEX }" placeholder="这里输入性别" title="性别" style="width:98%;" /></td>
									<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>&nbsp;生日:</td>
									<td><input class="span10 date-picker" name="BIRTHDAY" id="BIRTHDAY" value="${pd.BIRTHDAY }" type="text" data-date-format="yyyy-mm-dd" placeholder="这里输入生日" title="生日" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>&nbsp;身高:</td>
									<td><input type="text" name="HEIGHT" id="HEIGHT" value="${pd.HEIGHT }" placeholder="这里输入身高" title="身高" style="width:98%;" /></td>
									<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>&nbsp;体重:</td>
									<td><input type="text" name="WEIGHT" id="WEIGHT" value="${pd.WEIGHT }" placeholder="这里输入体重" title="体重" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">出生地:</td>
									<td><input type="text" name="BIRTHPLACE" id="BIRTHPLACE" value="${pd.BIRTHPLACE }" placeholder="这里输入出生地" title="出生地" style="width:98%;" /></td>
									<td style="width:79px;text-align: right;padding-top: 13px;">居住地:</td>
									<td><input type="text" name="LIVEPLACE" id="LIVEPLACE" value="${pd.LIVEPLACE }" placeholder="这里输入居住地" title="居住地" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">职业:</td>
									<td><input type="text" name="CAREER" id=CAREER value="${pd.CAREER }" placeholder="这里输入职业" title="职业" style="width:98%;" /></td>
									<td style="width:79px;text-align: right;padding-top: 13px;">学历:</td>
									<td><input type="text" name="DEGREE" id="DEGREE" value="${pd.DEGREE }" placeholder="这里输入学历" title="学历" style="width:98%;" /></td>
								</tr>
								
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">婚姻状况:</td>
									<td><input type="text" name="MARRIAGESTATUS" id="MARRIAGESTATUS" value="${pd.MARRIAGESTATUS }" placeholder="这里输入婚姻状况"  title="婚姻状况" style="width:98%;" /></td>
									
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>&nbsp;姓名:</td>
									<td><input type="text" name="NAME" id="name"  value="${pd.NAME }" placeholder="这里输入姓名" title="姓名" style="width:98%;" /></td>
									<td style="width:79px;text-align: right;padding-top: 13px;">开通年限:</td>
									<td><input type="number" name="YEARS" id="YEARS" class="input_txt" value="${pd.YEARS }" placeholder="开通年限(请输入数字)" title="开通年限" style="width:98%;" /></td>
								</tr>
								<tr>
									<td style="width:79px;text-align: right;padding-top: 13px;">备注:</td>
									<td><input type="text" name="BZ" id="BZ"value="${pd.BZ }" placeholder="这里输入备注" title="备注" style="width:98%;" /></td>
									<td style="width:79px;text-align: right;padding-top: 13px;">状态:</td>
									<td>
										<select name="STATUS" title="状态">
										<option value="1" <c:if test="${pd.STATUS == '1' }">selected</c:if> >正常</option>
										<option value="0" <c:if test="${pd.STATUS == '0' }">selected</c:if> >冻结</option>
										</select>
									</td>
								</tr>
								<tr style="display:none;">
									<!-- 生活方式标签 ID -->
									<td><input type="hidden" name="tagIds" id="tagIds"/></td>
								</tr>
								<tr style="display:none;">
									<!-- 个人疾病  ID-->
									<td><input type="hidden" name="personalDiseaseId" id="personalDiseaseId"/></td>
								</tr>
								<tr style="display:none;">
									<!-- 关注疾病 ID -->
									<td><input type="hidden" name="focusDiseaseId" id="focusDiseaseId"/></td>
								</tr>
								<tr style="display:none;">
									<!-- 家族遗传疾病  ID-->
									<td><input type="hidden" name="familyDiseaseId" id="familyDiseaseId"/></td>
								</tr>
								<tr>
									<td class="center" colspan="6">
										<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
										<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
									</td>
								</tr>
							</table>
							</div>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="plugins/zTree/2.6/jquery.ztree-2.6.min.js"></script>
</body>						
<script type="text/javascript">
	//定义树形菜单
	var tagTree;
	var personalTree;
	var focusTree;
	var familyTree;
	var msg = $("#msg").val();
	
	if (msg == "editU") {
		$("#treeShow").css("display","block");
		$(document).ready(function(){
			initTag();
			initPersonalDisease();
			initFocusDisease();
			initFamilyDisease();
		});
		
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
		tagTree = $("#tagTree").zTree(setting, zTreeNodes);
	}

	//加个人疾病信息
	function initPersonalDisease(){
		var setting = {
			showLine : true, //是否显示节点间的连线 
			checkable: true, //带有复选框
			checkType : { "Y": "s", "N": "s" }
		}
		var zns = '${zTreeNodess}';
		var zTreeNodess = eval(zns);
		personalTree = $("#personalTree").zTree(setting, zTreeNodess);
		
	}
	
	//加关注疾病信息
	function initFocusDisease(){
		var setting = {
			showLine : true, //是否显示节点间的连线 
			checkable: true, //带有复选框
			checkType : { "Y": "s", "N": "s" }
		}
		var zns = '${zTreeNodess}';
		var zTreeNodess = eval(zns);
		focusTree = $("#focusTree").zTree(setting, zTreeNodess);
	}
	
	//加载家族遗传疾病信息
	function initFamilyDisease(){
		var setting = {
			showLine : true, //是否显示节点间的连线 
			checkable: true, //带有复选框
			checkType : { "Y": "s", "N": "s" }
		}
		var zns = '${ins}';
		var zTreeNodess = eval(zns);
		
		familyTree = $("#familyTree").zTree(setting, zTreeNodess);
	}
	
	function che(){
		tagOnCheck();
		personaOnCheck();
		focusOnCheck();
		familyOnCheck();
	}
	
	//获取选中的标签ID
	function tagOnCheck(){
		var str = "";
		var nodes = tagTree.getCheckedNodes(true);
		for(var i=0;i<nodes.length;i++){
			if(nodes[i].id!=undefined){
				str += nodes[i].id + ",";
			}
		}
		//去掉字符串最后一个逗号
		str = str.substring(0,str.length - 1);
		$("#tagIds").val(str);
	}
	
	//获取选中的个人疾病ID
	function personaOnCheck(){
		var str = "";
		var nodes = personalTree.getCheckedNodes(true);
		for(var i=0;i<nodes.length;i++){
			if(nodes[i].id!=undefined){
				str += nodes[i].id + ",";
			}		
		}
		str = str.substring(0,str.length - 1);
		$("#personalDiseaseId").val(str);
	}
	
	//获取选中的关注病 ID
	function focusOnCheck(){
		var str = "";
		var nodes = focusTree.getCheckedNodes(true);
		for(var i=0;i<nodes.length;i++){
			if(nodes[i].id!=undefined){
				str += nodes[i].id + ",";
			}		
		}
		str = str.substring(0,str.length - 1);
		$("#focusDiseaseId").val(str);
	}
	
	//获取选中的家族遗传疾病ID
	function familyOnCheck(){
		var str = "";
		var nodes = familyTree.getCheckedNodes(true);
		for(var i=0;i<nodes.length;i++){
			if(nodes[i].id!=undefined){
				str += nodes[i].id + ",";
			}		
		}
		str = str.substring(0,str.length - 1);
		$("#familyDiseaseId").val(str);
	}
	
	
	var id = $("#user_id").val();
	
	if(msg == "editU"){
		//获取关联的标签
		$.ajax({
			url:"happuser/findTagsById/"+id,
			type:"post",
			dataType:"json",
			success:function(data){
				var tags = eval(data.tagList);
				for (var i = 0; i < tags.length; i++) {
					var node = tagTree.getNodeByParam("id",tags[i].tag_id);
					if(node != null){
						node.checked = true;
						tagTree.updateNode(node);
					}
				}
				
			}
		});
		
		//根据Id获取关联的个人疾病
		$.ajax({
			url:"happuser/findPersonalDiseasesById/"+id,
			type:"post",
			dataType:"json",
			success:function(data){
				var diseases = data.pdiseaseList;
				for (var i = 0; i < diseases.length; i++) {
					var nodes = personalTree.getNodeByParam("id",diseases[i].disease_id);
					if (nodes != null) {
						nodes.checked = true;
						personalTree.updateNode(nodes);
					}
					
				}
			}
		});
		
		//根据ID获取关注的疾病
		$.ajax({
			url:"happuser/findFocusDiseasesById/"+id,
			type:"post",
			dataType:"json",
			success:function(data){
				var diseases = data.fdiseaseList;
				for (var i = 0; i < diseases.length; i++) {
					var nodes = focusTree.getNodeByParam("id",diseases[i].disease_id);
					if (nodes != null) {
						nodes.checked = true;
						focusTree.updateNode(nodes);
					}
					
				}
				
			}
		});
		
		//根据ID获取关联的家族遗传病
		$.ajax({
			url:"happuser/findFamilyDiseasesById/"+id,
			type:"post",
			dataType:"json",
			success:function(data){
				var diseases = data.fhdiseaseList;
				for (var i = 0; i < diseases.length; i++) {
					var nodes = familyTree.getNodeByParam("id",diseases[i].disease_id);
					if(nodes!=null){
						nodes.checked = true;
						familyTree.updateNode(nodes);
					}
				}
				
			}
		});
	}
	
	
	
	
	$(top.hangge());
	
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
	}

	//保存
	function save(){
		
		if($("#role_id").val()==""){
			$("#js").tips({
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
		if($("#START_TIME").val()!= "" && $("#END_TIME").val() != ""){
			var t1 = $("#START_TIME").val();
			var t2 = $("#END_TIME").val();
			t1 = Number(t1.replace('-', '').replace('-', ''));
			t2 = Number(t2.replace('-', '').replace('-', ''));
			if(t1-t2>0){
				
				$("#END_TIME").tips({
					side:3,
		            msg:'到期日期必须大于开通日期',
		            bg:'#AE81FF',
		            time:3
		        });
				
				return false;
			}
		}
		if($("#YEARS").val()==""){
			$("#YEARS").val(0);
		}else if(isNaN(Number($("#YEARS").val()))){
			
			$("#YEARS").tips({
				side:3,
	            msg:'输入数字',
	            bg:'#AE81FF',
	            time:3
	        });
			
			$("#YEARS").focus();
			$("#YEARS").val(0);
			return false;
		}
		if($("#user_id").val()==""){
			hasU();
		}else{
			if (msg == "editU") {
				 che();
			}
			$("#userForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	}
	
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $("#loginname").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>happuser/hasU.do',
	    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					 if (msg == "editU") {
						 che();
					}
					 
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
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $("#EMAIL").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>happuser/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱'+EMAIL+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					$('#EMAIL').val('');
				 }
			}
		});
	}
	
	//判断编码是否存在
	function hasN(USERNAME){
		var NUMBER = $("#NUMBER").val();
		$.ajax({
			type: "POST",
			url: '<%=basePath%>happuser/hasN.do',
	    	data: {NUMBER:NUMBER,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#NUMBER").tips({
							side:3,
				            msg:'编号'+NUMBER+'已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $('#NUMBER').val('');
				 }
			}
		});
	}
	
	$(function() {
		//日期框
		$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
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