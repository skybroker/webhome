<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
<%
if(session.getAttribute("userid") == null || session.getAttribute("userid") == ""){
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "./login.jsp?redirect=./addpost.jsp"); 
	return;
}
%>
<!DOCTYPE html>
<html lang="cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title>微至Healthphere.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="./css/font-awesome.min.css" rel="stylesheet">

    <link href="./css/style.css" rel="stylesheet" media="screen" title="default">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<form id="thisForm">
	<div class="container">
		<div class="row">
			<h2><center>新建</center></h2>
			<div class="form-group">
				<label for="type">类型</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary">
						<input type="radio" name="type" id="type" value="">&nbsp;无&nbsp;
					</label>
					<label class="btn btn-primary">
						<input type="radio" name="type" id="type" value="1">求助
					</label>
					<label class="btn btn-primary">
						<input type="radio" name="type" id="type" value="2">教学
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="title">标题</label>
				<input type="text" class="form-control" name="title" id="title">
			</div>
			<div class="form-group">
				<label for="content">内容</label>
				<textarea class="form-control" name="content" id="content" rows="3"></textarea>
			</div>
			<div class="form-group">
				<label for="findings">所见</label>
				<textarea class="form-control" name="findings" id="findings" rows="3"></textarea>
			</div>
			<div class="form-group">
				<label for="diagnosis">所得</label>
				<textarea class="form-control" name="diagnosis" id="diagnosis" rows="3"></textarea>
			</div>
			<div class="form-group">
				<label for="discussion">讨论</label>
				<textarea class="form-control" name="discussion" id="discussion" rows="3"></textarea>
			</div>
			<div class="form-group">
				<input type="button" value="提交" id="submitThis">
			</div>
		</div>
	</div>
</form>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="./js/jquery-1.10.2.min.js"></script>
    <script src="./js/jquery.cookie.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/holder.js"></script>
    <script src="./js/myapp.js"></script>

</body>
<script>
$(function(){
	$("#submitThis").on("click", function(e){
		e.preventDefault();
		var title = $("#title").val();
		if(title == null || title == "") {
			alert("标题不能为空!");
			return;
		}
		var content = $("#content").val();
		if(content == null || content == "") {
			alert("内容不能为空!");
			return;
		}
		$.post(
			"./server/postnew/index.jsp",
			$("#thisForm").serialize(),
			function(data) {
				if(data != null && data.postid != null && data.postid>0) {
					alert("提交成功");
					window.location.href = "./worklist.htm";
				}
			}
		);
	});
});
</script>
</html>