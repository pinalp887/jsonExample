<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
</head>
<body>
	<form id="saveForm">
		<fieldset>
			<table>
				<tr>
					<td><label for="name">name</label></td>
					<td><input type="text" name="name" id="name"
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="email">email</label></td>
					<td><input type="text" name="email" id="email"
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><label for="password">password</label></td>
					<td><input type="password" name="password" id="password"
						class="text ui-widget-content ui-corner-all"></td>
				</tr>
				<tr>
					<td><input type="submit" value="submit" id="postCustomersBtn"></td>
					<td><input type="submit" value="list" id="list"></td>
				</tr>
			</table>
			<div class="col-sm-7" id="postResultDiv"></div>
		</fieldset>
	</form>

	<table id="employeesTable" class="display" border="2px">

	</table>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#saveForm').click(function(event) {
						event.preventDefault();

					});

					$('#postCustomersBtn').click(function() {
						save();
					});
					function save() {
						var formData = {
							name : $('#name').val(),
							email : $('#email').val(),
							password : $('#password').val()
						}
						//	alert(formData);
						$.ajax({
							type : "POST",
							contentType : "application/json",
							url : "/user/save",
							accept : 'text/plain',
							data : JSON.stringify(formData),
							success : function(result) {
								console.log(result);
							},
							error : function(e) {
								alert("Error!")
								console.log("ERROR: ", e);
							}
						});
						reset();
						get();
					}
					function reset() {
						name: $('#name').val("");
						email: $('#email').val("");
						password: $('#password').val("");
					}

					$('#list').click(function() {
						get();
					});
					function get() {
						$.ajax({
							type : "GET",
							contentType : "application/json",
							url : window.location + "/user/list",

							data : 'json',
							//dataType : 'text',
							success : function(result) {
								$.each(result, function(i, item) {
									$('<tr>').html(
											"<td>" + result[i].id + "</td><td>"
													+ result[i].name
													+ "</td></tr>").appendTo(
											'#employeesTable');
								});
							},
							error : function(e) {
								alert("Error!")
								console.log("ERROR: ", e);
							}
						});
					}
				});
	</script>
</body>
</html>