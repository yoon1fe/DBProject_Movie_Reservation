<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "jsp.member.model.*" import = "java.io.*"%>
<%@ page import="java.io.*" %> 

<!DOCTYPE html>
<html>
   <head>
      <meta charset="EUC-KR">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Welcome to CDB !</title>
      <link rel="stylesheet" href="css/bootstrap.css">
      <style type="text/css">
           body{
               background-color: #e6dfc0;
           }
           h1{
              text-shadow:-1px 0 red, 0 1px red, 1px 0 red, 0 -1px red;
           }
           #div1{
              position:relative;
               background-color: #dc3232;
               padding: 10px;
               top:8px;
           }
           #div2{
              position:relative;
              top:15px;
           }
       </style>
   </head>
   <body>
      <div style="float:left;">
      <h1 class="text-warning">CDB</h1>
      </div>
      
      <div id="div2" style="float:right;">
      <%

         if((String)session.getAttribute("cid") == null){      //로그인 하기 전
            %>
            <a href = "member/view/LoginForm.jsp" class="btn btn-danger btn-sm" style = "width:70pt">로그인</a>
            <a href = "member/view/RegisterForm.jsp" class="btn btn-danger btn-sm" style = "width:70pt">회원가입</a>
            <%
         }
      
         else{                                    //로그인 됨
            %>
            <a href = "member/pro/Logout.jsp" class="btn btn-danger btn-sm" style = "width:70pt">로그아웃</a>
            <a href = "member/view/Mypage.jsp" class="btn btn-danger btn-sm" style = "width:70pt">마이페이지</a>
            <%
         }
         %>
      
      
      </div><br><br>
      
      <div id="div1" style="height: auto; width: 100%; border:1px solid black;"></div>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <script type="text/javascript" src="js/bootstrap.js"></script>      
      
    <br>
    <br>
    <br> 
    <br>
    <div><center>
    <script type="text/javascript">
    
    function newWindow1(){
    	window.open("member/view/MovieInfo1.jsp", "new", "width=300, height=620, left=30, top=30, resizable=no, scrollbars=yes, titlebar=no, fullscreen=no");
    }
    function newWindow2(){
    	window.open("member/view/MovieInfo2.jsp", "MsgWindow", "width=300, height=620, left=30, top=30, resizable=no, scrollbars=yes, titlebar=no, fullscreen=no");
    }
    function newWindow3(){
    	window.open("member/view/MovieInfo3.jsp", "MsgWindow", "width=300, height=620, left=30, top=30, resizable=no, scrollbars=yes, titlebar=no, fullscreen=no");
    }
    
    </script>
    <img src ="ImageServlet?req=0" width="200" onClick="newWindow1()"; style="cursor:pointer"/>  
    <img src ="ImageServlet?req=1" width="200" onClick="newWindow2()"; style="cursor:pointer"/>  
    <img src ="ImageServlet?req=2" width="200" onClick="newWindow3()"; style="cursor:pointer"/> </pre>
    
    
    </center>
    </div>
    
   </br>
   </body>
</html>