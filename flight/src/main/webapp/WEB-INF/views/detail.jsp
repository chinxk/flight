<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
<head>
   <title>Flight</title>
   <link href="//libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="//libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="//libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="max-width:600px;min-width:200px">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="alert alert-dismissable alert-info">
				 
				<h4>
					检索明细!
				</h4> 
			</div>
			<table class="table table-striped table-condensed" style='table-layout:fixed;'>
				<tbody>
					<tr class="info">				
						<td >出发城市</td>
						<td >${bean.fromCityName}</td>
					</tr>				
					<tr >				
						<td >出发机场代码</td>
						<td >${bean.fromCityCode}</td>
					</tr>			
					<tr class="info">				
						<td >到达城市</td>
						<td >${bean.toCityName}</td>
					</tr>				
					<tr>				
						<td >到达机场代码</td>
						<td >${bean.toCityCode}</td>
					</tr>				
					<tr class="info">				
						<td >开始日期</td>
						<td >${bean.startDate}</td>
					</tr>				
					<tr >				
						<td >结束日期</td>
						<td >${bean.endDate}</td>
					</tr>				
					<tr class="info">			
						<td >E-mail</td>
						<td >${bean.mailAdd}</td>
					</tr>				
					<tr >				
						<td >目标价格</td>
						<td >${bean.targetPrice}</td>
					</tr>				
					<tr class="warning">			
						<td >去哪儿价格</td>
						<td >${bean.qunarPrice}</td>
					</tr>				
					<tr class="error">		
						<td >飞猪价格</td>
						<td >${bean.fliggyPrice}</td>
					</tr>				
					<tr class="success">		
						<td >携程价格</td>
						<td >${bean.ctripPrice}</td>
					</tr>				
					<tr >				
						<td >天巡价格</td>
						<td >${bean.skyPrice}</td>
					</tr>				
					<tr class="info">				
						<td >创建时间</td>
						<td >${bean.createDate}</td>
					</tr>				
					<tr >				
						<td >状态</td>
						<td >${bean.status}</td>
					</tr>				

				</tbody>
			</table> 
			<p>
				<button class="btn btn-primary btn-default" type="button" onClick="toBack()">Back</button>
			</p>
			<div class="panel-group" id="panel-744285" style="padding-bottom:30px">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title collapsed" href="#panel-element-727733" data-toggle="collapse" data-parent="#panel-744285">关于状态...</a>
					</div>
					<div class="panel-collapse collapse" id="panel-element-727733">
						<div class="panel-body">
							各网站价格均未失效为晴，1个失效为多云，2个失效为阴，2个以上失效为雷雨。
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function toBack() {
		var uri = "/flight/list";
		window.location.href = uri;
	}
</script>
</body>
</html>