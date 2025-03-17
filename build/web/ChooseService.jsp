<%@page import="model.Parts"%>
<%@page import="model.Service"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : createServiceTicket
    Created on : 8/03/2025, 9:45:13 AM
    Author     : ttrrang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Select Purchase</title>

        <!-- Bootstrap 5 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            function showParts() {
                document.getElementById("partsList").style.display = "block";
                document.getElementById("servicesList").style.display = "none";
            }

            function showServices() {
                document.getElementById("partsList").style.display = "none";
                document.getElementById("servicesList").style.display = "block";
            }
        </script>
    </head>
    <body>
        <!-- Header -->
        <div class="header">
            <div class="container">
                <h1>Hệ Thống Quản Lý Garage</h1>
            </div>
        </div>
        <!-- Dashboard Container -->
        <div class="container dashboard" style="display: block">
            <div class="dashboard-header">
                <div class="user-info">
                    <div class="user-avatar" id="user-avatar">U</div>
                    <div>
                        <h3 id="welcome-text">Xin chào, Người dùng</h3>
                        <p id="user-role">Vai trò: Chưa xác định</p>
                    </div>
                </div>
                <button class="btn" style="width: auto; padding: 8px 15px;" onclick="logout()">Đăng Xuất</button>
            </div>

            <div class="dashboard-content">
                <!-- Sidebar Menu -->
                <jsp:include page="SiderbarCustomer.jsp" />

                <!-- Nội dung chính -->
                <div class="content-area">
                    <!-- Nội dung cho Nhân viên bán hàng -->
                    <div id="salesperson-content">
                        <!-- Quản lý khách hàng -->
                        <div id="customers-content">
                            <h2 class="content-title">Quản lý Khách hàng</h2>
                            <c:if test="${param.mess!=null}">
                                <div class="alert alert-info">${param.mess}</div>
                            </c:if>

                            <div class="card">
                                <h2 class="text-center mb-4">Chọn Loại Mua Hàng</h2>

                                <!-- Nút chọn -->
                                <div class="d-flex justify-content-center mb-4">
                                    <button class="btn btn-primary mx-2" onclick="showParts()">Mua Parts</button>
                                    <button class="btn btn-success mx-2" onclick="showServices()">Mua Service</button>
                                </div>

                                <!-- Danh sách Parts -->
                                <div id="partsList" class="card shadow-lg" style="display: none;">
                                    <div class="card-header bg-primary text-white">
                                        <h4>Danh Sách Parts</h4>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Tên Parts</th>
                                                    <th>Giá Mua</th>
                                                    <th>Giá Bán</th>
                                                    <th>Số lượng</th>
                                                    <th>Mua</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    List<Parts> parts = (List<Parts>) request.getAttribute("parts");
                                                    if (parts != null) {
                                                        for (Parts p : parts) {
                                                %>
                                            <form action="BuyPart">
                                                <input type="hidden" name="seviceTicketId" value="${param.seviceTicketId}">
                                                <input type="hidden" name="partId" value="<%= p.getPartID()%>">
                                                <input type="hidden" name="price" value="<%= p.getPurchasePrice()%>">

                                                <tr>
                                                    <td><%= p.getPartID()%></td>
                                                    <td><%= p.getPartName()%></td>
                                                    <td><%= p.getPurchasePrice()%>đ</td>
                                                    <td><%= p.getRetailPrice()%>đ</td>
                                                    <td><input type="number" class="form-control" style="display: inline-block; width: 100px; " name="quantity"/></td>
                                                    <td><button type="submit" class="btn btn-success">Mua</button></td>
                                                </tr>
                                            </form>
                                            <%
                                                    }
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!-- Danh sách Services -->
                                <div id="servicesList" class="card shadow-lg" style="display: none;">
                                    <div class="card-header bg-success text-white">
                                        <h4>Danh Sách Services</h4>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Tên Dịch Vụ</th>
                                                    <th>Giá Theo Giờ</th>
                                                    <th>Thợ sửa</th>
                                                    <th>Số lượng</th>
                                                    <th>Mua</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    List<Service> services = (List<Service>) request.getAttribute("services");
                                                    if (services != null) {
                                                        for (Service s : services) {
                                                %>
                                            <form action="BuyService">
                                                <input type="hidden" name="seviceTicketId" value="${param.seviceTicketId}">
                                                <input type="hidden" name="serivceId" value="<%= s.getId()%>">
                                                <input type="hidden" name="rate" value="<%= s.getHourlyRate()%>">
                                                <tr>

                                                    <td><%= s.getId()%></td>
                                                    <td><%= s.getName()%></td>
                                                    <td><%= s.getHourlyRate()%>đ / giờ</td>
                                                    <td>
                                                        <select class="form-select" style="display: inline-block; width: 100px; " name="mechanicId">
                                                            <c:forEach  var="m" items="${Mechanics}">
                                                                <option value="${m.id}">${m.name}</option>

                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    <td><input type="number" class="form-control" style="display: inline-block; width: 100px; " name="quantity"/></td>
                                                    <td><button type="submit" class="btn btn-success">Mua</button></td>
                                                </tr>
                                            </form>

                                            <%
                                                    }
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
        </div>

        <!-- JavaScript -->
        <script>

            // Hàm hiển thị nội dung theo menu
            function showContent(contentId) {
                // Danh sách tất cả các content
                const contentList = [
                    'customers-content', 'cars-content', 'service-tickets-content', 'parts-content',
                    'invoices-content', 'reports-content', 'service-tickets-mechanic-content',
                    'services-content', 'car-catalog-content', 'service-tickets-customer-content',
                    'invoices-customer-content', 'profile-content'
                ];

                // Ẩn tất cả content
                contentList.forEach(id => {
                    const element = document.getElementById(id);
                    if (element) {
                        element.style.display = 'none';
                    }
                });

                // Hiển thị content được chọn
                const selectedContent = document.getElementById(contentId + '-content');
                if (selectedContent) {
                    selectedContent.style.display = 'block';
                }

                // Xác định menu cha để cập nhật trạng thái active
                let parentMenu;
                const role = document.getElementById('role').value;

                if (role === 'salesperson' || contentId.startsWith('customers') || contentId.startsWith('cars') ||
                        contentId.startsWith('service-tickets') && !contentId.includes('customer') && !contentId.includes('mechanic') ||
                        contentId.startsWith('parts') || contentId.startsWith('invoices') && !contentId.includes('customer') ||
                        contentId.startsWith('reports')) {
                    parentMenu = document.getElementById('salesperson-menu');
                } else if (role === 'mechanic' || contentId.startsWith('service-tickets-mechanic') || contentId.startsWith('services')) {
                    parentMenu = document.getElementById('mechanic-menu');
                } else if (role === 'customer' || contentId.startsWith('car-catalog') || contentId.startsWith('service-tickets-customer') ||
                        contentId.startsWith('invoices-customer') || contentId.startsWith('profile')) {
                    parentMenu = document.getElementById('customer-menu');
                }

                // Cập nhật trạng thái active cho menu
                if (parentMenu) {
                    const menuItems = parentMenu.querySelectorAll('.menu-item');
                    menuItems.forEach(item => {
                        item.classList.remove('active');
                        if (item.getAttribute('onclick').includes(contentId)) {
                            item.classList.add('active');
                        }
                    });
                }
            }

            // Event listener cho việc thay đổi vai trò
            document.getElementById('role').addEventListener('change', function () {
                const phoneContainer = document.getElementById('phone-container');
                if (this.value === 'customer') {
                    phoneContainer.style.display = 'block';
                } else {
                    phoneContainer.style.display = 'none';
                }
            });

            // Khởi tạo: ẩn trường số điện thoại nếu không phải khách hàng
            document.addEventListener('DOMContentLoaded', function () {
                const role = document.getElementById('role').value;
                const phoneContainer = document.getElementById('phone-container');

                if (role !== 'customer') {
                    phoneContainer.style.display = 'none';
                }
            });
        </script>
    </body>
</html>