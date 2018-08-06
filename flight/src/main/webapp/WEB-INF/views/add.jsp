<!DOCTYPE html>
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
<html>
<head>
   <title>Flight</title>
   <link href="//libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdn.bootcss.com/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.min.css" rel="stylesheet">
   <script src="//libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="//libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
   <script src="//cdn.bootcss.com/bootstrap-3-typeahead/4.0.2/bootstrap3-typeahead.min.js"></script>
   <script src="https://cdn.bootcss.com/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
   <script src="https://cdn.bootcss.com/bootstrap-datepicker/1.6.4/locales/bootstrap-datepicker.zh-CN.min.js"></script>
</head>
<body>

     <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="alert alert-dismissable alert-info">
				<h2>
					增加一个查询
				</h2>
				<h2 id='infoArea'></h2>
			</div>
			<div class="jumbotron">
				<h3>
					请输入城市及日期等信息
				</h3>
				<h4>
				目前只支持查询往返国际航班。<br/>
				如果有选择框内查找不到的机场城市，可以尝试按以下格式输入。（成都，CTU）
				</h4>
			</div>
			<form method="post" action="/flight/dealAddedInfo" name="fmName" id="fmName" >
			<div class="panel-group" id="panel-340976">
				<div class="panel panel-info">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-340976" href="#panel-element-36963">城市</a>
					</div>
					<div id="panel-element-36963" class="panel-collapse collapse in">
						<div class="panel-body">
							<input type="text" class="form-control" id="fromCity" name="fromCityName" placeholder="出发城市" onChange="onInputChange()"/>
							<br/>
							<input type="text" class="form-control" id="toCity" name="toCityName" placeholder="到达城市" onChange="onInputChange()"/>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-340976" href="#panel-element-342875">日期</a>
					</div>
					<div id="panel-element-342875" class="panel-collapse collapse">
						<div class="panel-body">
							<div class="input-daterange input-group" id="datepicker">
							    <input type="text" class="input-sm form-control" style="display:block" name="startDate" id="startDate" placeholder="出发日期" onChange="onInputChange()"/>
							    <br/>
							    <input type="text" class="input-sm form-control" style="display:block" name="endDate" id="endDate" placeholder="返回日期" onChange="onInputChange()"/>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-340976" href="#panel-element-969561">价格</a>
					</div>
					<div id="panel-element-969561" class="panel-collapse collapse">
						<div class="panel-body">
							<input type="text" class="form-control" name="targetPrice" id="targetPrice" placeholder="目标价格" onChange="onInputChange()"/>
						</div>
					</div>
				</div>
			</div>
			</form>
			<div class="progress progress-striped">
				<div class="progress-bar progress-success">
				</div>
			</div> 
			<button type="button" class="btn btn-default  btn-primary " id="addButton" onClick="validateInput()">按钮</button>
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
							确认增加一个查询
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> 
							 <button type="button" class="btn btn-primary" onClick="toAdd()">保存</button>
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
</div>
</body>
<script>
<%@ include file="airport_script.jsp" %>
	$(document).ready(function(){
		//var subjects = ['长沙,CSX,黄花机场','成都,CTU,双流机场','常州,CZX,奔牛机场'];
	    $('#fromCity').typeahead(
	    	{source: subjects ,
	    	updater: myUpdater
	    	}
	    );
	    $('#toCity').typeahead(
		    	{source: subjects ,
		    	updater: myUpdater
		    	}
		    );
		
		$('.input-daterange').datepicker({
		    format: "yyyy-mm-dd",
		    language: "zh-CN"
		});
	});
	
	function myUpdater(item) {
		var s = item.split(",");
		if(s[0].indexOf("-")!=-1){
			s[0] = s[0].substr(s[0].indexOf("-")+1);
		}
		var r = s[0]+","+s[3];
    	return r;
	}
	
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
	
	function validateInput(){
		
		var errFlg = false;
		
		if($("#fromCity").val()==""){
			$("#infoArea").text("请输入出发城市。");
			errFlg = true;
		}
		if($("#toCity").val()==""){
			$("#infoArea").text("请输入到达城市。");
			errFlg = true;
		}
		if(!isDate($("#startDate").val())){
			$("#infoArea").text("请输入有效开始日期。");
			errFlg = true;
		}
		if(!isDate($("#endDate").val())){
			$("#infoArea").text("请输入有效到达日期。");
			errFlg = true;
		}
		if (!(/(^[1-9]\d*$)/.test($("#targetPrice").val()))) { 
			$("#infoArea").text("价格请输入正整数。");
			errFlg = true;
		}
		
		if(!errFlg){
			$("#infoArea").text("");
			$("#modal-75839").click();
		}
	}
	
	function isDate(date) {
        var result = date.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);

        if (result == null){
        	return false;
        }else{
            return true;
        }
    }

	function toAdd(){
		document.fmName.submit();
	}
</script>
</html>