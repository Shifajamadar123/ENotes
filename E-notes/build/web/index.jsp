<%-- 
    Document   : index
    Created on : 10 Jun, 2023, 3:26:41 PM
    Author     : HP
--%>

<%@page import="com.db.DBCconnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            .back-img{
                background: url("images/e.jpg");
                margin-top: 5px;
                width: 100px;
                height: 80vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="all_component/allcss.jsp"  %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid back-img">
            <div class="container-fluid" style="height: 150px; background: #f8bbd0; text-align: center; border: solid white; border-width: 5px">
                <h1 class="text-center" style="color: white"><i class="fa fa-book" aria-hidden="true"></i> E-Notes: Save your notes</h1>
                <br>
                <a href="login.jsp" class="btn btn-light"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a>
                <a href="register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
            </div>
        </div>
        

        <%@include file="all_component/footer.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </body>
</html>
