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
		<table border=1>
			<thead>
				<tr>
					<th>Client Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Order Date</th>
					<th>Departure Date</th>
					<th>Mobile Phone</th>
					<th>Address</th>
					<th>Email</th>
					<th>Series</th>
					<th>Number</th>
					<th>Cost</th>
					<th>Destination</th>
					<th>Age</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${clients}" var="client">
					<tr>
						<td><c:out value="${client.clientId}" /></td>
						<td><c:out value="${client.firstName}" /></td>
						<td><c:out value="${client.lastName}" /></td>
						<td><fmt:formatDate pattern="dd/MM/yyyy"
								value="${client.orderDate}" /></td>
						<td><fmt:formatDate pattern="dd/MM/yyyy"
								value="${client.departureDate}" /></td>
						<td><c:out value="${client.mobPhone}" /></td>
						<td><c:out value="${client.address}" /></td>
						<td><c:out value="${client.email}" /></td>
						<td><c:out value="${client.series}" /></td>
						<td><c:out value="${client.number}" /></td>
						<td><c:out value="${client.cost}" /></td>
						<td><c:out value="${client.destination}" /></td>
						<td><c:out value="${client.age}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>