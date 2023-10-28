<%-- 
    Document   : showNotes
    Created on : 12 Jun, 2023, 12:15:52 PM
    Author     : HP
--%>

<%@page import="java.util.List"%>
<%@page import="com.db.DBCconnect"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.User.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserDetails user3 = (UserDetails) session.getAttribute("userD");

    if (user3 == null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("login:error", "Please Login to View");
    }

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Notes</title>
        <%@include file="all_component/allcss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container">
            <h2 class="text-center">All Notes</h2>
            
            <%
                String msg5 = (String)session.getAttribute("edit:success");
                if(msg5!=null)
                {%>
                <div class="container text-center alert-success"><%= msg5 %></div>
            <%}
                session.removeAttribute("edit:success");
            %>
            
            <%
                String msg6 = (String)session.getAttribute("eidt:fail");
                if(msg6!=null)
                {%>
                <div class="container text-center alert-danger"><%= msg6 %></div>
            <%}
                session.removeAttribute("edit:fail");
            %>
            
            
            <%
                String msg7 = (String)session.getAttribute("delete:success");
                if(msg7!=null)
                {%>
                <div class="container text-center alert-success"><%= msg7 %></div>
            <%}
                session.removeAttribute("delete:success");
            %>
            
            
            <%
                String msg8 = (String)session.getAttribute("delete:fail");
                if(msg8!=null)
                {%>
                <div class="container text-center alert-success"><%= msg8 %></div>
            <%}
                session.removeAttribute("delete:fail");
            %>

            <div class="row">
                <div class="col-md-12">

                    <%                                                    if (user3 != null) {
                            PostDao pod = new PostDao(DBCconnect.getConn());
                            List<Post> list = pod.getData(user3.getId());
                            for (Post p : list) {%>
                    <div class="card mt-3">
                        <img alt="" src="images/home.jpg" class="card-img-top mt-2 mx-auto" style="max-width: 100px">

                        <div class="card-body p-4">



                            <h5 class="card-title"><%=p.getTitle() %></h5>
                            <p><%=p.getContent() %></p>

                            <p>
                                <b class="text-success">Published By: <%=user3.getName() %></b> </br> <b class="text-primary"></b>
                            </p>
                            
                            <p>
                                <b class="text-success">Published Date: <%= p.getPdate() %></b> </br> <b class="text-primary"></b>
                            </p>

                            <div class="container text-center mt-2">
                                <a href="DeleteServlet?note_id=<%= p.getId() %>" class="btn btn-danger">Delete</a>
                                <a href="edit.jsp?note_id=<%= p.getId() %>" class="btn btn-primary">Edit</a>
                            </div>

                        </div>
                    </div>
                    <%}
                        if(list.isEmpty())
                        {%>
                        <div class="card mt-3">
                            <img alt="" src="images/download.jpg" class="card-img-top mt-2 mx-auto" style="max-width: 100px">

                        <div class="card-body p-4">



                            <h5 class="card-title text-center">No Notes Added</h5>

                            

                            <div class="container text-center mt-2">
                                <a href="AddNotes.jsp" class="btn btn-primary">Start Here</a>
                            </div>

                        </div>
                    </div>
                        <%}
}
                    %>

                </div>
            </div>
        </div>
    </body>
</html>
