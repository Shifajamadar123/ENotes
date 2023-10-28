<%-- 
    Document   : navbar
    Created on : 10 Jun, 2023, 4:34:19 PM
    Author     : HP
--%>

<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
    <a class="navbar-brand" href="#"><i class="fa fa-book" aria-hidden="true"></i> E-NOTES</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="AddNotes.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i> Add Note</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="showNotes.jsp"><i class="fa fa-address-book-o" aria-hidden="true"></i> Show Notes</a>
            </li>
        </ul>

        <%
            UserDetails d = (UserDetails) session.getAttribute("userD");
            if (d != null) {%>
        <a href="" class="btn btn-outline-light my-2 my-sm-0 mr-2" data-toggle="modal" data-target="#exampleModal" style="color: black" type="submit"><i class="fa fa-user" aria-hidden="true"></i> <%= d.getName()%></a>
        <a href="LogoutServlet" class="btn btn-outline-light my-2 my-sm-0 " style="color: black" type="submit"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>

        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Profile Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <i class="fa fa-user fa-3x" aria-hidden="true"></i>
                            <h5><%= d.getName()%> </h5>
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th>User Id</th>
                                        <td><%= d.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th>Full Name</th>
                                        <td><%= d.getName()%></td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td><%= d.getEmail()%></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>     
                        </div>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <%} else {%>
        <a href="login.jsp" class="btn btn-outline-light my-2 my-sm-0 mr-2" style="color: black" type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a>
        <a href="register.jsp" class="btn btn-outline-light my-2 my-sm-0 " style="color: black" type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
        <%}
        %>


    </div>



</nav>
