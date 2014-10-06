<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*" %>
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
<style>
body {
	background: #eee !important;	
}
.wrapper {	
	margin-top: 80px;
  margin-bottom: 80px;
}
.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0,0,0,0.1);  

  .form-signin-heading,
	.checkbox {
	  margin-bottom: 30px;
	}

	.checkbox {
	  font-weight: normal;
	}

	.form-control {
	  position: relative;
	  font-size: 16px;
	  height: auto;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
		}
	}

	input[type="text"] {
	  margin-bottom: -1px;
	  border-bottom-left-radius: 0;
	  border-bottom-right-radius: 0;
	}

	input[type="password"] {
	  margin-bottom: 20px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
}
</style>
</head>

<body>

  <div class="wrapper">
    <form class="form-signin">       
      <h2 class="form-signin-heading">请登陆</h2>
      <input type="text" class="form-control" name="username" placeholder="账号" required="" autofocus="" />
      <input type="password" class="form-control" name="password" placeholder="密码" required=""/>      
      <label class="checkbox">
        <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> 记住我的登陆状态
      </label>
      <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>   
    </form>
  </div>

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
	$("form").on("submit",function(e){
		e.preventDefault();
		$.post("./server/login/index.jsp",
			$("form").serialize(),
			function(data){
				if(data.result > 0) {
					window.location.href = "<%=request.getParameter("redirect")!=""?request.getParameter("redirect"):"worklist.htm"%>";
				} else {
					alert(data.message);
				}
			}
		);
	});
});
</script>
</html>