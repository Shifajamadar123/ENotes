<%-- 
    Document   : edit
    Created on : 12 Jun, 2023, 3:07:47 PM
    Author     : HP
--%>

<%@page import="com.db.DBCconnect"%>
<%@page import="com.User.Post"%>
<%@page import="com.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserDetails user4 = (UserDetails) session.getAttribute("userD");

    if (user4 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login:error", "Please Login to Edit Notes");
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Notes</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        
        <%
            int idd = Integer.parseInt(request.getParameter("note_id"));
            PostDao pd = new PostDao(DBCconnect.getConn());
            Post pt = pd.getPostById(idd);
        %>
        
        <div class="container-fluid">
            <%@include file="all_component/navbar.jsp" %>
            <h1 class="text-center">Edit Your Note</h1>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <form action="NoteEditServlet" method="POST">
                            <%if(user4!=null)
                            {%>
                            <input name="note_id" type="hidden" value="<%= idd %>">
                                
                            <%}
                                %>
                            
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Title</label>
                                <input value="<%= pt.getTitle() %>" required name="Edittitle" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter title">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Enter Content</label>
                                <textarea required name="Editcontent" placeholder="Enter content" rows="12" cols="" class="form-control" ><%= pt.getContent() %></textarea>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
