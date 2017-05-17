<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String name="MCC";
String role="编辑";
String email="mcc@sysu.edu.cn";
String password="123456";
String resume="haven't give anything";
String returnMessage="";
String headURL="picture/head.jpg";
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>个人信息.Stock.com</title>
        <link rel="stylesheet" type="text/css" href="css/main_header.css"/>
        <link rel="stylesheet" type="text/css" href="css/infoPage.css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css"/> 
        <link rel="stylesheet" type="text/css" href="css/log_reg_window.css"/>
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script> 
        <script type="text/javascript" src="js/cropbox.js"></script>
           
    </head>
    
    <body onload="begin()">
        <jsp:include page="header/HeaderForUser.jsp"/>
        
        <!--        正文部分-->
        <div class="desk">
        <form action="infoPageToSelf.jsp?user=nobody" method="post">
            <div class="headPic">
                <div class="container">
                    <div class="imageBox">
                      <div class="thumbBox"></div>
                      <div class="spinner" style="display: none">Loading...</div>
                    </div>
                    <div class="action"> 
                      <div class="new-contentarea tc"> 
                        <a href="javascript:void(0)" class="upload-img"><label for="upload-file">上传图像</label></a>
                        <input type="file" class="" name="upload-file" id="upload-file" />
                      </div>
                      <input type="button" id="btnCrop"  class="Btnsty_peyton" value="裁切">
                      <input type="button" id="btnZoomIn" class="Btnsty_peyton" value="+"  >
                      <input type="button" id="btnZoomOut" class="Btnsty_peyton" value="-" >
                    </div>
                    <div class="cropped">
                    	<img src=<%= headURL %> align="absmiddle" style="width:64px;height:64px;margin-top:4px;border-radius:100%;box-shadow:0px 0px 12px #7E7E7E;">
                    	<p>64px*64px</p>
                    	<img src=<%= headURL %> align="absmiddle" style="width:128px;height:128px;margin-top:4px;border-radius:100%;box-shadow:0px 0px 12px #7E7E7E;">
                    	<p>128px*128px</p>
                    	<img src=<%= headURL %> align="absmiddle" style="width:180px;height:180px;margin-top:4px;border-radius:100%;box-shadow:0px 0px 12px #7E7E7E;">
                    	<p>180px*180px</p>
                    </div>
                </div>
            </div>
            
	        <div class="information">
		    	<div id="errorAlert"><%= returnMessage %></div>
		        <label>昵称</label><input type="text" name="name" id="name" value=<%= name %>><br/>
		        <label>权限</label><input type="text" name="role" id="role" value=<%= role %>><br/>
		        <label>邮箱</label><input type="email" name="email" id="email" value=<%= email %>><br/>
		        <label>密码</label><input type="password" name="password" id="password" value=<%= password %>><br/>
		        <label>简介</label><textarea type="text" name="resume" id="resume"><%= resume %></textarea><br/>
	            <div class="save-button"><input type="submit" name="submit1" value="保存修改"/></div>
	            <div class="cancel-button"><input type="submit" name="submit2" value="取消修改"/></div>
	    	</div>
        </form>
        </div>
        <script type="text/javascript">
            $(window).load(function() {
                var options =
                {
                    thumbBox: '.thumbBox',
                    spinner: '.spinner',
                    imgSrc: 'picture/head.jpg'
                }
                var cropper = $('.imageBox').cropbox(options);
                $('#upload-file').on('change', function(){
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        options.imgSrc = e.target.result;
                        cropper = $('.imageBox').cropbox(options);
                    }
                    reader.readAsDataURL(this.files[0]);
                    this.files = [];
                })
                $('#btnCrop').on('click', function(){
                    var img = cropper.getDataURL();
                    $('.cropped').html('');
                    $('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:64px;margin-top:4px;border-radius:64px;box-shadow:0px 0px 12px #7E7E7E;" ><p>64px*64px</p>');
                    $('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:128px;margin-top:4px;border-radius:128px;box-shadow:0px 0px 12px #7E7E7E;"><p>128px*128px</p>');
                    $('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>');
                })
                $('#btnZoomIn').on('click', function(){
                    cropper.zoomIn();
                })
                $('#btnZoomOut').on('click', function(){
                    cropper.zoomOut();
                })
            });
        </script>
    </body>
</html>