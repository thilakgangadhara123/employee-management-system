<%@ page session="true" %>
<%
    com.vcube.Dto.Employee employee = (com.vcube.Dto.Employee) session.getAttribute("employee");
    if(employee == null){
        response.sendRedirect("emplogin.jsp");
        return;
    }
    String firstName = employee.getFname() != null ? employee.getFname() : "";
    String lastName = employee.getLname() != null ? employee.getLname() : "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f0f4f8;
            min-height: 100vh;
        }

        .profile-container {
            max-width: 1000px;
            margin: 50px auto;
            display: flex;
            flex-wrap: wrap;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
            overflow: hidden;
        }

        /* Sidebar */
        .profile-sidebar {
            flex: 1 1 280px;
            background: linear-gradient(135deg, #4e73df, #1cc88a);
            color: #fff;
            text-align: center;
            padding: 50px 20px;
        }

        .profile-sidebar .avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: rgba(255,255,255,0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            font-weight: 700;
            margin: 0 auto 15px auto;
            color: #fff;
        }

        .profile-sidebar h2 {
            font-weight: 600;
            margin-bottom: 5px;
        }

        .profile-sidebar p {
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 5px;
        }

        /* Main content */
        .profile-main {
            flex: 2 1 700px;
            padding: 40px;
        }

        .nav-tabs .nav-link {
            border: none;
            font-weight: 500;
            color: #555;
            border-radius: 8px 8px 0 0;
        }

        .nav-tabs .nav-link.active {
            color: #fff;
            background: #1cc88a;
        }

        .tab-content {
            padding-top: 20px;
        }

        .info-row {
            display: flex;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }

        .info-row i {
            width: 35px;
            font-size: 18px;
            color: #1cc88a;
        }

        .info-value {
            font-weight: 500;
            color: #333;
        }

        /* Form fields */
        .position-relative {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #1cc88a;
            font-size: 16px;
        }

        .form-control.ps-5 {
            padding-left: 45px !important;
            border-radius: 10px;
        }

        .btn-update {
            background: linear-gradient(135deg, #1cc88a, #138155);
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-weight: 500;
            width: 100%;
            margin-top: 15px;
            transition: 0.3s;
        }

        .btn-update:hover {
            background: linear-gradient(135deg, #138155, #0f6c4c);
        }

        .alert {
            border-radius: 10px;
            margin-bottom: 15px;
            padding: 10px 15px;
        }

        @media(max-width:768px) {
            .profile-container { flex-direction: column; }
            .profile-sidebar, .profile-main { flex: 1 1 100%; }
        }
    </style>
</head>
<body>

<%@ include file="employeeNavbar.jsp" %>

<div class="profile-container">

    <!-- Sidebar -->
    <div class="profile-sidebar">
        <div class="avatar"><%= firstName.isEmpty() ? "E" : firstName.substring(0,1).toUpperCase() %></div>
        <h2><%= firstName %> <%= lastName %></h2>
        <p>Department: <%= employee.getDepartment() %></p>
        <p><i class="fa-solid fa-indian-rupee-sign"> </i><%= employee.getSalary() %></p>
    </div>

    <!-- Main Content -->
    <div class="profile-main">
        <ul class="nav nav-tabs" id="profileTab" role="tablist">
            <li class="nav-item">
                <button class="nav-link active" id="view-tab" data-bs-toggle="tab" data-bs-target="#view" type="button">View Profile</button>
            </li>
            <li class="nav-item">
                <button class="nav-link" id="edit-tab" data-bs-toggle="tab" data-bs-target="#edit" type="button">Edit Profile</button>
            </li>
        </ul>

        <div class="tab-content">
            <!-- View Profile -->
            <div class="tab-pane fade show active" id="view">
                <div class="info-row"><i class="fa-solid fa-envelope"></i> <span class="info-value"><%= employee.getEmail() %></span></div>
                <div class="info-row"><i class="fa-solid fa-phone"></i> <span class="info-value"><%= employee.getPhno() %></span></div>
                <div class="info-row"><i class="fa-solid fa-user"></i> <span class="info-value"><%= employee.getUsername() %></span></div>
            </div>

            <!-- Edit Profile -->
            <div class="tab-pane fade" id="edit">
                <% String message = (String) session.getAttribute("message"); 
                   String msgType = (String) session.getAttribute("msgType");
                   session.removeAttribute("message");
                   session.removeAttribute("msgType");
                   if(message != null){ %>
                       <div class="alert alert-<%= msgType %>"><%= message %></div>
                <% } %>

                <form action="UpdateProfileServlet" method="post">
                    <div class="mb-3 position-relative">
                        <span class="input-icon"><i class="fa-solid fa-user"></i></span>
                        <input type="text" name="fname" class="form-control ps-5" placeholder="First Name" value="<%= firstName %>" required>
                    </div>
                    <div class="mb-3 position-relative">
                        <span class="input-icon"><i class="fa-solid fa-user"></i></span>
                        <input type="text" name="lname" class="form-control ps-5" placeholder="Last Name" value="<%= lastName %>" required>
                    </div>
                    <div class="mb-3 position-relative">
                        <span class="input-icon"><i class="fa-solid fa-envelope"></i></span>
                        <input type="email" name="email" class="form-control ps-5" placeholder="Email" value="<%= employee.getEmail() %>" required>
                    </div>
                    <div class="mb-3 position-relative">
                        <span class="input-icon"><i class="fa-solid fa-phone"></i></span>
                        <input type="text" name="phno" class="form-control ps-5" placeholder="Phone Number" value="<%= employee.getPhno() %>" required>
                    </div>
                    <button type="submit" class="btn btn-update"><i class="fa-solid fa-floppy-disk me-2"></i> Update Profile</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>