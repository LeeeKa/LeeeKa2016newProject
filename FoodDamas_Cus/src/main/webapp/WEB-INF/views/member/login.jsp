<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<base href="../resources/">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta charset="utf-8">
<title>Fullscreen Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/supersized.css">
<link rel="stylesheet" href="assets/css/style.css">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<style type="text/css">
/* 	checkbox{
	  /* Double-sized Checkboxes */
-ms-transform
:
 
scale
(1); /* IE */

  
-moz-transform
:
 
scale
(1); /* FF */

  
-webkit-transform
:
 
scale
(1); /* Safari and Chrome */

  
-o-transform
:
 
scale
(0
.5
); /* Opera */

  
width
:
5px;

  
padding
:
 
10
px
;

  
}
*
/
</style>

</head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   	<script>
	var str ='${param.result }';
	console.log(str);
	if(str=='success'){
		alert('카카오톡으로 회원가입하였습니다.');
		window.location.replace("/member/login");

	}
	if(str=='fail'){
		alert('잘못된 정보입니다.');
		window.location.replace("/member/login");

	}

</script>

<body>

	<div class="page-container">
		<h1>Login</h1>
		<form action="/member/loginPost" method="post" class="login">
			<input type="text" name="c_id" class="c_id" placeholder="아이디">
			<input type="password" name="c_pw" class="c_pw" placeholder="패스워드">
			<div>
				<Div style="margin-left: 10px">
					<input type="checkbox" name="useCookie"
						style="box-shadow: none; width: 30px; height: 30px; line-height: 30px; float: left;">
				</Div>
				<div
					style="float: left; width: 100px; margin-top: 32px; margin-left: 5px">Remember
					Me</div>
			</div>
			<button type="submit">Login</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
		<!-- 로그인 카카오 -->
		<button id="custom-login-btn" class="loginKakao">Login Kakao</button>
		
		<div class="connect">
			<a style="display: inline; text-decoration: none"
				href="/member/register"><p class="register">register Member</p></a>

			<a id="custom-login-btn"
				style="display: inline; text-decoration: none"
				href="javascript:loginWithKakao()">
				<p class="register" style="font-size: 19px; margin-top: 10px">register
					KaKao</p>
			</a>

			<p>
				<a class="facebook" href=""></a> <a class="twitter" href=""></a>
			</p>
		</div>
	</div>
	<input id="aaaa" type="hidden" name="result" value="${param.result }" />

	<!-- Javascript -->
	<script src="assets/js/jquery-1.8.2.min.js"></script>
	<script src="assets/js/supersized.3.2.7.min.js"></script>
	<script src="assets/js/supersized-init.js"></script>
	        <script src="assets/js/login.js"></script>

	<script type='text/javascript'>
	var obj="";
	Kakao.init('b05205951a5d98b44df1432dc785354e');
    function loginWithKakao() {
        // 로그인 창을 띄웁니다.
        Kakao.Auth.login({
            success: function(authObj) {
                // 로그인 성공시, API를 호출합니다.
                Kakao.API.request({
                  url: '/v1/user/me',
                  success: function(res) {
                	  obj={
                			  k_id: res.id,
                			  k_nick:res.properties.nickname,
                			  profile_img:res.properties.profile_image,
                			  thumb_img:res.properties.thumbnail_image
                	  }
                		console.log(obj);
						reigsterKakao(obj);

                    
                  },
                  fail: function(error) {
                    alert(JSON.stringify(error));
                  }
                });
              },
              fail: function(err) {
                alert(JSON.stringify(err));
              }
        });
        
        function reigsterKakao(params) {//ajax로보냈을때 
        	   // method = method || "post";
        
        	    var form = document.createElement("form");
        	    form.setAttribute("method", "post");
        	    form.setAttribute("action", "/member/registerKakao");
        	    for(var key in params) {
        	        var hiddenField = document.createElement("input");
        	        hiddenField.setAttribute("type", "hidden");
        	        hiddenField.setAttribute("name", key);
        	        hiddenField.setAttribute("value", params[key]);
        	        form.appendChild(hiddenField);
        	    }
        	    document.body.appendChild(form);
        	    form.submit();			
		}
    };
	$(document).ready(function() {
		$(".loginKakao").on("click", function() {
			 Kakao.Auth.login({
		            success: function(authObj) {
		                // 로그인 성공시, API를 호출합니다.
		                Kakao.API.request({
		                  url: '/v1/user/me',
		                  success: function(res) {
		                		var k_id = res.id
		                	
		                		$(".c_id").val(k_id);
		                		$(".c_pw").val(k_id);
		                		$(".login").submit();
		                		
		                		
		                		
		                  },
		                  fail: function(error) {
		                    alert(JSON.stringify(error));
		                  }
		                });
		              },
		              fail: function(err) {
		                alert(JSON.stringify(err));
		              }
		        });
			
		});
	});
	
	</script>

</body>

</html>

