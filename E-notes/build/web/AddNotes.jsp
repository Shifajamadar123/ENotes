<%-- 
    Document   : AddNotes
    Created on : 11 Jun, 2023, 1:01:48 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserDetails user1 = (UserDetails) session.getAttribute("userD");

    if (user1 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login:error", "Please Login to Add Notes");
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Notes</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="all_component/navbar.jsp" %>
            <h1 class="text-center">Add Your Notes</h1>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <form action="AddNotesServlet" method="POST">
                            <div class="form-group">

                                <%  UserDetails user = (UserDetails) session.getAttribute("userD");
                                    if(user!=null)
                                    {%>
                                    <input type="hidden" value="<%= user.getId()%>" name="noteId">
                                <%}
                                %>
                                

                                <label for="exampleInputEmail1">Enter Title</label>
                                <input required name="title" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter title">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Content</label>
                                <textarea required name="content" placeholder="Enter content" rows="12" cols="" class="form-control"></textarea>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Add Notes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
