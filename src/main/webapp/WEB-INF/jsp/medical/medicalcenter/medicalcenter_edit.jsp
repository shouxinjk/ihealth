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
	<!-- webuploader上传插件css -->
	<link rel="stylesheet" type="text/css" href="plugins/uploadifys/uploadify.css" />
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
					
					<form action="medicalcenter/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="MEDICALCENTER_ID" id="MEDICALCENTER_ID" value="${pd.MEDICALCENTER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">名称:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入体检中心名称" title="体检中心名称" style="width:98%;"/></td>
							</tr>
							<c:if test="${msg eq 'save' }">
								<c:choose>
									<c:when test="${medicalcenterid eq '0' }">
										<tr>
											<td style="width:75px;text-align: right;padding-top: 13px;">上级医院:</td>
											<td>
												<select name="PARENTID" id="PARENTID">
												<option value="0">没有上级</option>
													<c:forEach items="${pds }" var="pd">
														<option value="${pd.MEDICALCENTER_ID }">${pd.NAME }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td style="width:75px;text-align: right;padding-top: 13px;">上级医院:</td>
											<td>
												<select name="PARENTID" id="PARENTID">
												<option value="0">没有上级</option>
													<c:forEach items="${centers }" var="cen">
														<option value="${cen.MEDICALCENTER_ID }">${cen.NAME }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:if>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">描述:</td>
								<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入体检中心描述" title="体检中心描述" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">LOGO:</td>
								<td>
									<input type="hidden" name="LOGO" id="LOGO" value="${pd.DESCRIPTION}" maxlength="255" placeholder="这里输入体检中心描述" title="体检中心描述" style="width:98%;"/>
									<input type="file" name="LOGO2" id="LOGO2" />
									<c:if test="${msg eq 'edit'}">
									<img alt="" src="<%=basePath%>uploadFiles/uploadImgs/${pd.LOGO }" id="image" style="width:40%;height:100px;">
									</c:if>
									<c:if test="${msg eq 'save' }">
									<img alt="" src="" id="image" style="width:40%;height:100px;">
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">城市:</td>
								<td>
									<div id="element_id">
									  <select name="PROVINCE" class="province" data-value="${pd.PROVINCE }" data-required="true"></select>
									  <select name="CITY" id="CITY" class="city" data-value="${pd.CITY }" data-required="true"></select>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">地理位置:</td>
								<td><input type="text" name="LOCATION" id="LOCATION" value="${pd.LOCATION}" maxlength="255" placeholder="这里输入体检中心地理位置" title="体检中心地理位置" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">简介:</td>
								<td><input type="text" name="ABBREVIATION" id="ABBREVIATION" value="${pd.ABBREVIATION}" maxlength="255" placeholder="这里输入体检中心简介" title="体检中心简介" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">联系电话:</td>
								<td><input type="text" name="TELEPHONE" id="TELEPHONE" value="${pd.TELEPHONE}" maxlength="255" placeholder="这里输入体检中心联系电话" title="体检中心联系电话" style="width:98%;"/></td>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">LOGO:</td>
								<td><input type="text" name="LOGO" id="LOGO" value="${pd.LOGO}" maxlength="255" placeholder="这里输入体检中心logo图片地址" title="体检中心logo图片地址" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">开业时间:</td>
								<td><input class="span10 date-picker" name="OPENINGTIME" id="OPENINGTIME" value="${pd.OPENINGTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="体检中心开业时间" title="体检中心开业时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">营业执照:</td>
								<td>
									<input type="hidden" name="ACCESSORY" id="ACCESSORY" value="${pd.ACCESSORY}" maxlength="255" placeholder="这里输入体检中心或医院附件信息" title="体检中心或医院附件信息" style="width:98%;"/>
									<input type="file" name="ACCESSORY2" id="ACCESSORY2" />
									<c:if test="${msg eq 'edit'}">
									<img alt="" src="<%=basePath%>uploadFiles/uploadImgs/${pd.LOGO }" id="ACCESSORYimage" style="width:40%;height:100px;">
									</c:if>
									<c:if test="${msg eq 'save' }">
									<img alt="" src="" id="ACCESSORYimage" style="width:40%;height:100px;">
									</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">经纬度地理位置:</td>
								<td>
									<input type="text" name="POSITION1" id="POSITION1" value="${pd.LOCATION}" maxlength="255" placeholder="这里输入体检中心位置进行搜索" style="width:40%;"/>
									<input type="button" value="查询" onclick="searchByStationName()" style="width:20%;">
									<div id="container" style="width:600px;height:400px;display:none;"></div>
									<input type="hidden" name="POSITION" id="POSITON" value="${pd.POSITION}"/>
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
	<!-- uploadify上传图片插件 -->
	<script type="text/javascript" src="plugins/uploadifys/swfobject.js"></script> 
	<script type="text/javascript" src="plugins/uploadifys/swfupload.js"></script> 
	<script type="text/javascript" src="plugins/uploadifys/jquery.uploadify.js"></script> 
	<script type="text/javascript" src="plugins/js/jquery.cxselect.js"></script>
	<!-- 百度地图api -->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=e0dqKjlucOYl5SO8aRvcrLHXjNZG8N2L"></script>
	<script type="text/javascript">
	
		$('#element_id').cxSelect({
			  url: 'plugins/js/cityData.min.json',               // 如果服务器不支持 .json 类型文件，请将文件改为 .js 文件
			  selects: ['province', 'city'],  // 数组，请注意顺序
			  emptyStyle: 'none'
			});
		
		
	    function searchByStationName(){
	    	var city = $("#CITY option:selected").val();   
	    	alert(city);
	    	$("#container").css("display","block");
	    	 var map = new BMap.Map("container");        //在container容器中创建一个地图,参数container为div的id属性;
	   	 	 var point = new BMap.Point();    //创建点坐标
	   	    map.centerAndZoom(city, 12);                //初始化地图，设置中心点坐标和地图级别
	   	 	map.setCurrentCity(city);
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
	    
	    $("#LOGO2").uploadify({
			'swf':'<%=path%>/plugins/uploadifys/uploadify.swf',
			 'uploader':'<%=path%>/enterprise/saveImage.do',
            //  'cancelImg': '<%=path%>/jsplugin/uploadify/uploadify-cancel.png',   
             //  'queueID': 'fileQueue', //页面中，你想要用来作为文件队列的元素的id  
            //   'auto': false, //当文件被添加到队列时，自动上传  
               'multi': false, //设置为true将允许多文件上传  
               'fileExt': '*.jpg;*.gif;*.png', //允许上传的文件后缀  
               'fileDesc': 'Web Image Files (.JPG, .GIF, .PNG)', //在浏览窗口底部的文件类型下拉菜单中显示的文本  
               'auto': true,
               'width':80,
              'buttonImage' : '<%=path%>/plugins/uploadifys/attrament_icon.jpg',
               'fileObjName':'upload',
              // 'buttonClass':'buttoncss',
           
               'fileSizeLimit': 10240000,  //上传文件的大小限制，单位为字节 100k  
               'onAllComplete': function (event, data) { //当上传队列中的所有文件都完成上传时触发  
                 	 //alert(data.filesUploaded + ' 个文件上传成功!');  
               },
               'onUploadSuccess': function(file,data, response) {
            	   $("#image").attr("src","<%=basePath%>uploadFiles/uploadImgs/"+data);
            	   $("#LOGO").val(data);
                }  
		});
	    
	    $("#ACCESSORY2").uploadify({
			'swf':'<%=path%>/plugins/uploadifys/uploadify.swf',
			 'uploader':'<%=path%>/enterprise/saveImage.do',
            //  'cancelImg': '<%=path%>/jsplugin/uploadify/uploadify-cancel.png',   
             //  'queueID': 'fileQueue', //页面中，你想要用来作为文件队列的元素的id  
            //   'auto': false, //当文件被添加到队列时，自动上传  
               'multi': false, //设置为true将允许多文件上传  
               'fileExt': '*.jpg;*.gif;*.png', //允许上传的文件后缀  
               'fileDesc': 'Web Image Files (.JPG, .GIF, .PNG)', //在浏览窗口底部的文件类型下拉菜单中显示的文本  
               'auto': true,
               'width':80,
              'buttonImage' : '<%=path%>/plugins/uploadifys/attrament_icon.jpg',
               'fileObjName':'upload',
              // 'buttonClass':'buttoncss',
           
               'fileSizeLimit': 10240000,  //上传文件的大小限制，单位为字节 100k  
               'onAllComplete': function (event, data) { //当上传队列中的所有文件都完成上传时触发  
                 	 //alert(data.filesUploaded + ' 个文件上传成功!');  
               },
               'onUploadSuccess': function(file,data, response) {
            	   $("#ACCESSORYimage").attr("src","<%=basePath%>uploadFiles/uploadImgs/"+data);
            	   $("#ACCESSORY").val(data);
                }  
		});
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入体检中心名称',
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