﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<style type="text/css">
	.autocut{
	    width:100px;  
	    overflow:hidden;  
	    white-space:nowrap;  
	    text-overflow:ellipsis;  
	    -o-text-overflow:ellipsis;  
	    -icab-text-overflow: ellipsis;  
	    -khtml-text-overflow: ellipsis;  
	    -moz-text-overflow: ellipsis;  
	    -webkit-text-overflow: ellipsis;  
	}
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
							
						<!-- 检索  -->
						<form action="article/articleRelease" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="开始日期"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" name="lastLoginEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="结束日期"/></td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="name" id="id" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value=""></option>
									<option value="">全部</option>
									<option value="">1</option>
									<option value="">2</option>
								  	</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
						
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">标题</th>
									<th class="center">作者</th>
									<th class="center">摘要</th>
									<th class="center">发布时间</th>
									<th class="center">状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:if test="${QX.cha == 1}">
									
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.ARTICLE_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.TITLE}</td>
											<td class='center'>${var.AUTHOR}</td>
											<td class='center'><div class="autocut">${var.SUMMARY}</div></td>
											<td class='center'>${var.PUBLISHTIME}</td>
											<td class='center' id="status">${var.STATUS}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													
													
													<c:if test="${QX.edit == 1 and var.STATUS=='取消发布' or var.STATUS =='已审核'}">
													<a class="btn btn-xs btn-success" onclick="published('${var.ARTICLE_ID}');">
														<i class="ace-icon fa fa-folder-open bigger-120" title="发布"></i>
													</a>
													</c:if>
													
													<c:if test="${QX.del == 1 and var.STATUS=='已发布'}">
													<a class="btn btn-xs btn-danger" onclick="cancelPublished('${var.ARTICLE_ID}');">
														<i class="ace-icon fa fa-retweet bigger-120" title="取消发布"></i>
													</a>
													</c:if>
				
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															
															
															<c:if test="${QX.edit == 1}">
															<li>
																<a style="cursor:pointer;" onclick="published('${var.ARTICLE_ID}');" class="tooltip-success" data-rel="tooltip" title="发布">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="cancelPublished('${var.ARTICLE_ID}');" class="tooltip-error" data-rel="tooltip" title="取消发布">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
									</c:if>
									
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;" colspan="2"><div class="pagination" style="padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		
		//发布成功
		function published(id){
			$.ajax({
				url:"article/published",
				type:"post",
				contentType:"application/json;charset=utf8",
				data:JSON.stringify({"id":id}),
				dataType:"json",
				success:function(data){
					var result = data.result;
					if(result == "success"){
						window.location.href = "article/articleRelease.do";
					}else if(result="error"){
						alert("发布失败！");
					}else{
						alert("获取ID失败！");
					}
				},
				error:function(){
					alert("程序出问题了,请联系管理人员");
				}
			});
		}
		
		//取消发布
		function cancelPublished(id){
			$.ajax({
				url:"article/cancelPublished",
				type:"post",
				contentType:"application/json;charset=utf8",
				data:JSON.stringify({"id":id}),
				dataType:"json",
				success:function(data){
					var result = data.result;
					if(result == "success"){
						window.location.href = "article/articleRelease.do";
					}else if(result="error"){
						alert("审核失败！");
					}else{
						alert("获取ID失败！");
					}
				},
				error:function(){
					alert("程序出问题了,请联系管理人员");
				}
			});
		}
	</script>


</body>
</html>