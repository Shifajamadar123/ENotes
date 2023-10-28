<%-- 
    Document   : home
    Created on : 11 Jun, 2023, 10:52:20 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    UserDetails user2 = (UserDetails) session.getAttribute("userD");

    if (user2 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login:error", "Please Login to View");
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <div class="container-fluid text-center">
            <%@include file="all_component/navbar.jsp" %>
            <div class="card py-5">
                <div class="card-body">
                    <img src="images/home.jpg" alt="" class="img-fluid mx-auto" style="max-width: 400px;height: 50vh"/>
                    <h1 style="font-family: cursive; color: gray">Start Taking Notes</h1>
                    <a class="btn btn-outline-primary" href="AddNotes.jsp">Start Here</a>
                    
                </div>
                
            </div>
            
        </div>
        
        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
