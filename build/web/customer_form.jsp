<%@page import="model.Customer"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : customers
    Created on : 28/02/2025, 3:41:11 PM
    Author     : ttrrang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // Check if we are updating an existing customer
    Customer customer = (Customer) request.getAttribute("customer");

%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${isEdit ? "Update Customer" : "Add Customer"}</title><!--   -->  
    </head>

    <body>
        <div class="card">
            <div class="card-body">
                <h2 class="text-center">${isEdit ? "Update Customer" : "Add New Customer"}</h2>

                <form action="CustomerServlet" method="post">
                    <div class="mb-3">
                        <label for="custID" class="form-label">Customer ID </label>
                        <input type="text" class="form-control" id="custID" name="cusID" value="${customer.cusID}" ${isEdit ? "readonly" : ""} required>
                    </div>

                    <div class="mb-3">
                        <label for="custName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="custName" name="cusName" value="${customer.cusName}" required>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${customer.phone}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Sex</label><br>
                        <input type="radio" id="male" name="sex" value="M" ${isEdit ? "" : "checked"} ${customer.sex.trim().equals("M")? "checked" : ""} required> 
                        <label for="male">Male</label>

                        <input type="radio" id="female" name="sex" value="F" ${customer.sex.trim().equals("F")? "checked" : ""}>
                        <label for="female">Female</label>
                    </div>

                    <div class="mb-3">
                        <label for="cusAddress" class="form-label">Address</label>
                        <input type="text" class="form-control" id="cusAddress" name="cusAddress" value="${customer.cusAddress}" required>
                    </div>

                    <input type="hidden" name="action" value="${isEdit ? "update" : "create"}">

                    <button type="submit" class="btn btn-primary">${isEdit ? "Update" : "Create"}</button>
                    <a href="CustomerServlet?action=list" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
    </body>

</html>