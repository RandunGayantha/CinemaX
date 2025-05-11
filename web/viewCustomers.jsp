<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>View Customers - CinemaX</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #ff3e00;
            --primary-dark: #e63900;
            --secondary: #00a8ff;
            --dark: #121212;
            --darker: #0a0a0a;
            --light: #f5f5f5;
            --gray: #2a2a2a;
            --light-gray: #444;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--darker);
            color: var(--light);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Navigation Bar */
        nav {
            background-color: rgba(18, 18, 18, 0.95);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.2rem 5%;
            position: sticky;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        nav .logo {
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(45deg, var(--primary), #ff6b00);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        nav .logo i {
            font-size: 1.5rem;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 2rem;
        }

        nav ul li {
            position: relative;
        }

        nav ul li a {
            color: var(--light);
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
            transition: color 0.3s;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        nav ul li a i {
            font-size: 0.9rem;
        }

        nav ul li a:hover {
            color: var(--primary);
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 3rem 5%;
            max-width: 1400px;
            margin: 0 auto;
            width: 100%;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .page-header h2 {
            font-size: 2rem;
            color: var(--light);
            position: relative;
        }

        .page-header h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--primary);
        }

        .search-bar {
            display: flex;
            gap: 0.5rem;
            margin-bottom: 2rem;
        }

        .search-bar input {
            flex: 1;
            padding: 0.8rem 1rem;
            background: var(--dark);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            color: var(--light);
            font-size: 1rem;
            max-width: 400px;
        }

        .search-bar button {
            padding: 0 1.5rem;
            background: var(--primary);
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            cursor: pointer;
        }

        /* Customers Table */
        .customers-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: var(--gray);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        .customers-table thead {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .customers-table th {
            padding: 1rem;
            text-align: left;
            color: white;
            font-weight: 600;
        }

        .customers-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .customers-table tr:last-child td {
            border-bottom: none;
        }

        .customers-table tr:hover {
            background: rgba(255, 255, 255, 0.02);
        }

        .password-cell {
            font-family: monospace;
            color: rgba(255, 255, 255, 0.6);
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 0.5rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--secondary);
            cursor: pointer;
        }

        .action-link {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

        .action-link.delete {
            color: #ff5252;
        }

        .action-link:hover {
            color: #00d4ff;
        }

        .action-link.delete:hover {
            color: #ff0000;
        }

        .back-link {
            margin-top: 2rem;
            text-align: center;
        }

        .btn-back {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.8rem 1.5rem;
            background: var(--dark);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            color: var(--light);
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
        }

        .btn-back:hover {
            background: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.2);
        }

        /* Footer */
        footer {
            background-color: var(--darker);
            color: var(--light);
            padding: 2rem 5%;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 2rem;
        }

        .footer-logo {
            font-size: 1.5rem;
            font-weight: 700;
            background: linear-gradient(45deg, var(--primary), #ff6b00);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 1rem;
        }

        .copyright {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.9rem;
            margin-top: 2rem;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            nav ul {
                gap: 1.2rem;
            }
            
            .customers-table {
                display: block;
                overflow-x: auto;
            }
        }

        @media (max-width: 576px) {
            nav ul {
                display: none;
            }
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .search-bar {
                flex-direction: column;
            }
            
            .search-bar input {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">
            <i class="fas fa-film"></i> CinemaX
        </div>
        <ul>
            <li><a href="admin.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            
            <li><a href="AdminLogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </nav>

    <div class="main-content">
        <div class="page-header">
            <h2>Customer Management</h2>
            <div class="search-bar">
                <input type="text" placeholder="Search customers...">
                <button type="submit"><i class="fas fa-search"></i></button>
            </div>
        </div>

        <table class="customers-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>NIC</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Password</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Map<String, String>> customers = (List<Map<String, String>>) request.getAttribute("customers");
                for (Map<String, String> customer : customers) { 
                %>
                <tr>
                    <td><%= customer.get("id") %></td>
                    <td><%= customer.get("fullname") %></td>
                    <td><%= customer.get("nic") %></td>
                    <td><%= customer.get("email") %></td>
                    <td><%= customer.get("phone") %></td>
                    <td class="password-cell">
                        <span class="password-text" style="filter: blur(4px); user-select: none;">
                            <%= customer.get("password") %>
                        </span>
                        <button class="password-toggle" onclick="togglePassword(this)">
                            <i class="fas fa-eye"></i>
                        </button>
                    </td>
                    <td>
                        <a href="#" class="action-link">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="#" class="action-link delete">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        
    </div>

    <footer>
        <div class="footer-container">
            <div>
                <div class="footer-logo">
                    <i class="fas fa-film"></i> CinemaX
                </div>
                <p>Premium movie experience with state-of-the-art theaters and unmatched service.</p>
            </div>
            <div>
                <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, Colombo 07, Sri Lanka</p>
                <p><i class="fas fa-phone-alt"></i> +94 70 3848480</p>
                <p><i class="fas fa-envelope"></i> admin@cinemax.lk</p>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2025 CinemaX. All Rights Reserved.</p>
        </div>
    </footer>

    <script>
        // Toggle password visibility
        function togglePassword(button) {
            const passwordCell = button.closest('.password-cell');
            const passwordText = passwordCell.querySelector('.password-text');
            const icon = button.querySelector('i');
            
            if (passwordText.style.filter === 'blur(4px)') {
                passwordText.style.filter = 'none';
                icon.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                passwordText.style.filter = 'blur(4px)';
                icon.classList.replace('fa-eye-slash', 'fa-eye');
            }
        }

        // Confirm before deleting
        document.querySelectorAll('.action-link.delete').forEach(link => {
            link.addEventListener('click', function(e) {
                if (!confirm('Are you sure you want to delete this customer?')) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
