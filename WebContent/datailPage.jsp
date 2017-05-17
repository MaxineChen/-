<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
class Article{
	String articleTitle;
	String articleContent;
	String articleWriter;
	Comment[] commentList=new Comment[3];
	Article(String type, String aid) {
	    String msg ="";
		String connectString = "jdbc:mysql://localhost:3306/test?characterEncoding=utf8&useSSL=true"; 
		StringBuilder table=new StringBuilder("");
	    try{
			  Class.forName("com.mysql.jdbc.Driver");
			  Connection con=DriverManager.getConnection(connectString, "root", "123456");
			  Statement stmt=con.createStatement();
			  ResultSet rs=stmt.executeQuery("SELECT * FROM "+type+" WHERE aid = "+aid);
			  while(rs.next()) {
				  articleContent = rs.getString("content");
				  articleWriter=rs.getString("writer");
				  articleTitle=rs.getString("title");
			  }
			  rs.close();
			  stmt.close();
			  con.close();
		}
		catch (Exception e){
			  System.out.println(e);
			  msg = e.getMessage();
		}
	    commentList[0]=new Comment("user123","+10086","2017-04-07",13);
	    commentList[1]=new Comment("小鸿","有道理。","2017-04-01",3);
	    commentList[2]=new Comment("每天爱学习的凉凉","赞同","2017-03-20",53);
	}
	
	class Comment{
		String user;
		String words;
		String time;
		int kudo;
		Comment(String u, String w, String t, int k){
			user=u; words=w; time=t; kudo=k;
		}
	}
}
String backgroundImage="picture/mainPic.jpg";

String type=request.getParameter("type");
String aid=request.getParameter("aid");
Article article=new Article(type, aid);
%>
<html>
    <head>
        <title><%out.write(article.articleTitle); %>Stock.com</title>
        <link rel="stylesheet" type="text/css" href="css/main_header.css"/>
        <link rel="stylesheet" type="text/css" href="css/log_reg_window.css"/>
        <link rel="stylesheet" type="text/css" href="css/detailPage.css"/>
    </head>
    
    <body id="list-Page-Body">
        <jsp:include page="header/Header.jsp"/>
        
        <!--        正文部分-->
        <div class="picture" style="background-image:url(<%= backgroundImage%>)">
            <div class="article-title">
                <div class="article-link"><a href="dataPage.jsp">实时行情</a></div>
                <p id="article-title-title"><%out.print(article.articleTitle);%></p>
                <hr width="70%">
                <p id="article-title-writer"><%out.print(article.articleWriter);%></p>
            </div>
        </div>
        
        <div class="article">
        	<p><img src="picture/begin.png"/></p>
        	<div><span class="update"><%out.print("2017.05"); %></span></div>
        	<div><%out.print(article.articleContent);%></div>
        	<br/><br/><br/><br/><br/>
        	
        	
        	<div class=comment>
	        	<h3>评论区</h3>
	        	<form name="form1">
	        		<textarea id="commentTextArea" name="comment-context"></textarea>
	        		<br/>
	        		<input type="button" name="submit1" onclick="Handle(this, 'null');" value="发表评论"/>
		        	<input type="button" name="submit2" onclick="Handle(this, 'null');" value="清除评论"/>
		        </form>
		        <br/><br/>
		        <div class="others-comment">
		        	<%for(int i=0;i<article.commentList.length;i++){ %>
		        		<p><%out.write(article.commentList[i].user); %></p>
		        		<p><%out.write(article.commentList[i].words); %></p>
		        		<p>
		        			<input type="button" name="submit3" onclick="Handle(this, <%out.print(article.commentList[i].user); %>);" value="回复">&nbsp;&nbsp;&nbsp;
		        			<input type="button" name="submit4"  onclick="Handle(this, <%out.print(article.commentList[i].user); %>);" value="点赞<%= article.commentList[i].kudo%>">&nbsp;&nbsp;&nbsp;
		        		</p>
		        		<hr/>
		        	<%} %>
		        </div>
	        </div>
        </div>
    </body>
    <script>
    	function Handle(button, id) {
    		if(button.name=="submit1"){
    			$.ajax({
   	                cache: true,
   	                type: "POST",
   	                url:'register/validate',
   	                data:$('#form1').serialize(),// 你的formid
   	                async: false,
   	                error: function(request) {
   	                    alert("Connection error");
   	                },
   	                success: function(data) {
   	                    if(data.result=="true"){
   	                    	document.getElementById("commentTextArea").innerHTML="";
   	                    }else if(data.error=="email"){
   	                    	alert(data.error.message)
   	                    }
   	                }
   	            });
    		}else if(button.name=="submit2"){
    			document.getElementById("commentTextArea").innerHTML="";
    		}else if(button.name=="submit3"){
    			document.getElementById("commentTextArea").innerHTML="@" + id + "：";
    		}else if(button.name=="submit4"){
    			$.ajax({
   	                cache: true,
   	                type: "POST",
   	                url:'register/validate',
   	                data:$('#form2').serialize(),// 你的formid
   	                async: false,
   	                error: function(request) {
   	                    alert("Connection error");
   	                },
   	                success: function(data) {
   	                    if(data.result=="true"){
   	                    	document.getElementById("commentTextArea").innerHTML="";
   	                    }else if(data.error=="email"){
   	                    	alert(data.error.message)
   	                    }
   	                }
   	            });
    		}
    	}
    </script>
</html>