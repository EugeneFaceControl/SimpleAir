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
			
		<table border=1 width="50%" align="left" >
			<thead>
				<tr>
					<th>Client Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<!-- <th>Order Date</th>
					<th>Departure Date</th>
					<th>Mobile Phone</th>
					<th>Address</th>
					<th>Email</th>
					<th>Series</th>
					<th>Number</th>
					<th>Cost</th>
					<th>Destination</th> -->
					<th colspan=3>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${clients}" var="client">
					<tr>
						<td><c:out value="${client.clientId}" /></td>
						<td><c:out value="${client.firstName}" /></td>
						<td><c:out value="${client.lastName}" /></td>
						<!-- <td><fmt:formatDate pattern="dd/MM/yyyy"
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
						<td><c:out value="${client.age}" /></td> -->
						<td><a
							href="ClientsServlet?action=edit&clientId=<c:out value="${client.clientId}"/>"
							class="AllClients">Update</a></td>
						<td><a
							href="ClientsServlet?action=delete&clientId=<c:out value="${client.clientId}"/>"
							class="AllClients">Delete</a></td>
						<td><a
							href="ClientsServlet?action=more&clientId=<c:out value="${client.clientId}"/>"
							class="AllClients">More</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<table border=1 width="40%" align="center">
			<thead>
				<tr>
					<th>Destination Id</th>
					<th>Destination name</th>
					<th>Cost</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${destinations}" var="destination">
					<tr>
						<td><c:out value="${destination.destinationId}" /></td>
						<td><c:out value="${destination.destinationName}" /></td>
						<td><c:out value="${destination.cost}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	<br>
		<p>
		
			<a href="ClientsServlet?action=insert" class="AllClients">Add client</a>
			
		</p>
		<p>
			<a href="ClientsServlet?action=agePage&age=Adult" class="AllClients">Adults</a>
		</p>
		<p>
			<a href="ClientsServlet?action=agePage&age=Child" class="AllClients">Children</a>
		</p>
		<p>
			<a href="ClientsServlet?action=agePage&age=Infant" class="AllClients">Infant</a>
		</p>
		
		
		<p>
			<a href="index.jsp" class="AllClients">Refresh</a>
		</p>
	</div>
</body>
</html>