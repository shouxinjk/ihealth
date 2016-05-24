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
					
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">订单号:</td>
								<td>${pd.MEDICALORDERNO}</td>
								<td style="width:150px;text-align: right;padding-top: 13px;">订单生成时间:</td>
								<td>${pd.MEDICALORDERGENERATIONTIME}</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">订单预约时间:</td>
								<td>${pd.MEDICALORDERBOOKINGTIME}</td>
								<td style="width:150px;text-align: right;padding-top: 13px;">订单实际执行时间:</td>
								<td>${pd.MEDICALORDEREXECUTIONTIME}</td>
							</tr>
							<tr>
								<td style="width:150px;text-align: right;padding-top: 13px;">订单总金额:</td>
								<td>${pd.MEDICALTOTALAMOUNT}</td>
								<td style="width:150px;text-align: right;padding-top: 13px;">订单状态:</td>
								<td>${pd.STATUS}</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
										<caption style="text-align: center;">体检项目详情</caption>
										<thead>
											<tr>
												<th class="center" style="width:35px;">
												<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
												</th>
												<th class="center" style="width:50px;">序号</th>
												<th class="center">名称</th>
												<th class="center">特征</th>
												<th class="center">销售价格</th>
												<th class="center">结算价格</th>
												<th class="center">操作</th>
											</tr>
										</thead>
																
										<tbody>
										<!-- 开始循环 -->	
										<c:choose>
											<c:when test="${not empty varList}">
												<c:forEach items="${varList}" var="var" varStatus="vs">
													<tr>
														<td class='center'>
															<label class="pos-rel"><input type='checkbox' name='ids' value="${var.MEDICALEXAMITEM_ID}" class="ace" /><span class="lbl"></span></label>
														</td>
														<td class='center' style="width: 30px;">${vs.index+1}</td>
														<td class='center'>${var.NAME}</td>
														<td class='center'>${var.FEATURES}</td>
														<td class='center'>${var.SELLINGPRICE}</td>
														<td class='center'>${var.SETTLEMENTPRICE}</td>
														<td class="center">
															
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr class="main_info">
													<td colspan="100" class="center" >没有相关数据</td>
												</tr>
											</c:otherwise>
										</c:choose>
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					
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
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		$(function() {
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>