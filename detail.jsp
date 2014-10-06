<%@ page pageEncoding="UTF-8" %>
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
<form>
	<div class="container">
		<div class="row">
			<div class="detail-panel">
				<h3 class="detail-title"><i class="fa fa-question-circle pull-left"></i>this is the title</h3>
				<div class="detail-image">
						<img src="./images/dicom.jpg" class="img-responsive" />
				</div>
				<div class="detail-content">
					
				</div>
				<div class="detail-toolbar">
					<i class="fa fa-heart pull-left">11</i>
				</div>
				<div class="reply-list">
				</div>
				<div class="reply-new">
					<textarea class="form-control" name="new-content" id="new-content" rows="3"></textarea>
					<input type="button" id="addReply" class="pull-right" value="提交">
					<input type="hidden" id="postid" name="postid" value="<%=request.getParameter("postid")%>" >
				</div>
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
<script charset="UTF-8">
function retrieveReplies(postid) {
	$.get("./server/replylist?postid="+postid,
		function(data){
			var $rlroot = $(".reply-list");
			var str = "";
			for(var idx in data) {
				var itm = data[idx];
				var d = new Date(itm.createdtime);
				str += "<div class=\"col-xs-12\">"
					+"<div class=\"reply-user "+ (idx==5?"pull-right":"pull-left") +"\">"+itm.username + "&nbsp;&nbsp;(" + d.toLocaleDateString() +" "+ d.toLocaleTimeString() + ")</div>"
					+"<textarea readonly class=\"reply-content\">"+itm.content+"</textarea>"
					+"</div>";
			}
			if(str != null && str != "")
				$rlroot.append(str);
		}
	);
}
function expandTextArea(){
	window.setTimeout( function() {
		$("textarea").each(function(index){
			$(this).height( $(this)[0].scrollHeight );
		})
	}, 300);
}
$(function(){
	$.get("./server/postinfo/index.jsp?postid=<%=request.getParameter("postid")%>",
		function(data){
			var $wkroot = $(".detail-content");
			var str = "";
				var itm = data;
				str += "<p><h4>\u5185\u5BB9</h4></p><textarea readonly>"+itm.content+"</textarea>"
					+"<h4>\u6240\u89C1</h4><textarea readonly>"+itm.findings+"</textarea>"
					+"<h4>\u6240\u5F97</h4><textarea readonly>"+itm.diagnosis+"</textarea>"
					+"<h4>\u8BA8\u8BBA</h4><textarea readonly>"+itm.discussion+"</textarea>";
			if(str != null && str != "") {
				$(".detail-title").text(itm.title);
				if(itm.type == 1) {
					$(".detail-title").prepend("<i class='fa fa-question-circle pull-left'></i>");
				} if(itm.type == 2) {
					$(".detail-title").prepend("<i class='fa fa-tags pull-left'></i>");
				}
				$wkroot.append(str);
				expandTextArea();
				retrieveReplies(data.postid);
			}
		}
	);
	$("#addReply").on("click", function(){
		var content = $("#new-content").val();
		if(content == null || content == "") {
			alert("内容不能为空!");
			return;
		}
		content = content.replace(/</g, "&lt;").replace(/>/g, "&gt;");
		$.post("./server/replynew/index.jsp", 
			$("form").serialize(),
			function(data){
				if(data.replyid > 0) {
					var $rlroot = $(".reply-list");
					var str = "<div class=\"col-xs-12\">"
						+"<div class=\"reply-user pull-right\">"+"xxx"+"</div>"
						+"<textarea readonly class=\"reply-content\">"+content+"</textarea>"
						+"</div>";
					if(str != null && str != "") {
						$rlroot.append(str);
						expandTextArea();
					}
					$("#new-content").val("");
				}
			}
		);
	});
});
</script>
</html>