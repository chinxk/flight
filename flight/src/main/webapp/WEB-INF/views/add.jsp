<!DOCTYPE html>
<html>
<head>
   <title>Flight</title>
   <link href="//libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="//libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="//libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>

     <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="alert alert-dismissable alert-info">
				<h2>
					增加检索
				</h2>
				  请输入<strong>城市及日期</strong>
			</div>
			<div class="jumbotron">
				<h3>
					请输入信息!
				</h3>
				<p>
					This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.
				</p>
			</div>
			<div class="panel-group" id="panel-340976">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-340976" href="#panel-element-36963">城市</a>
					</div>
					<div id="panel-element-36963" class="panel-collapse collapse in">
						<div class="panel-body">
							<input type="text" class="form-control" id="fromCity" placeholder="出发城市" onChange="onInputChange()">
							<br/>
							<input type="text" class="form-control" id="toCity" placeholder="到达城市" onChange="onInputChange()">
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-340976" href="#panel-element-969561">日期</a>
					</div>
					<div id="panel-element-969561" class="panel-collapse collapse">
						<div class="panel-body">
							<input type="text" class="form-control" id="fromCity" placeholder="出发日期" onChange="onInputChange()">
							<br/>
							<input type="text" class="form-control" id="toCity" placeholder="返回日期" onChange="onInputChange()">
						</div>
					</div>
				</div>
			</div> <div class="progress progress-striped">
				<div class="progress-bar progress-success">
				</div>
			</div> 
			<button type="button" class="btn btn-default  btn-primary ">按钮</button>
			 <a id="modal-75839" href="#modal-container-75839" role="button" class="btn" data-toggle="modal">触发遮罩窗体</a>
			
			<div class="modal fade" id="modal-container-75839" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								追加
							</h4>
						</div>
						<div class="modal-body">
							确认追加以下内容
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="btn btn-primary">保存</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>
</body>
<script>
	function onInputChange(){
		var s = 0;
		var i = 0;
		$("input").each(function(){
			if($(this).val()!=""){
				i++;
			}
			s++;
		})
		var w = i/s*100+"%"
		$(".progress-bar").css("width",w);
	}
</script>
</html>