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
<style type="text/css">
	#mohu{margin-top:10px;}
	#keyword{width:40%;}
	#names{width:40%;margin-left: 52px; border:1px solid #DBD0D0; border-top:none;}
	#names li{list-style: none; height:30px; line-height: 30px; padding:2px;}
</style>
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
							<input type="hidden" name = "uid" id="uid" value="${uid }"/>
							<table id="table_report" style="margin-top:20px;" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">姓名</th>
										
										<th class="center">性别</th>
										<th class="center">跟我的关系</th>
										<th class="center">操作</th>
									</tr>
									
								</thead>
								<c:if test="${pd.userList ==null or pd.userList ==''}">
									<tr class="main_info">
										<td colspan="4" class="center">${pd.msg }</td>
									</tr>
								</c:if>
								<c:if test="${pd.userList != null or pd.userList !=''}">
								<c:forEach items="${pd.userList}" var="user" varStatus="vs">
									<tr>
										<td class="center">${user.NAME }</td>
										<td class="center">${user.SEX }</td>
										<td class="center">${user.connection }</td>
										<td class="center">
											<a class="btn btn-xs btn-info" title='删除我关心的人' onclick="delConnection('${user.useranduser_id}');">
												<i class="ace-icon fa fa-search nav-search-icon" title="删除我关心的人"></i>
											</a>
										</td>
									</tr>
								</c:forEach>
								</c:if>
								
								
							</table>
							<a class="btn btn-mini btn-primary" onclick="saveConnection();">添加我关心的人</a>
							<div id="mohu" style="display:none;">
								<span>手机号：</span><input type="text" name="keyword" id="keyword" onkeyup="findByPhone();" placeholder="请输入手机号码"/>
								<span>关系：</span><input type="text" name="connection" id="connection" placeholder="请输入关系"/>
								<ul id="names"></ul>
							</div>
						</div>
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
</body>
<script type="text/javascript">
	function findByPhone(){
		//获取用户输入的值
		var keyword = $("#keyword").val();
		if(keyword!=null && keyword != ''){
			//根据用户输入的值进行模糊查询
			$.ajax({
				url:"user/findLike",
				type:"post",
				contentType:"application/json;charset=utf8",
				data:JSON.stringify({"keyword":keyword}),
				dataType:"json",
				success:function(r){
					$("#names").empty();
					if(r.result == "success"){
						var d = eval(r.data.list);
						for (var i = 0; i < d.length; i++) {
							$("#names").append("<li id='"+d[i].USER_ID+"' onclick='saveRelation(this)' onmouseover='changeBgColor(this);' onmouseout='removeBgColor(this);'>"+d[i].NAME+"</li>");
						}
						
					}else if(r.result == null){
						$("#names").append("<li>没有搜索到你想找的人哦</li>");
					}
					
				},
				error:function(){
					alert("程序失败");
				}
			});
		}else{
			$("#names").empty();
		}
	}
	
	
	function changeBgColor(a){
		$(a).css({"background-color":"#ccc","color":"#fff"});
	}
	
	function removeBgColor(a){
		$(a).css({"background-color":"#fff","color":"#111"});
	}
	
	//当鼠标点击li标签时
	function saveRelation(a){
		//获取当前用户ID
		var user_one_id = $("#uid").val();
		var user_two_id = $(a).attr("id");
		var connection = $("#connection").val();
		if(user_one_id == user_two_id){
			alert("不能和自己关联哦！");
		}else{
			if (connection == null || connection == '') {
				alert("关系不能为空哦");
			}else{
				$.ajax({
					url:"user/saveUserAndUser",
					type:"post",
					contentType:"application/json;charset=utf8",
					data:JSON.stringify({"userId":user_one_id,"user_Id":user_two_id,"connection":connection}),
					dataType:"json",
					success:function(data){
						if(data.result=="success"){
							alert("添加关心的人成功！");
							location.reload();
						}else if(data.result=="existence"){
							alert("他已经是你关心的人了哦");
						}
					},
					error:function(){
						alert("添加失败！");
					}
				});
			}
		}	
	}
	
	//显示和隐藏输入框
	function saveConnection(){
		$("#mohu").toggle();
	}

	function delConnection(id){
		$.ajax({
			url:"user/delConnection",
			type:"post",
			contentType:"application/json;charset=utf8",
			data:JSON.stringify({"useranduser_id":id}),
			dataType:"json",
			success:function(r){
				alert(r.result);
				location.reload();
			},
			error:function(){
				alert("删除关系失败！");
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
	
	
	
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			
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