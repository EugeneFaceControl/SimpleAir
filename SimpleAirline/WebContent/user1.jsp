<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css"
    href="css/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<title>Add new user</title>
</head>
<body>
    <script>
        $(function() {
            $('input[name=dob]').datepicker();
        });
    </script>

    <form method="POST" action='ClientServlet' name="frmAddUser">
    	<table>
    		<tr>
    			<td>User ID : </td>
    			<td>
    				<input type="text" readonly="readonly" name="userid" value="<c:out value="${user.userid}" />" /> <br />
    			</td>
    		</tr>
    		<tr>
    			<td>First Name : </td>
    			<td>
    				<input type="text" name="firstName" value="<c:out value="${user.firstName}" />" /> <br /> 
    			</td>
    		</tr>
    		<tr>
    			<td>Last Name : </td>
    			<td>
    				<input type="text" name="lastName" value="<c:out value="${user.lastName}" />" /> <br /> 
            	</td>
    		</tr>
    		<tr>
    			<td>DOB : </td>
    			<td>
    				<input type="text" name="dob" value="<fmt:formatDate pattern="MM/dd/yyyy" value="${user.dob}" />" /> <br /> 
    			</td>
    		</tr>
    		<tr>
    			<td>Email : </td>
    			<td>
    				<input type="text" name="email" value="<c:out value="${user.email}" />" /> <br />
    			</td>
    		</tr>
    	</table>		 
        
        <input type="submit" value="Submit" />
    </form>
</body>
</html>