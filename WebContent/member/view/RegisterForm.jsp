<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>CDB :: 회원가입</title>
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
    <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
    </script>
    
</head>
<body>
	<h1 class="text-warning">CDB</h1>
    <!-- div 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="div1" style="height: auto; width: 100%; border:1px solid black;"></div>
    <div id="wrap">
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 RegisterPro.jsp -->
        <form method="post" action="../pro/RegisterPro.jsp" name="userInfo" onsubmit="return checkValue()">
            <center>
            <table>
                <tr>
                    <td id="title" style="font-weight:bold;">아이디</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
                        <input type="button" class="btn btn-warning btn-sm" disabled value="중복확인" >    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title" style="font-weight:bold;">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title" style="font-weight:bold;">비밀번호 확인</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title" style="font-weight:bold;">이름</td>
                    <td>
                        <input type="text" name="name" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title" style="font-weight:bold;">생일</td>
                    <td>
                        <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" >
                        <select name="birthmm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                        <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title" style="font-weight:bold;">휴대전화 </td>
                    <td>
                        <input type="text" name="phone" />
                    </td>
                </tr>
                <tr>
                    <td id="title" style="font-weight:bold;">지역</td>
                    <td>
                        <select name="address">
                        	<option value = "">도시 선택</option>
                        	<option>서울</option>
                        	<option>인천</option>
                        	<option>대구</option>
                        	<option>부산</option>
                        	<option>울산</option>
                        	<option>광주</option>
                        	<option>대전</option>
                        	<option>제주</option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td id="title" style="font-weight:bold;">성별</td>
                    <td>
                        <input type="radio" name="sex" value="남" checked>남
                        <input type="radio" name="sex" value="여" checked>여
                    </td>
                </tr>
                    
            </table>
            <br>
            <input type="submit" class="btn btn-danger btn" style="width:80pt" value="가입"/>  
            <input type="button" class="btn btn-danger btn" style="width:80pt"value="취소"
            onclick = "location.href= '../../Main.jsp'">
        	</center>
        </form>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="../../js/bootstrap.js"></script>
</body>
</html>