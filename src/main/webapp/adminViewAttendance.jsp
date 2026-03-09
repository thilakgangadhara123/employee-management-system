<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.vcube.Dto.Attendance" %>

<%
    if(session.getAttribute("adminName") == null){
        response.sendRedirect(request.getContextPath() + "/adminlogin.jsp");
        return;
    }

    List<Attendance> list =
        (List<Attendance>) request.getAttribute("attendanceList");

    int presentCount = 0;
    int absentCount = 0;

    if(list != null){
        for(Attendance a : list){
            if("Present".equalsIgnoreCase(a.getStatus())){
                presentCount++;
            } else {
                absentCount++;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* Professional Soft Background */
body{
    background: linear-gradient(to right, #e0e7ff, #f0f4f8); /* soft blue-gray gradient */
    font-family: 'Segoe UI', sans-serif;
}

/* Glass Card */
.dashboard-card{
    background: rgba(255,255,255,0.95);
    border-radius: 16px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.05);
    border: 1px solid #d1d5db;
}

/* Header */
.page-title{
    font-weight:600;
    color:#1f2937;
}

/* Summary Boxes */
.summary-box{
    background:#f9fafb;
    border-radius:14px;
    padding:20px;
    border:1px solid #d1d5db;
    transition:0.3s ease;
}

.summary-box:hover{
    transform:translateY(-2px);
    box-shadow:0 6px 15px rgba(0,0,0,0.05);
}

.summary-title{
    font-size:14px;
    color:#6b7280;
}

.summary-value{
    font-size:26px;
    font-weight:600;
    color:#111827;
}

/* Table */
.table thead{
    background:#c7d2fe; /* soft light blue */
    color:#1e293b;
}

.table tbody tr:hover{
    background:#e0e7ff; /* soft hover highlight */
}

/* Soft Status Badges */
.badge-present{
    background:#d1fae5;
    color:#065f46;
    padding:6px 16px;
    border-radius:20px;
    font-weight:500;
}

.badge-absent{
    background:#fee2e2;
    color:#991b1b;
    padding:6px 16px;
    border-radius:20px;
    font-weight:500;
}

/* Filter Section */
.filter-box{
    background:#f9fafb;
    border-radius:14px;
    padding:15px;
    border:1px solid #d1d5db;
}
</style>
</head>

<body>

<%@ include file="adminNavbar.jsp" %>

<div class="container mt-5">

    <!-- Summary -->
    <div class="row mb-4">
        <div class="col-md-6">
            <div class="summary-box">
                <div class="summary-title">Total Present</div>
                <div class="summary-value"><%= presentCount %></div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="summary-box">
                <div class="summary-title">Total Absent</div>
                <div class="summary-value"><%= absentCount %></div>
            </div>
        </div>
    </div>

    <!-- Filters -->
    <div class="filter-box mb-4">
        <div class="row g-3">
            <div class="col-md-4">
                <input type="text" id="searchInput"
                       class="form-control"
                       placeholder="Search employee">
            </div>

            <div class="col-md-3">
                <input type="date" id="dateFilter"
                       class="form-control">
            </div>

            <div class="col-md-3">
                <select id="statusFilter"
                        class="form-select">
                    <option value="">All Status</option>
                    <option value="Present">Present</option>
                    <option value="Absent">Absent</option>
                </select>
            </div>

            <div class="col-md-2">
                <button class="btn btn-outline-primary w-100"
                        onclick="resetFilters()">
                    Reset
                </button>
            </div>
        </div>
    </div>

    <!-- Table -->
    <div class="dashboard-card p-4">
        <div class="table-responsive">
            <table class="table align-middle text-center"
                   id="attendanceTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>

                <%
                    if(list != null && !list.isEmpty()){
                        for(Attendance a : list){
                %>
                    <tr>
                        <td><%= a.getId() %></td>
                        <td><%= a.getUsername() %></td>
                        <td><%= a.getAttendDate() %></td>
                        <td>
                            <% if("Present".equalsIgnoreCase(a.getStatus())){ %>
                                <span class="badge-present">Present</span>
                            <% } else { %>
                                <span class="badge-absent">Absent</span>
                            <% } %>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="4"
                            class="text-center text-muted">
                            No Attendance Records Found
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
const dateFilter = document.getElementById("dateFilter");
const statusFilter = document.getElementById("statusFilter");
const rows = document.querySelectorAll("#attendanceTable tbody tr");

function filterTable(){
    rows.forEach(row=>{
        let text = row.innerText.toLowerCase();
        let date = row.cells[2].innerText;
        let status = row.cells[3].innerText.trim();

        let matchSearch = text.includes(searchInput.value.toLowerCase());
        let matchDate = !dateFilter.value || date === dateFilter.value;
        let matchStatus = !statusFilter.value || status === statusFilter.value;

        row.style.display =
            (matchSearch && matchDate && matchStatus) ? "" : "none";
    });
}

searchInput.addEventListener("keyup", filterTable);
dateFilter.addEventListener("change", filterTable);
statusFilter.addEventListener("change", filterTable);

function resetFilters(){
    searchInput.value="";
    dateFilter.value="";
    statusFilter.value="";
    filterTable();
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>