<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/main_header.css"/>
        <link rel="stylesheet" type="text/css" href="../css/log_reg_window.css"/>
    </head>
    <body id="list-Page-Body">
        <div class="header">
        <div class="main-logo">Stock</div>    
        <nav>
            <ul class="horizontal-list nav-list">
                <li class="nav-item active" id="nav-item-1">
                    <a href="dataPage.jsp" class="nav-link-sec">行情</a>
                    <div class="subnav" id="subnav-1">
                        <div class="subnav-inset">
                            <ul class="subnav-list">
                                <li class="active"><a href="dataPage.jsp" class="nav-link-subsec">实时行情</a></li>
                                <li><a href="http://finance.sina.com.cn/data/" target="_blank" class="nav-link-subsec">新浪股票系统</a></li>
                                
                            </ul>
                            
                        </div>
                    </div>
                </li>
                <li class="nav-item active" id="nav-item-2">
                    <a href="newsPage.jsp" class="nav-link-sec">新闻</a>
                    <div class="subnav" id="subnav-2">
                        <div class="subnav-inset">
                            <ul class="subnav-list">
                                <li class="active"><a href="newsPage.jsp" class="nav-link-subsec">今日头条</a></li>
                                <li><a href="newsPage.jsp" class="nav-link-subsec">实时新闻</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item active" id="nav-item-3">
                    <a href="commentaryPage.jsp" class="nav-link-sec">专栏</a>
                    <div class="subnav" id="subnav-3">
                        <div class="subnav-inset">
                            <ul class="subnav-list">
                                <li class="active"><a href="commentaryPage.jsp" class="nav-link-subsec">全部文章</a></li>
                                <li><a href="commentaryPage.jsp" class="nav-link-subsec">指数分析</a></li>
                                <li><a href="commentaryPage.jsp" class="nav-link-subsec">个股分析</a></li>
                            </ul>
                            <ul class="subnav-list">
                                <li><a href="writerPage.jsp" class="nav-link-subsec">撰稿人</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item active" id="nav-item-4">
                    <a href="listPage.jsp" class="nav-link-sec">当月主题</a>
                    <div class="subnav" id="subnav-4">
                        <div class="subnav-inset">
                            <ul class="subnav-list">
                                <li class="active"><a href="listPage.jsp" class="nav-link-subsec">主题文章</a></li>
                                <li><a href="themePage.jsp" class="nav-link-subsec">往期回顾</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="nav-item active" id="nav-item-5">
                    <a onclick="login()" class="nav-link-sec">登录</a>
                    <div class="subnav" id="subnav-5">
                        <div class="subnav-inset">
                            <ul class="subnav-list">
                                <li class="active"><a onclick="login()" class="nav-link-subsec">登录</a></li>
                                <li><a onclick="register()" class="nav-link-subsec">注册</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </nav>
        </div>
        
        <div class="log_reg_windows" id="log_reg_windows" style="visibility: hidden;">
        	<div class="log" id="log_block">
        		<form name="form_log" id="form_log">
        			<label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label><input type="email" name="email" id="log_email"><span id="log_message1"></span><br/>
        			<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label><input type="password" name="password"><span id="log_message2"></span><br/>
        			<div class="head-save-button"><input type="button" name="submit1" value="登录" onclick="toLogin()"/></div>
	            	<div class="head-cancel-button"><input type="button" name="submit2" value="取消" onclick="noLoginRegister()"/></div>
        		</form>
        			<a href="#" onclick="register()">注册</a><a href="">忘记密码？</a>
        	</div>
        	<div class="reg" id="reg_block">
        		<form name="form_reg" id="form_reg">
        			<label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label><input type="email" name="email" id="reg_email"><span id="reg_message1"></span><br/>
        			<label>用&nbsp;&nbsp;户&nbsp;&nbsp;名</label><input type="text" name="username"><span id="reg_message2">用户名可包含数字、字母和下划线</span><br/>
        			<label>设置密码</label><input type="password" name="password" id="password1"><span id="reg_message3">密码为6~18位的数字或字母</span><br/>
        			<label>确认密码</label><input type="password" id="password2"><span id="reg_message4"></span><br/>
        			<input type="hidden" value="" name="bio"/>
        			<input type="hidden" value="" name="headimage"/>
        			<input type="hidden" value="" name=""/>
        			<div class="head-save-button"><input type="button" name="submit1" value="注册" onclick="toRegister()"/></div>
	            	<div class="head-cancel-button"><input type="button" name="submit2" value="取消" onclick="noLoginRegister()"/></div>
        		</form>
        		<span id="register_message"></span>
        	</div>
        </div>
        
        
    </body>
    <script>
    	function toLogin(){
    		alert("3");
    		var email = /^[_".0-9a-z-]+@([0-9a-z][0-9a-z-]+".){1,4}[a-z]{2,3}$/i;
    		
    		 if(!email.test(${'log_email'}.value))
    		{
    			 ${'log_message1'}.innerHTML="邮箱格式错误";
    		}else {
    			$.ajax({
                    cache: true,
                    type: "POST",
                    url:'login/validate',
                    data:${'form_log'}.serialize(),// 你的formid
                    async: false,
                    error: function(request) {
                        alert("无法连接服务器！");
                    },
                    success: function(data) {
                    	if(data.result=="true"){
                        	window.navigate("mainPage.jsp");
                        }
   	                	else{
   	                		alert("无法登陆：未知错误！");
   	                	}
                    }
                });
    		}
    	}
    	function toRegister(){
    		alert("123");
    		document.getElementById('reg_message1').innerHTML="";
    		${'reg_message4'}.innerHTML="";
    		var email = /^[_".0-9a-z-]+@([0-9a-z][0-9a-z-]+".){1,4}[a-z]{2,3}$/i;
    		var password = /^(?![^a-zA-Z]+$)(?!\D+$)/;
    		
   		 	if(!email.test(${'reg_email'}.value)){
   			 	${'reg_message1'}.innerHTML="邮箱格式错误";
   			}
   		 	else if(!password.test(${'password1'}.value)){
   				${'reg_message3'}.style.color = "red";
   			}
   			else if(${'password1'}.value!=${'password2'}.value){
   			 	alert("123");
   				${'reg_message4'}.innerHTML="两次密码不相同";   				
   			}
   			else{
   				$.ajax({
   	                cache: true,
   	                type: "POST",
   	                url:'login/register',
   	                data:${'form_reg'}.serialize(),// 你的formid
   	                async: false,
   	                error: function(request) {
   	                    alert("无法连接服务器！");
   	                },
   	                success: function(data) {
   	                	if(data.result=="true"){
                        	window.navigate("mainPage.jsp");
                        }
   	                	else{
   	                		alert("无法注册：未知错误！");
   	                	}
   	                }
   	            });
   			}
    	}
    	function login(){
    		document.getElementById("log_reg_windows").style.visibility="visible";
    		document.getElementById("log_block").style.visibility="visible";
    		document.getElementById("reg_block").style.visibility="hidden";
    	}
    	function register(){
    		document.getElementById("log_reg_windows").style.visibility="visible";
    		document.getElementById("reg_block").style.visibility="visible";
    		document.getElementById("log_block").style.visibility="hidden";
    	}
    	function noLoginRegister(){
    		document.getElementById("log_reg_windows").style.visibility="hidden";
    		document.getElementById("reg_block").style.visibility="hidden";
    		document.getElementById("log_block").style.visibility="hidden";
    	}
    </script>
</html>