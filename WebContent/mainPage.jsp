<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
class ArticleList{
	String theme_title = "当月主题";
	String theme_host = "主持人";
	String theme_summary = "主题简介";
	Article[] list = new Article[15];
	ArticleList(){
		String msg ="";
		String connectString = "jdbc:mysql://localhost:3306/test?characterEncoding=utf8&useSSL=true"; 
		StringBuilder table=new StringBuilder("");
		try{
			  Class.forName("com.mysql.jdbc.Driver");
			  Connection con=DriverManager.getConnection(connectString, "root", "123456");
			  Statement stmt=con.createStatement();
			  
			  ResultSet rs1=stmt.executeQuery("SELECT MAX(themeId)  as maxId FROM theme;");
			  int themeId=0;
			  if(rs1.next()) themeId=rs1.getInt("maxId");
			  
			  ResultSet rs2=stmt.executeQuery("SELECT *  FROM theme WHERE themeId = " + themeId+";");
			  if(rs1.next()) {
				  theme_title=rs2.getString("title");
				  theme_host=rs2.getString("writer");
				  theme_summary=rs2.getString("content");
			  }
			  
			  ResultSet rs3=stmt.executeQuery("SELECT * FROM news WHERE themeId = "+themeId + " LIMIT 0 , 10 order by aid desc;");
			  int i=0;
			  while(rs3.next()) {
				  String summary = rs3.getString("content");
				  int beginIndex=summary.indexOf("<p>");
				  int endIndex=summary.indexOf("</p>");
				  summary=summary.substring(beginIndex+3,endIndex);
				  if(summary.length()>100) summary=summary.substring(0,100);
				  Article a = new Article(rs3.getString("title"), summary, rs3.getString("aid"));
				  System.out.println(rs3.getString("title") + "  " + summary + " " + rs3.getString("aid"));
				  list[i]=a;
				  i++;
			  }
			  
			  ResultSet rs4=stmt.executeQuery("SELECT * FROM commentary WHERE themeId = "+themeId + " LIMIT 0 , 5 order by aid desc;");
			  while(rs4.next()) {
				  String summary = rs4.getString("content");
				  int beginIndex=summary.indexOf("<p>");
				  int endIndex=summary.indexOf("</p>");
				  summary=summary.substring(beginIndex+3,endIndex);
				  if(summary.length()>100) summary=summary.substring(0,100);
				  Article a = new Article(rs4.getString("title"), summary, rs4.getString("aid"));
				  System.out.println(rs4.getString("title") + "  " + summary + " " + rs4.getString("aid"));
				  list[i]=a;
				  i++;
			  }
			  
			  rs1.close();
			  rs2.close();
			  rs3.close();
			  rs4.close();
			  stmt.close();
			  con.close();
			}
			catch (Exception e){
			  System.out.println(e);
			  msg = e.getMessage();
			}
	}
	class Article{
		String articleTitle;
		String articleSummary;
		String articleId;
		Article(String articleTitle, String articleSummary, String articleId) {
		    this.articleTitle = articleTitle;
		    this.articleSummary = articleSummary;
		    this.articleId = articleId;
		}
	}
}
String[] pictureURL={"pic1.jpg","pic2.png","pic3.jpg","pic4.jpg","pic5.jpg","pic6.gif","pic7.jpg","pic8.jpg","pic9.png"};
String picturePath="picture/";
String backgroundImage="picture/mainPic.jpg";
String adbackground="picture/adver.jpeg";

