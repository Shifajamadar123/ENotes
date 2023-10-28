<%-- 
    Document   : register
    Created on : 10 Jun, 2023, 4:26:34 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allcss.jsp" %>
        <title>Register Page</title>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid div-color">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-4">    </head>

                        <div class="card-header text-center text-white bg-custom">
                            <i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
                            <h4>Registration</h4>
                        </div>



                        <%
                            String smsg = (String) session.getAttribute("reg:success");
                            if (smsg != null) {%>
                            <div class="alert alert-success" role="alert"> <%= smsg%> Login <a href="login.jsp">Click Here</a></div>
                        <%}
                            session.removeAttribute("reg:success");
                        %>

                        <%
                            String fmsg = (String) session.getAttribute("reg:fail");
                            if (fmsg != null) {%>
                        <div class="alert alert-danger" role="alert"> <%= fmsg%></div>
                        <%}
                            session.removeAttribute("reg:fail");
                        %>

                        <div class="card-body">
                            <form action="UserServelet" method="POST">
                                <div class="form-group">
                                    <label>Enter Full Name</label>
                                    <input name="name" required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label>Enter Email</label>
                                    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Enter Password</label>
                                    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <button type="submit" class="btn btn-light badge-pill btn-block bg-custom">Register</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
