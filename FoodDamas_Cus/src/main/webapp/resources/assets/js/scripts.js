function checkPassword() {
    var password=$(".c_pw").val();
    var confirmPassword=$(".confirmC_pw").val();
    console.log(password);
    console.log(confirmPassword);
    if ( password != confirmPassword )
    {
        $("#checkPasswordText").html("<li>password가 다릅니다.</li>");
    }
    else
    {

        $("#checkPasswordText").html("<li>password가 같습니다.</li>");
    }
}
function idCheck() {
    var c_id=$(".c_id").val();

    if(c_id!=""){
    		$.ajax({
    			url: 'http://localhost/member/checkId',
    			type:"post",
    			contentType : "application/json;charset=UTF-8",
    			data:c_id,
    			success:function(check){
    				if(check==""){
    			        $("#checkId").html("<li>사용가능한 아이디입니다.</li>");

    				}else{
    			        $("#checkId").html("<li>존재하는 아이디입니다.</li>");

    				}
    				
    			}
    		});
    }
	
}

jQuery(document).ready(function() {

    $('.page-container form').submit(function(){
        var c_id=$(".c_id").val();
        var c_name=$(".c_name").val();
        var c_pw=$(".c_pw").val();
        var confirmC_pw=$(".confirmC_pw").val();
        var c_mail=$(".c_mail").val();
        var c_phone=$(".c_phone").val();

        if(c_id == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '27px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.c_id').focus();
            });
            return false;
        }
        else if(c_name == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.c_name').focus();
            });
            return false;
        }
        else if(c_pw == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '165px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.c_pw').focus();
            });
            return false;
        }

        else if(c_phone == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '329px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.c_phone').focus();
            });
            return false;
        }
        else if(c_mail == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '398px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.c_mail').focus();
            });
            return false;
        }
         if(c_pw!==confirmC_pw){
            $(this).find('.error').fadeOut('fast', function(){
            	alert("비밀번호가 다릅니다.")
            });
            return false;

        }

    });

    $('.page-container form .c_id, .page-container form .c_name, .page-container form .c_pw, .page-container form .c_phone, .page-container form .c_mail').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });

});
