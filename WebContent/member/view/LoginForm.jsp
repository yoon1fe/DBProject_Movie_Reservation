<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="EUC-KR">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>CDB :: �α���</title>
      <link rel="stylesheet" href="../../css/bootstrap.css">
      <style type="text/css">
        body{
            background-color: #e6dfc0;
        }
        h1{
           text-shadow:-1px 0 red, 0 1px red, 1px 0 red, 0 -1px red;
        }
        #div1{
            background-color: #dc3232;
            padding: 10px;
        }
    </style>
   </head>
   
   <body>
   <h1 class="text-warning">CDB</h1>
   <div id="div1" style="height: auto; width: 100%; border:1px solid black;"></div>
      <b><font size="6" color="gray">�α���</font></b><br><br>
      <form method="post" action="../pro/LoginPro.jsp">
      <font style="position:relative;left:350px;top:32px;font-weight:bold;font-size:20px;">�� �� ��</font>
      <center>
         <input type="text" style = "width:250px; height:40px;" name="input_id"/>
      </center>
      <font style="position:relative;left:350px;top:32px;font-weight:bold;font-size:20px;">��й�ȣ</font>      
      <center>
         <input type="password" style = "width:250px; height:40px;" name="input_pw"/><br><br>         
         <input type = "submit" class="btn btn-danger btn" style = "width:100pt" value="�α���"/><br>
         <font style="position:relative;right:180px;top:30px;font-weight:;">*Ȥ�� ������ �����Ű���?</font>
      </center>
      <center>
         <a href = "RegisterForm.jsp" class="btn btn-warning btn" style = "width:100pt">ȸ������</a>
      </center>
      </form>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <script type="text/javascript" src="../../js/bootstrap.js"></script>
   </body>
</html>