ArticleList articleList = new ArticleList();
%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Stock.com</title>
        <link rel="stylesheet" type="text/css" href="css/main_header.css"/>
        <link rel="stylesheet" type="text/css" href="css/main_content.css"/>
        <link rel="stylesheet" type="text/css" href="css/main_footer.css"/>
        <link rel="stylesheet" type="text/css" href="css/log_reg_window.css"/>
    </head>
    
    <body>
    	<jsp:include page="header/Header.jsp"/>
    	
        
        <!--        正文部分-->
        <div class="main-content">
            <!--        图表-->
            <div class="main-stock-data">
                GRAPH
            </div>

            <!--        主体-->
            <div class="main-left">
                <!--        新闻头条-->
                <div class="main-top-news">
                    <h1>今日头条</h1>
                    <%for(int i=0;i<articleList.list.length&&i<5;i++){ %>
                    		<div class="sub-news">
                        		<div class="sub-news-picture"><img src=<% out.print(picturePath+pictureURL[i%pictureURL.length]); %> width="110px" height="80px;"></div>
                        		<div class="sub-news-content">
                            		<div><a><%out.print(articleList.list[i].articleTitle); %></a></div>
                            		<div><%out.print(articleList.list[i].articleSummary); %></div>
                        		</div>
                    		</div>
                    <%} %>
                    <div class="more-content"><a href="newsPage.jsp">更多 ></a></div>
                </div>
                <!--        实时新闻-->
                <div class="main-latest-news">
                    <h1>实时新闻</h1>
                    <%for(int i=5;i<articleList.list.length&&i<10;i++){ %>
                    		<div class="sub-news">
                        		<div class="sub-news-picture"><img src=<% out.print(picturePath+pictureURL[(i+1)%pictureURL.length]); %> width="110px" height="80px;"></div>
                        		<div class="sub-news-content">
                            		<div><a><%out.print(articleList.list[i].articleTitle); %></a></div>
                            		<div><%out.print(articleList.list[i].articleSummary); %></div>
                            	</div>
                    		</div>
                    <%} %>
                    <div class="more-content"><a href="newsPage.jsp">更多 ></a></div>
                </div>
                <!--        专栏文章-->
                <div class="column">
                    <h1>专栏文章</h1>
                    <%for(int i=0;i<articleList.list.length&&i<5;i++){ %>
                    		<div class="sub-news">
                        		<div class="sub-news-picture"><img src=<% out.print(picturePath+pictureURL[(i+2)%pictureURL.length]); %> width="110px" height="80px;"></div>
                        		<div class="sub-news-content">
                            		<div><a><%out.print(articleList.list[i].articleTitle); %></a></div>
                            		<div><%out.print(articleList.list[i].articleSummary); %></div>
                        		</div>
                    		</div>
                    <%} %>
                    <div class="more-content"><a href="commentaryPage.jsp">更多 ></a></div>
                </div>
            </div>

            <!--侧边栏        -->
            <div class="main-right">
                <!--        当月主题-->
                <div class="main-theme" style="background-image: url(<%= backgroundImage%>)">
                    <div>
                        <h1><a href="listPage.jsp">当月主题</a></h1>
                        <p><%out.print(articleList.theme_title); %></p>
                        <hr/>
                        <p><%out.print(articleList.theme_summary); %></p>
                    </div>
                </div>
                <!--        广告-->
                <div class="advertise" style="background-image: url(<%= adbackground%>)">
                    <h1>广告</h1>
                </div>
                <!--        热门作者-->
                <div class="column-writer">
                    <h1><a href="writerPage.jsp">热门作者</a></h1>
                    <div class="sub-column-writer">
                        <p><img src="picture/writer1.jpg">邓卫平</p>
                        <p><img src="picture/writer2.jpg">刘俊郁</p>
                        <p><img src="picture/writer3.jpg">金晓</p>
                    </div>
                </div>  
            </div>
        </div>
        
        <div class="footer">
            <div>
                <ul>
                    <li>相关功能</li>
                </ul>
                <ul>
                    <li>新闻订阅</li>
                    <li>市场分析</li>
                    <li>股评追踪</li>
                </ul>
            </div>
            <div>
                <ul>
                    <li>责任说明</li>
                </ul>
                <ul>
                    <li>专栏文章不代表本网站立场</li>
                    <li>股市有风险，投资需谨慎</li>
                </ul>
            </div>
            <div>
                <ul>
                    <li>网站设计</li>
                </ul>
                <ul>
                    <li>14348008 陈铭昕</li>
                    <li>14348032 胡彩芹</li>
                </ul>
            </div>
        </div>
    </body>
</html>