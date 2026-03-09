<%@ page session="true" %>
<%@ page import="com.vcube.Dto.Employee" %>
<%
    // Redirect to login if no session
    Employee emp = (Employee) session.getAttribute("employee");
    if (emp == null) {
        response.sendRedirect("emplogin.jsp");
        return;
    }

    // Get session message if any
    String msg = (String) session.getAttribute("msg");
    if (msg != null) {
        session.removeAttribute("msg"); // clear after displaying
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar can be included here -->
    <%@ include file="employeeNavbar.jsp" %>

    <div class="container mt-5">
        <h2>Update Profile</h2>

        <% if (msg != null) { %>
            <div class="alert alert-info alert-dismissible fade show" role="alert">
                <%= msg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <form action="UpdateEmployeeServlet" method="post">
            <!-- Hidden field for employee ID -->
            <input type="hidden" name="id" value="<%= emp.getId() %>">

            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input type="text" name="fname" class="form-control" value="<%= emp.getFname() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Last Name</label>
                <input type="text" name="lname" class="form-control" value="<%= emp.getLname() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" value="<%= emp.getEmail() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="text" name="phno" class="form-control" value="<%= emp.getPhno() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Department</label>
                <input type="text" name="department" class="form-control" value="<%= emp.getDepartment() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Salary</label>
                <input type="number" step="0.01" name="salary" class="form-control" value="<%= emp.getSalary() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" value="<%= emp.getUsername() %>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Leave blank to keep current password">
            </div>

            <button type="submit" class="btn btn-primary">Update Profile</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>