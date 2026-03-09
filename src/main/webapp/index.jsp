<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* ===== Smooth Professional Background ===== */
body {
    margin: 0;
    min-height: 100vh;
    font-family: 'Segoe UI', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #e0f7fa 0%, #e8f0fe 50%, #f3e5f5 100%);
}

/* ===== Page Heading ===== */
h1 {
    color: #111827;
    font-weight: 700;
    margin-bottom: 50px;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.1);
}

/* ===== Card Container ===== */
.card-box {
    border-radius: 20px;
    padding: 30px 25px;
    text-align: center;
    transition: 0.4s ease;
    backdrop-filter: blur(8px);
    background: rgba(255, 255, 255, 0.65);
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
}

/* ===== Hover Effect ===== */
.card-box:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 35px rgba(0,0,0,0.15);
}

/* ===== Specific Card Gradients ===== */
.admin-card {
    background: linear-gradient(135deg, rgba(0, 145, 255, 0.85), rgba(0, 100, 200, 0.85));
    color: white;
}

.employee-card {
    background: linear-gradient(135deg, rgba(255, 130, 180, 0.85), rgba(255, 190, 120, 0.85));
    color: white;
}

/* ===== Card Titles & Text ===== */
.card-box h3 {
    font-weight: 600;
    margin-bottom: 15px;
}

.card-box p {
    font-size: 0.95rem;
    opacity: 0.9;
    margin-bottom: 20px;
}

/* ===== Buttons ===== */
.btn-custom {
    background: rgba(255, 255, 255, 0.9);
    color: #111827;
    font-weight: 600;
    border-radius: 25px;
    padding: 10px 25px;
    transition: 0.3s ease;
}

.btn-custom:hover {
    background: #111827;
    color: #ffffff;
    text-decoration: none;
}
</style>
</head>

<body>

<div class="container text-center">

    <h1>Employee Management System</h1>

    <div class="row justify-content-center g-4">

        <!-- Admin Panel -->
        <div class="col-md-4">
            <div class="card-box admin-card">
                <h3>Admin Panel</h3>
                <p>Manage employees, departments, attendance, and system settings.</p>
                <a href="adminrig.jsp" class="btn btn-custom">Go to Admin</a>
            </div>
        </div>

        <!-- Employee Panel -->
        <div class="col-md-4">
            <div class="card-box employee-card">
                <h3>Employee Panel</h3>
                <p>Access dashboard, view attendance, and update your profile.</p>
                <a href="emprig.jsp" class="btn btn-custom">Go to Employee</a>
            </div>
        </div>

    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>