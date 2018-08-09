<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					检索一览!
				</h4> <strong>进行中的检索。</strong>
			</div>
			<table class="table table-striped table-condensed" style='table-layout:fixed;'>
				<thead>
					<tr>
						<th>
							出发地
						</th>
						<th>
							目的地
						</th>
						<th>
							出发日期
						</th>
						<th>
							返回日期
						</th>
						<th>
							目标价格
						</th>
						<th>
							当前价格
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="item" varStatus="id">
						<tr>
     						<td >${item.fromCityName}</td>
     						<td >${item.toCityName}</td>
     						<td >${item.startDate}</td>
     						<td >${item.endDate}</td>
     						<td >${item.targetPrice}</td>
     						<td >${item.status}</td>
						</tr>
     				</c:forEach>
					<tr class="success">
						<td>
							成都
						</td>
						<td>
							新加坡
						</td>
						<td>
							01/04
						</td>
						<td>
							01/04
						</td>
						<td>
							2000
						</td>
						<td>
							2500
						</td>
					</tr>
					<tr class="error">
						<td>
							成都
						</td>
						<td>
							新加坡
						</td>
						<td>
							01/04
						</td>
						<td>
							01/04
						</td>
						<td>
							2000
						</td>
						<td>
							2500
						</td>
					</tr>
					<tr class="warning">
						<td>
							成都
						</td>
						<td>
							新加坡
						</td>
						<td>
							01/04
						</td>
						<td>
							01/04
						</td>
						<td>
							2000
						</td>
						<td>
							2500
						</td>
					</tr>
					<tr class="info">
						<td>
							成都
						</td>
						<td>
							新加坡
						</td>
						<td>
							01/04
						</td>
						<td>
							01/04
						</td>
						<td>
							2000
						</td>
						<td>
							2500
						</td>
					</tr>
				</tbody>
			</table> 
			<p>
				<button class="btn btn-primary btn-default" type="button" onClick="toAdd()">Add</button>
			</p>
			<div class="panel-group" id="panel-744285">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title collapsed" href="#panel-element-698385" data-toggle="collapse" data-parent="#panel-744285">关于检索明细及删除...</a>
					</div>
					<div class="panel-collapse collapse" id="panel-element-698385">
						<div class="panel-body">
							点击各行可以进入明细，在明细页面可以删除该检索。创建超过三个月的检索将自动删除。
						</div>
					</div>
				</div>
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
	function toAdd() {
		var uri = "/flight/add";
		window.location.href = uri;
	}
</script>
</body>
</html>