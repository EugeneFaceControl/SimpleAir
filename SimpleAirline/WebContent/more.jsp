<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<title>Eugenair|Show All clients</title>
</head>
<body>
	<header class="header">
	<img src="images/logo.png">
	<a href="ClientsServlet?action=listUser" class="AllClients">All clients</a>
	</header>
		<table>
			<tr>
				<td>Client ID :</td>
				<td><c:out value="${client.clientId}" /><br /></td>
			</tr>
			<tr>
				<td>First Name :</td>
				<td><c:out value="${client.firstName}" /><br /></td>
			</tr>
			<tr>
				<td>Last Name :</td>
				<td><c:out value="${client.lastName}" /><br /></td>
			</tr>
			<tr>
				<td>Order date :</td>
				<td><fmt:formatDate pattern="dd/MM/yyyy"
						value="${client.orderDate}" /><br /></td>
			</tr>
			<tr>
				<td>Departure date :</td>
				<td><fmt:formatDate pattern="dd/MM/yyyy"
						value="${client.departureDate}" /><br /></td>
			</tr>
			<tr>
				<td>Mobile phone:</td>
				<td><c:out value="${client.mobPhone}" /><br /></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><c:out value="${client.address}" /><br /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><c:out value="${client.email}" /><br /></td>
			</tr>
			<tr>
				<td>Series:</td>
				<td><c:out value="${client.series}" /><br /></td>
			</tr>
			<tr>
				<td>Number:</td>
				<td><c:out value="${client.number}" /><br /></td>
			</tr>
			<tr>
				<td>Cost:</td>
				<td><c:out value="${client.cost}" /><br /></td>
			</tr>
			<tr>
				<td>Destination:</td>
				<td><c:out value="${client.destination}" /><br /></td>
			</tr>
			<tr>
				<td>Age:</td>
				<td><c:out value="${client.age}" /><br /></td>
			</tr>
		</table>

		<p>
			<td><a
				href="ClientsServlet?action=more&clientId=<c:out value="${client.clientId}"/>">Refresh</a></td>
		</p>
		</div>
</body>
</html>