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
					
					<form action="enterprise/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ENTERPRISE_ID" id="ENTERPRISE_ID" value="${pd.ENTERPRISE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">企业名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入企业全程" title="企业全程" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">企业简称:</td>
								<td><input type="text" name="ABBREVIATION" id="ABBREVIATION" value="${pd.ABBREVIATION}" maxlength="255" placeholder="这里输入企业简称" title="企业简称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">企业logo:</td>
								<td>
									<%-- <input type="text" name="LOGO" id="LOGO" value="${pd.LOGO}" maxlength="255" placeholder="这里输入企业logo" title="企业logo" style="width:98%;"/> --%>
									<input type="file" name="LOGO" id="LOGO">
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系人电话:</td>
								<td><input type="text" name="TELEPHONE" id="TELEPHONE" value="${pd.TELEPHONE}" maxlength="255" placeholder="这里输入联系人电话" title="联系人电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">地理位置:</td>
								<td><input type="text" name="LOCATION" id="LOCATION" value="${pd.LOCATION}" maxlength="255" placeholder="这里输入地理位置" title="地理位置" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经度纬度位置:</td>
								<td>
									<input type="text" name="POSITION1" id="POSITION1" value="" maxlength="255" placeholder="这里输入体检中心位置进行搜索" style="width:40%;"/>
									<input type="button" value="查询" onclick="searchByStationName()" style="width:20%;">
									<div id="container" style="width:600px;height:400px;display:none;"></div>
									<input type="hidden" name="POSITION" id="POSITON" value="${pd.POSITION}"/>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">营业执照信息:</td>
								<td><input type="text" name="BUSINESSLICENSE" id="BUSINESSLICENSE" value="${pd.BUSINESSLICENSE}" maxlength="255" placeholder="这里输入营业执照信息" title="营业执照信息" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">上级公司:</td>
								<td>
									<%-- <input type="text" name="PARENTID" id="PARENTID" value="${pd.PARENTID}" maxlength="255" placeholder="这里输入上级公司" title="上级公司" style="width:98%;"/> --%>
									<select name="PARENTID" id="PARENTID">
										<option value="0" selected="selected">没有上级</option>
										<c:forEach items="${pds }" var="pds">
											<c:choose>
												<c:when test="${pds.ENTERPRISE_ID eq pd.PARENTID }">
													<option value="${pds.ENTERPRISE_ID }" selected="selected">${pds.NAME }</option>
												</c:when>
												<c:otherwise>
													<option value="${pds.ENTERPRISE_ID }">${pds.NAME }</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</td>
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
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=e0dqKjlucOYl5SO8aRvcrLHXjNZG8N2L"></script>
	<script type="text/javascript">
	   
	    function searchByStationName(){
	    	$("#container").css("display","block");
	    	 var map = new BMap.Map("container");        //在container容器中创建一个地图,参数container为div的id属性;
	   	 	 var point = new BMap.Point(104.06,30.66);    //创建点坐标
	   	    map.centerAndZoom(point, 12);                //初始化地图，设置中心点坐标和地图级别
	   	    map.enableScrollWheelZoom();                //激活滚轮调整大小功能
	   	    map.addControl(new BMap.NavigationControl());    //添加控件：缩放地图的控件，默认在左上角；
	   	    map.addControl(new BMap.MapTypeControl());        //添加控件：地图类型控件，默认在右上方；
	   	    map.addControl(new BMap.ScaleControl());        //添加控件：地图显示比例的控件，默认在左下方；
	   	    map.addControl(new BMap.OverviewMapControl());  //添加控件：地图的缩略图的控件，默认在右下方； TrafficControl
	    	var keyword = $("#POSITION1").val();
	    	var options = {
	    			onSearchComplete: function(results){
	    				// 判断状态是否正确
	    				if (local.getStatus() == BMAP_STATUS_SUCCESS){
	    					var s = [];
	    					for (var i = 0; i < results.getCurrentNumPois(); i ++){
	    						s.push(results.getPoi(i).title + ", " + results.getPoi(i).address);
	    						/* var marker = new BMap.Marker(new BMap.Point(results.getPoi(i).point.lng,results.getPoi(i).point.lat));  // 创建标注，为要查询的地址对应的经纬度
	    				        map.addOverlay(marker);
	    				        marker.addEventListener("click", function () {        //给标注添加点击事件
	    				       		alert(i)
	    				        }); */
	    				        var point=new BMap.Point(results.getPoi(i).point.lng,results.getPoi(i).point.lat);
	    				        var opts={  
	    					            width:250,//信息窗口宽度height:100,//信息窗口高度  
	    					            title:results.getPoi(i).title//信息窗口标题  
	    					    }
	    				        addMarker(point,i,results.getPoi(i).address,map,opts);
	    					}
	    					
	    				}
	    			}
	    		};
	    		var local =  new BMap.LocalSearch(map, options);
	    		local.search(keyword);
	    	/* localSearch.setSearchCompleteCallback(function (searchResult) {
	    		var poi = searchResult.getPoi(0);
	    		
	    		map.centerAndZoom(poi.point, 16);
	    		var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地址对应的经纬度
	        	map.addOverlay(marker);	
	    	}); */
	    }
	    
	    
	    function addMarker(point,index,address,map,opts){
	    	 var infoWindow=new BMap.InfoWindow(address,opts);//创建信息窗口对象  
	            var marker=new BMap.Marker(point);  
	                map.addOverlay(marker);  
	                marker.addEventListener("click",function(){  
		                $("#LOCATION").val(address);
		                $("#POSITON").val(point.lng+","+point.lat);
	                   map.openInfoWindow(infoWindow,point);//打开信息窗口  
	            });  
	    }
		$(top.hangge());
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入企业全程',
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