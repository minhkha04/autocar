<%-- 
    Document   : serviceTicketDetail
    Created on : Mar 4, 2025, 9:33:49 PM
    Author     : nphu1
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sales Dashboard</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            body {
                background-color: #f5f5f5;
            }
            .container {
                width: 100%;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }
            header {
                background-color: #1e3a8a;
                color: white;
                padding: 1rem 2rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            .logo {
                font-size: 1.5rem;
                font-weight: bold;
            }
            .user-info {
                display: flex;
                align-items: center;
                gap: 1rem;
            }
            .user-info .avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #6b7280;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-weight: bold;
            }
            .main-content {
                display: flex;
                flex: 1;
            }
            .sidebar {
                width: 250px;
                background-color: #1e293b;
                color: white;
                padding: 1rem 0;
            }
            .sidebar-menu {
                list-style: none;
            }
            .sidebar-menu li {
                padding: 0.75rem 1.5rem;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .sidebar-menu li:hover, .sidebar-menu li.active {
                background-color: #2c3e50;
            }
            .sidebar-menu li.active {
                border-left: 4px solid #3b82f6;
            }
            .content {
                flex: 1;
                padding: 2rem;
                overflow-y: auto;
            }
            .page-title {
                font-size: 1.5rem;
                margin-bottom: 1.5rem;
                color: #1e3a8a;
            }
            .actions {
                display: flex;
                gap: 1rem;
                margin-bottom: 2rem;
            }
            .button {
                display: inline-block;
                padding: 0.5rem 1rem;
                background-color: #3b82f6;
                color: white;
                border-radius: 4px;
                text-decoration: none;
                font-size: 0.875rem;
                cursor: pointer;
                border: none;
            }
            .button:hover {
                background-color: #2563eb;
            }
            .button-green {
                background-color: #10b981;
            }
            .button-green:hover {
                background-color: #059669;
            }
            .search-container {
                display: flex;
                align-items: center;
                gap: 1rem;
                margin-bottom: 2rem;
            }
            .search-input {
                flex: 1;
                padding: 0.5rem 1rem;
                border: 1px solid #d1d5db;
                border-radius: 4px;
                font-size: 0.875rem;
            }
            .cards {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 1.5rem;
                margin-bottom: 2rem;
            }
            .card {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                padding: 1.5rem;
            }
            .card-title {
                font-size: 1.1rem;
                font-weight: bold;
                margin-bottom: 1rem;
                color: #1e3a8a;
            }
            .stat-card {
                display: flex;
                flex-direction: column;
            }
            .stat-value {
                font-size: 2rem;
                font-weight: bold;
                color: #3b82f6;
                margin-bottom: 0.5rem;
            }
            .stat-label {
                font-size: 0.875rem;
                color: #6b7280;
            }
            .table-container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                padding: 1.5rem;
                overflow-x: auto;
                margin-bottom: 2rem;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 0.75rem 1rem;
                text-align: left;
                border-bottom: 1px solid #e5e7eb;
            }
            th {
                background-color: #f3f4f6;
                font-weight: 600;
            }
            tr:hover {
                background-color: #f9fafb;
            }
            .badge {
                display: inline-block;
                padding: 0.25rem 0.5rem;
                border-radius: 9999px;
                font-size: 0.75rem;
                font-weight: 500;
            }
            .badge-blue {
                background-color: #dbeafe;
                color: #1e40af;
            }
            .badge-green {
                background-color: #dcfce7;
                color: #166534;
            }
            .badge-yellow {
                background-color: #fef3c7;
                color: #92400e;
            }
            .badge-red {
                background-color: #fee2e2;
                color: #b91c1c;
            }
            .chart-container {
                width: 100%;
                height: 300px;
                background-color: #edf2f7;
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 2rem;
                font-style: italic;
                color: #64748b;
            }
            .tabs {
                display: flex;
                border-bottom: 1px solid #e5e7eb;
                margin-bottom: 1.5rem;
            }
            .tab {
                padding: 0.75rem 1.5rem;
                cursor: pointer;
            }
            .tab.active {
                border-bottom: 2px solid #3b82f6;
                color: #3b82f6;
                font-weight: 500;
            }
            .logout-button {
                background-color: #dc2626; /* Màu đỏ */
                color: white;
                padding: 0.5rem 1rem;
                border: none;
                border-radius: 4px;
                font-size: 0.875rem;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .logout-button:hover {
                background-color: #b91c1c; /* Màu đỏ đậm khi hover */
            }
            a {
                text-decoration: none;  /* Loại bỏ gạch chân */
                color: inherit;         /* Kế thừa màu chữ từ phần tử cha */
                font-weight: inherit;   /* Kế thừa độ đậm của chữ */
                font-size: inherit;     /* Kế thừa kích thước chữ */
                cursor: pointer;        /* Đảm bảo con trỏ chuột thay đổi khi hover */
                transition: color 0.3s; /* Hiệu ứng màu khi hover */
            }

            a:hover, a:focus {
                color: inherit; /* Giữ nguyên màu khi hover hoặc focus */
                text-decoration: none;
            }

            a:active {
                opacity: 0.8; /* Giảm nhẹ độ sáng khi click */
            }
        </style>
    </head>
    <body>
        <div class="container">
            <header>
                <div class="logo">AutoCare Garage</div>
                <div class="user-info">
                    <span>Welcome, ${sessionScope.user.cusName}</span>
                    <form action="LogoutServlet" method="">
                        <button type="submit" class="logout-button">Logout</button>
                    </form>
                </div>
            </header>
            <div class="main-content">
                <div class="sidebar">
                    <ul class="sidebar-menu">
                        <a href="dashboardCustomer.jsp"> <li>Dashboard</li></a>
                        <a href="ServiceTicketCusServlet"><li class="active">My Service Ticket</li></a>
                        <a href="InvoiceServlet"><li>My Invoices</li></a>
                        <li>My Cars</li>
                        <a href="PartServlet"><li>Parts Catalog</li></a>


                        <a href="ChangeProfileServlet"><li>Edit Profile</li></a>

                    </ul>
                </div>
                <div class="content">
                    <h2>Service Ticket ID: <%= request.getAttribute("serviceTicketID")%></h2>

                    <table border="1" cellpadding="8">
                        <tr>
                            <th>Date Received</th>
                            <th>Date Returned</th>
                            <th>Customer Name</th>
                            <th>Service Name</th>
                            <th>Hourly Rate</th>
                            <th>Mechanic Name</th>
                            <th>Hours</th>
                            <th>Rate</th>
                            <th>Comment</th>
                        </tr>

                        <%
                            List<Object[]> details = (List<Object[]>) request.getAttribute("ticketDetails");
                            for (Object[] row : details) {
                        %>
                        <tr>
                            <td><%= row[1]%></td> <!-- Date Received -->
                            <td><%= row[2]%></td> <!-- Date Returned -->
                            <td><%= row[4]%></td> <!-- Customer Name -->
                            <td><%= row[6]%></td> <!-- Service Name -->
                            <td><%= row[7]%></td> <!-- Hourly Rate -->
                            <td><%= row[9]%></td> <!-- Mechanic Name -->
                            <td><%= row[10]%></td> <!-- Hours -->
                            <td><%= row[11]%></td> <!-- Rate -->
                            <td><%= row[12]%></td> <!-- Comment -->
                        </tr>
                        <%
                            }
                        %>
                    </table>

                    <br>
                    <a href="ServiceTicketCusServlet">Back to My Tickets</a>
                </div>
            </div>
        </div>
    </body>
</html>

