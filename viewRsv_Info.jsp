<%-- 
    Document   : viewRsv_Info
    Created on : Jan 15, 2021, 6:37:43 PM
    Author     : Rawhia Ahmed
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver").newInstance(); %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="Rawhia">
        <meta name="application-name" content="Hotels">
        <meta name="description" content="HotelReservationweb">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="icon" type="image/png" href="images/hotel.png">
        <link href="fonts/css/all.css" rel="stylesheet"> 
        <link rel="stylesheet" href="fonts/fonts/css/all.min.css">
        <link rel="stylesheet" href="fonts/fonts/css/all.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <script src="https://www.google.com/recaptcha/api.js"></script>
        
        <title>Hotel</title>
    </head>
    <body style="background-color: aquamarine;">
        <div id="page">
            <header id="header">
                
                <div class="nav">
                    <a href="index.html" class="navbar-brand"> 
                        <img class="logo" src="images/images.png" alt="">
                    </a>
                    <form class="nav-item form-inline">
                        <input class="form-control m-1" type="search" placeholder="Find your best Hotel">
                        <button class="btn search-btn m-1" type="submit"> Search <i class="fas fa-search fa-flip-horizontal"></i></button>
                    </form>
                </div>
                <nav class="nav ">
                    
                    <a href="index.html" class="nav-item nav-link">Home <i class="fas fa-home"></i></a>
                    <a href="#" target="blanc" class="nav-item nav-link active">Admin<i class="fas fa-address-book"></i></a>
                    <a href="services.html" target="blanc" class="nav-item nav-link">Services<i class="fas fa-cogs"></i></a>
                    <a href="book.html" target="blanc" class="nav-item nav-link">Booking<i class="fas fa-clipboard-list"></i></a>
                    <a href="#footer" class="nav-item nav-link">Contact Us<i class="fas fa-comments"></i></a>
                </nav>
            </header>
            <h1>Reservation List</h1>
        <%
            String url = "jdbc:mysql://localhost:3306/hotels";
            String user = "root";
            String password = "root";
            String Line;
            Connection Con = null;
            Statement Stmt = null;
            ResultSet RS = null;

            try {
                Con = DriverManager.getConnection(url, user, password);
                Stmt = Con.createStatement();
                //int rows_affected = Stmt.executeUpdate("INSERT INTO department VALUES ('TestDepartment', 100, '111111101', '1988-05-22');");
                //out.println("Number of Rows Affected  "+ rows_affected);

                RS = Stmt.executeQuery("SELECT * FROM project;");
            } catch (Exception cnfe) {
                System.err.println("Exception: " + cnfe);
            }
        %>
        <table border="1">
            <tr>
                <th>Client ID</th> 
                <th>Room Number</th> 
                <th>Hotel</th> 
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("GuestID")%></td>
                <td><%=RS.getString("RoomID")%></td>
                <td><%=RS.getString("HotelName")%></td>
            </tr>
            <%}%>
        </table>
        <br/>
        <h1>Client Information</h1>
        
        <table border="1">
            <tr>
                <th>Client ID</th> 
                <th>Email</th> 
                <th>Password</th>
                <th>Room Number</th>
            </tr>
            <%
                while (RS.next()) {%>
            <tr>
                <td><%=RS.getString("GuestID")%></td>
                <td><%=RS.getString("mail")%></td>
                <td><%=RS.getString("password")%></td>
                <td><%=RS.getString("RoomID")%></td>
            </tr>
            <%}%>
        </table>
        <br/>
        <a href="admin.html">Back</a>
<footer id="footer">
                <div class="contact">
                    <h1>INQUIRY FORM</h1>
                    <form action="index.html">
                        <input type="text" name="Name" value="Name" onblur="this.value = !this.value ? 'Name' : this.value;" onfocus="this.select()" onclick="this.value = '';">
                        <input type="text" name="Email" value="Email" onblur="this.value = !this.value ? 'Email' : this.value;" onfocus="this.select()" onclick="this.value = '';">
                        <input type="text" name="Subject" value="Subject" onblur="this.value = !this.value ? 'Subject' : this.value;" onfocus="this.select()" onclick="this.value = '';">
                        <input type="text" name="message" value="Share your thoughts" onblur="this.value = !this.value ? 'Message' : this.value;" onfocus="this.select()" onclick="this.value = '';">
                        <input type="submit" value="Send" id="submit" style="background-color: rgb(39, 6, 128)">
                    </form>
                </div>
                <div class="section">
                    <h1>WE’D LOVE TO HEAR FROM YOU.</h1>
                    <p>If you're having problems 
                        editing this website template, 
                        then don't hesitate to ask 
                        for help on the Forums.
                    </p>
                </div>
                <div>
                    <div class="connect">
                        <a href="https://www.facebook.com/" target="blanc" class="facebook"><i class="fab fa-facebook"></i></a>
                        <a href="https://www.twitter.com/" target="blanc" class="twitter"><i class="fab fa-twitter"></i></a>
                        <a href="http://www.googleplus.com/" target="blanc" class="googleplus"><i class="fab fa-google-plus-square"></i></a>
                        <a href="https://www.linkedin.com/" target="blanc" class="linkedin"><i class="fab fa-linkedin"></i></a>
                    </div>
                    <p>&copy; 2020 Hotels. All Rights Reserved.</p>
                </div>
            </footer>
        </div>
    </body>
</html>