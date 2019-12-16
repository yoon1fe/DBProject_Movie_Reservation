<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>CDB :: ȸ������</title>
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
    
        // �ʼ� �Է������� ���̵�, ��й�ȣ�� �ԷµǾ����� Ȯ���ϴ� �Լ�
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("���̵� �Է��ϼ���.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
            
            // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
                return false;
            }
        }
    </script>
    
</head>
<body>
	<h1 class="text-warning">CDB</h1>
    <!-- div ����, ������ �ٱ������� auto�� �ָ� �߾����ĵȴ�.  -->
    <div id="div1" style="height: auto; width: 100%; border:1px solid black;"></div>
    <div id="wrap">
        <b><font size="6" color="gray">ȸ������</font></b>
        <br><br>
        
        <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
        <!-- ��(�Ķ����) ������ POST ���, ������ �������� RegisterPro.jsp -->
        <form method="post" action="../pro/RegisterPro.jsp" name="userInfo" onsubmit="return checkValue()">
            <center>
            <table>
                <tr>
                    <td id="title" style="font-weight:bold;">���̵�</td>
                    <td>
                        <input type="text" name="id" maxlength="50">
                        <input type="button" class="btn btn-warning btn-sm" disabled value="�ߺ�Ȯ��" >    
                    </td>
                </tr>
                        
                <tr>
                    <td id="title" style="font-weight:bold;">��й�ȣ</td>
                    <td>
                        <input type="password" name="password" maxlength="50">
                    </td>
                </tr>
                
                <tr>
                    <td id="title" style="font-weight:bold;">��й�ȣ Ȯ��</td>
                    <td>
                        <input type="password" name="passwordcheck" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title" style="font-weight:bold;">�̸�</td>
                    <td>
                        <input type="text" name="name" maxlength="50">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title" style="font-weight:bold;">����</td>
                    <td>
                        <input type="text" name="birthyy" maxlength="4" placeholder="��(4��)" size="6" >
                        <select name="birthmm">
                            <option value="">��</option>
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
                        <input type="text" name="birthdd" maxlength="2" placeholder="��" size="4" >
                    </td>
                </tr>
                    
                <tr>
                    <td id="title" style="font-weight:bold;">�޴���ȭ </td>
                    <td>
                        <input type="text" name="phone" />
                    </td>
                </tr>
                <tr>
                    <td id="title" style="font-weight:bold;">����</td>
                    <td>
                        <select name="address">
                        	<option value = "">���� ����</option>
                        	<option>����</option>
                        	<option>��õ</option>
                        	<option>�뱸</option>
                        	<option>�λ�</option>
                        	<option>���</option>
                        	<option>����</option>
                        	<option>����</option>
                        	<option>����</option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td id="title" style="font-weight:bold;">����</td>
                    <td>
                        <input type="radio" name="sex" value="��" checked>��
                        <input type="radio" name="sex" value="��" checked>��
                    </td>
                </tr>
                    
            </table>
            <br>
            <input type="submit" class="btn btn-danger btn" style="width:80pt" value="����"/>  
            <input type="button" class="btn btn-danger btn" style="width:80pt"value="���"
            onclick = "location.href= '../../Main.jsp'">
        	</center>
        </form>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="../../js/bootstrap.js"></script>
</body>
</html>