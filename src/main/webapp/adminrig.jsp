<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Registration</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* Background */
body {
    margin: 0;
    min-height: 100vh;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #c3a6ff, #fcb9d6);
}

/* Center container */
.form-wrapper {
    min-height: 85vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Card Design */
.registration-card {
    background: #ffffff;
    padding: 40px 35px;
    border-radius: 20px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    width: 100%;
    max-width: 420px;
}

/* Heading */
.registration-card h2 {
    text-align: center;
    font-weight: 700;
    margin-bottom: 30px;
    color: #6a11cb;
}

/* Input fields */
.form-control {
    border-radius: 10px;
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    transition: 0.3s;
}

.form-control:focus {
    border-color: #6a11cb;
    box-shadow: 0 0 8px rgba(106,17,203,0.3);
}

/* Button */
.btn-submit {
    width: 100%;
    padding: 12px;
    border-radius: 50px;
    border: none;
    font-weight: 600;
    font-size: 1rem;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white;
    transition: 0.3s;
}

.btn-submit:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 18px rgba(0,0,0,0.2);
}

/* Login Link */
.login-link {
    display: block;
    text-align: center;
    margin-top: 18px;
    text-decoration: none;
    font-weight: 500;
    color: #6a11cb;
}

.login-link:hover {
    text-decoration: underline;
}

/* Responsive */
@media (max-width: 576px) {
    .registration-card {
        padding: 30px 20px;
    }
}

</style>
</head>

<body>

<!-- ✅ Top Navbar -->
<%@ include file="adminnav.jsp"%>

<!-- ✅ Centered Form -->
<div class="container form-wrapper">
    <div class="registration-card">

        <h2>Admin Registration</h2>

        <form action="AdminRegisterServlet" method="post">

            <input type="text" 
                   class="form-control" 
                   name="username" 
                   placeholder="Enter Username" 
                   required>

            <input type="password" 
                   class="form-control" 
                   name="password" 
                   placeholder="Enter Password" 
                   required>

            <button type="submit" class="btn-submit">
                Register
            </button>

        </form>

        <a href="adminlogin.jsp" class="login-link">
            Already have an account? Login
        </a>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>