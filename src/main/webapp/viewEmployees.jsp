<%@ page import="java.util.List"%>
<%@ page import="com.vcube.Dto.Employee"%>

<%
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect(request.getContextPath() + "/adminlogin.jsp");
        return;
    }

    List<Employee> list = (List<Employee>) request.getAttribute("empList");
    int totalEmployees = (list != null) ? list.size() : 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee Management</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* Professional Light Gradient Background */
body {
    background: linear-gradient(135deg, #e2e8f0, #cbd5e1);
    font-family: 'Segoe UI', sans-serif;
    min-height: 100vh;
    color: #1e293b;
}

/* Card Style */
.soft-card {
    background: #f8fafc;
    border-radius: 16px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
    border: 1px solid #cbd5e1;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.soft-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.15);
}

/* Summary Box */
.summary-box {
    background: #ffffff;
    border-radius: 14px;
    padding: 20px;
    text-align: center;
    border: 1px solid #e2e8f0;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.summary-box:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(0,0,0,0.1);
}

/* Table Styling */
.table thead {
    background: #94a3b8; /* soft blue-gray */
    color: #f8fafc;
}
.table tbody tr {
    background: #f1f5f9;
    transition: background 0.3s ease;
}
.table tbody tr:hover {
    background: #e2e8f0;
}

/* Filter Box */
.filter-box {
    background: #f8fafc;
    border-radius: 14px;
    padding: 18px;
    border: 1px solid #cbd5e1;
}

/* Inputs and Buttons */
.form-control, .form-select {
    border-radius: 10px;
    border: 1px solid #94a3b8;
    background: #ffffff;
    color: #1e293b;
}
.form-control::placeholder {
    color: #64748b;
}
.btn-outline-primary {
    border-radius: 10px;
    transition: all 0.3s ease;
}
.btn-outline-primary:hover {
    background: #3b82f6;
    color: #ffffff;
    transform: translateY(-2px);
}
</style>

</head>
<body>

<%@ include file="adminNavbar.jsp" %>

<div class="container mt-5">

    <!-- Summary -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="summary-box">
                <small class="text-muted">Total Employees</small>
                <h3 class="fw-bold"><%= totalEmployees %></h3>
            </div>
        </div>
    </div>

    <!-- Filters -->
    <div class="filter-box mb-4">
        <div class="row g-3">
            <div class="col-md-4">
                <input type="text" id="searchInput"
                       class="form-control"
                       placeholder="Search employee...">
            </div>
            <div class="col-md-4">
                <select id="departmentFilter"
                        class="form-select">
                    <option value="">All Departments</option>
                    <option>HR</option>
                    <option>IT</option>
                    <option>Finance</option>
                    <option>Marketing</option>
                </select>
            </div>
            <div class="col-md-4">
                <button class="btn btn-outline-primary w-100"
                        onclick="resetFilters()">
                    Reset Filters
                </button>
            </div>
        </div>
    </div>

    <!-- Employee Table -->
    <div class="soft-card p-4">
        <div class="table-responsive">
            <table class="table align-middle text-center" id="employeeTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Department</th>
                        <th>Salary</th>
                        <th>Username</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    if (list != null && !list.isEmpty()) {
                        for (Employee e : list) {
                %>
                    <tr>
                        <td><%= e.getId() %></td>
                        <td><%= e.getFname() %></td>
                        <td><%= e.getLname() %></td>
                        <td><%= e.getEmail() %></td>
                        <td><%= e.getPhno() %></td>
                        <td><%= e.getDepartment() %></td>
                        <td>&#8377; <%= e.getSalary() %></td>
                        <td><%= e.getUsername() %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="8" class="text-center text-gray-500">
                            No Employees Found
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- Filtering Script -->
<script>
const searchInput = document.getElementById("searchInput");
const departmentFilter = document.getElementById("departmentFilter");
const rows = document.querySelectorAll("#employeeTable tbody tr");

function filterTable(){
    rows.forEach(row=>{
        let text = row.innerText.toLowerCase();
        let department = row.cells[5].innerText;

        let matchSearch = text.includes(searchInput.value.toLowerCase());
        let matchDept = !departmentFilter.value || department === departmentFilter.value;

        row.style.display = (matchSearch && matchDept) ? "" : "none";
    });
}

searchInput.addEventListener("keyup", filterTable);
departmentFilter.addEventListener("change", filterTable);

function resetFilters(){
    searchInput.value="";
    departmentFilter.value="";
    filterTable();
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>