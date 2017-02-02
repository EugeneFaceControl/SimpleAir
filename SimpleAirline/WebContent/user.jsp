<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css" href="css/jquery-ui.css" rel="stylesheet" />
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<title>Add new client</title>
</head>
<body>
	<header class="header">
	<img src="images/logo.png">
	<a href="ClientsServlet?action=listUser" class="AllClients">All clients</a>
	</header>
	<script>
		$(function() {
			$('input[name=orderDate]').datepicker();
		});
	</script>
	<script>
		$(function() {
			$('input[name=departureDate]').datepicker();
		});
	</script>
	<form method="POST" action='ClientsServlet' name="frmAddClient">
		<table>
			<tr>
				<td>Client ID :</td>
				<td><input type="text" readonly="readonly" name="clientId"
					value="<c:out value="${client.clientId}" />" /> <br /></td>
			</tr>
			<tr>
				<td>First Name :</td>
				<td><input type="text" name="firstName"
					value="<c:out value="${client.firstName}" />" /> <br /></td>
			</tr>
			<tr>
				<td>Last Name :</td>
				<td><input type="text" name="lastName"
					value="<c:out value="${client.lastName}" />" /> <br /></td>
			</tr>
			<tr>
				<td>Order date :</td>
				<td><input type="text" name="orderDate"
					value="<fmt:formatDate pattern="dd/MM/yyyy" value="${client.orderDate}" />" />
					<br /></td>
			</tr>
			<tr>
				<td>Departure date :</td>
				<td><input type="text" name="departureDate"
					value="<fmt:formatDate pattern="dd/MM/yyyy" value="${client.departureDate}" />" />
					<br /></td>
			</tr>
			<tr>
				<td>Mobile phone:</td>
				<td><input type="text" name="mobPhone"
					value="<c:out value="${client.mobPhone}" />" /> <br /></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><input type="text" name="address"
					value="<c:out value="${client.address}" />" /> <br /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email"
					value="<c:out value="${client.email}" />" /> <br /></td>
			</tr>
			<tr>
				<td>Series:</td>
				<td><input type="text" name="series"
					value="<c:out value="${client.series}" />" /> <br /></td>
			</tr>
			<tr>
				<td>Number:</td>
				<td><input type="text" name="number"
					value="<c:out value="${client.number}" />" /> <br /></td>
			</tr>
			<!-- <tr>
				<td>Cost:</td>
				<td><input type="text" name="cost"
					value="<c:out value="${client.cost}" />" /> <br /></td>
			</tr> -->
			<!-- <tr>
				<td>Destination:</td>
				<td><select name="destination" size="1">
						<option ${client.destination == '1' ? 'selected' : ''}
							value="Saint Peterburg" required>Saint Peterburg</option>
						<option ${client.destination == '2' ? 'selected' : ''}
							value="London" required>London</option><br/>
				</select></td>
			</tr> -->
			<tr>
				<td>Destination:</td>
				<td><select required name="destination">
						<option value="">Choose destination</option>
						<c:forEach items="${destinations}" var="destination">
							<option value="${destination.destinationName}"><c:out
									value="${destination.destinationName}" /></option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>Age:</td>
				<td><select name="age">
						<option value="">Choose age</option>
						<option value="Adult" required>Adult</option>
						<option value="Child" required>Child</option>
						<option value="Infant" required>Infant</option>
				</select></td>
			</tr>
			<!-- <tr>
				<td>Destination:</td>
				<td><input type="text" name="destination"
					value="<c:out value="${client.destination}" />" /> <br /></td>
			</tr> -->
		</table>

		<input type="submit" value="Submit" />
	</form>
</body>
</html>