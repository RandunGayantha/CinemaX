<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Payment Records - CinemaX</title>
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
            --success: #4CAF50;
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

        .summary-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .summary-card {
            background: var(--gray);
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .summary-card h3 {
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 0.5rem;
        }

        .summary-card .amount {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--success);
        }

        .filter-controls {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .filter-controls select, 
        .filter-controls input {
            padding: 0.8rem 1rem;
            background: var(--dark);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            color: var(--light);
            font-size: 1rem;
            min-width: 200px;
        }

        .filter-controls button {
            padding: 0 1.5rem;
            background: var(--primary);
            border: none;
            border-radius: 8px;
            color: white;
            font-weight: 600;
            cursor: pointer;
        }

        /* Payments Table */
        .payments-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: var(--gray);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        .payments-table thead {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .payments-table th {
            padding: 1rem;
            text-align: left;
            color: white;
            font-weight: 600;
        }

        .payments-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .payments-table tr:last-child td {
            border-bottom: none;
        }

        .payments-table tr:hover {
            background: rgba(255, 255, 255, 0.02);
        }

        .amount-cell {
            font-weight: 600;
            color: var(--success);
        }

        .payment-method {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .payment-method i {
            color: var(--secondary);
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

        .action-link:hover {
            color: #00d4ff;
        }

        .no-payments {
            text-align: center;
            padding: 2rem;
            color: rgba(255, 255, 255, 0.7);
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
            
            .payments-table {
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
            
            .filter-controls {
                flex-direction: column;
            }
            
            .filter-controls select, 
            .filter-controls input {
                width: 100%;
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
            <h2>Payment Records</h2>
            <div class="filter-controls">
                <select>
                    <option value="">All Payment Methods</option>
                    <option value="card">Credit/Debit Card</option>
                    <option value="online">Online Payment</option>
                </select>
                <input type="date" placeholder="Filter by date">
                <button type="submit"><i class="fas fa-filter"></i> Filter</button>
            </div>
        </div>

        

        <table class="payments-table">
            <thead>
                <tr>
                    <th>Payment ID</th>
                    <th>Customer</th>
                    <th>Booking</th>
                    <th>Method</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Receipt</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Map<String, String>> payments = (List<Map<String, String>>) request.getAttribute("payments");
                if (payments != null && !payments.isEmpty()) {
                    for (Map<String, String> payment : payments) { 
                %>
                <tr>
                    <td><%= payment.get("id") %></td>
                    <td>
                        <a href="viewCustomer.jsp?id=<%= payment.get("customer_id") %>" class="action-link">
                            <i class="fas fa-user"></i> <%= payment.get("customer_id") %>
                        </a>
                    </td>
                    <td>
                        <a href="viewBooking.jsp?id=<%= payment.get("booking_id") %>" class="action-link">
                            <i class="fas fa-ticket-alt"></i> <%= payment.get("booking_id") %>
                        </a>
                    </td>
                    <td>
                        <span class="payment-method">
                            <i class="fas fa-credit-card"></i> Card
                        </span>
                    </td>
                    <td class="amount-cell">Rs. <%= payment.get("amount") %></td>
                    <td><%= payment.get("payment_date") %></td>
                    <td>
                        <a href="#" class="action-link">
                            <i class="fas fa-file-invoice"></i> View
                        </a>
                    </td>
                </tr>
                <%    }
                } else { %>
                <tr>
                    <td colspan="7" class="no-payments">
                        <i class="fas fa-info-circle"></i> No payment records found
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
                <p><i class="fas fa-envelope"></i> accounts@cinemax.lk</p>
            </div>
        </div>
        <div class="copyright">
            <p>&copy; 2025 CinemaX. All Rights Reserved.</p>
        </div>
    </footer>

    <script>
        // Format currency display
        document.querySelectorAll('.amount-cell').forEach(cell => {
            const amount = cell.textContent.replace('Rs. ', '');
            if (!isNaN(amount)) {
                cell.textContent = 'Rs. ' + parseFloat(amount).toLocaleString('en-US', {
                    minimumFractionDigits: 2,
                    maximumFractionDigits: 2
                });
            }
        });
    </script>
</body>
</html>
