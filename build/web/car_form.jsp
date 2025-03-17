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
                <h2 class="text-center">${isEdit ? "Update Car" : "Add New Car"}</h2>

                <form action="cars" method="post">
                    <div class="mb-3">
                        <label for="carID" class="form-label">Car ID</label>
                        <input type="text"  class="form-control" id="carID" name="carID" value="${car.carID}" ${isEdit ? "readonly" : ""} required>
                    </div>

                    <div class="mb-3">
                        <label for="serialNumber" class="form-label">Serial Number</label>
                        <input type="text" class="form-control" id="serialNumber" name="serialNumber" value="${car.serialNumber}" required>
                    </div>

                    <div class="mb-3">
                        <label for="model" class="form-label">Model</label>
                        <input type="text" class="form-control" id="model" name="model" value="${car.model}" required>
                    </div>

                    <div class="mb-3">
                        <label for="colour" class="form-label">Colour</label>
                        <input type="text" class="form-control" id="colour" name="colour" value="${car.colour}" required>
                    </div>

                    <div class="mb-3">
                        <label for="year" class="form-label">Year</label>
                        <input type="number" class="form-control" id="year" name="year" value="${car.year}" required>
                    </div>

                    <div class="mb-3">
                        <label for="year" class="form-label">Price</label>
                        <input type="number" class="form-control" step="0.01" id="price" name="price" value="${car.price}" required>
                    </div>

                    <input type="hidden" name="action" value="${isEdit ? "update" : "create"}">

                    <button type="submit" class="btn btn-primary">${isEdit ? "Update" : "Create"}</button>
                    <a href="cars?action=list" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
    </body>

</html>