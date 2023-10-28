<%-- 
    Document   : login
    Created on : 10 Jun, 2023, 4:26:28 PM
    Author     : HP
--%>
<!-- login:fail : it is for wrong password
     login:error : it is when u press add notes without login-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allcss.jsp" %>
        <title>Login Page</title>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid div-color">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-4">    </head>

                        <div class="card-header text-center text-white bg-custom">
                            <i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
                            <h4>Login</h4>
                        </div>

                        <%
                            String msg = (String) session.getAttribute("login:fail");
                            if (msg != null) {%>
                        <div class="alert alert-danger" role="alert"><%= msg%></div>
                        <%}
                            session.removeAttribute("login:fail");
                        %>
                        
                        
                        <%
                            String msg1 = (String) session.getAttribute("login:error");
                            if (msg1 != null) {%>
                        <div class="alert alert-danger" role="alert"><%= msg1%></div>
                        <%}
                            session.removeAttribute("login:error");
                        %>
                        
                        <%
                            String msg2 = (String) session.getAttribute("logout:msg");
                            if (msg2 != null) {%>
                        <div class="alert alert-success" role="alert"><%= msg2%></div>
                        <%}
                            session.removeAttribute("logout:msg");
                        %>
                        

                        <div class="card-body">
                            <form action="loginServelet" method="POST">
                                <div class="form-group">
                                    <label>Enter Email Id</label>
                                    <input required name="loginEmail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Enter Password</label>
                                    <input required name="loginPassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <button type="submit" class="btn btn-light badge-pill btn-block bg-custom">Login</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
