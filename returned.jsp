<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>


<html>
      <title>ADMIN</title>
      <head>
            <!--minfied CSS compiled -->
            <link href = "//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel = "stylesheet">

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

            <style>
                
                .carousel-inner{
                  width:100%;
                  max-height:300px;
                }
                

            </style>

      </head>
<%
      Class.forName("com.mysql.jdbc.Driver");
      String connectionURL= "jdbc:mysql://localhost:3306/Diablo";

      Connection connection = null;
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Library","root","pagal.com");

      Statement stmt=null;
      Statement stmt2 = null;
      Statement stmt3 = null;
      PreparedStatement prep= null;
      ResultSet res=null;
      ResultSet res2=null;
      ResultSet res3 = null;
      stmt = connection.createStatement();
      stmt2 = connection.createStatement();
      stmt3 = connection.createStatement();  
%>

<body>

        <!--PANEL-->
        <%
            String ret_name = request.getParameter("first");
            ret_name = ret_name.toUpperCase();
            res = stmt.executeQuery("show tables");
            int present=0;
            while(res.next())
            {
                  String table_name = res.getString(1);
                  if(table_name.equals(ret_name))
                  {
                      present=1;
                      break;
                  }
            }

            if(present==0)
            {


            }

            else
            {
                    %>
                    <br>
                    <center><div class="mx-auto" style="width: 1000px;">
                         <div class="panel panel-primary">
                        <div class="panel-heading">
                        <h1 class="panel-title"><center><font size="5" face="Courier new"><b>RETURN BOOK</b></font><br><font size="4" face="courier new"><%out.print(ret_name);%></font></center></h1></h1></div>
                        <div class="panel-body">

                  <%
                  res = stmt.executeQuery("select * from "+ret_name);
                  %>
                   <table class="table table-striped">
                        <form action="paid.jsp" class="form-inline">
                   <tr>
                      <th><font size="4" face="Courier New"><b>S.NO</b></font></th>
                      <th><font size="4" face="Courier New"><b>NAME</b></font></th>
                      <th><font size="4" face="Courier New"><b>EXPECTED RETURN</b></font></th>
                      <th><font size="4" face="Courier New"><b>FINE</b></font></th>
                      <th><font size="4" face="Courier New"><b>SELECT</b></font></th>

                      </tr>
                   <%
                  while(res.next())
                  {
                        int sno = res.getInt(1);
                        String book_name = res.getString(2);
                        String ret = res.getString(4);
                        int fine = res.getInt(5);
                        %>
                       
                        <tr>
                        <td><font size="4" face="Courier New"><%out.print(sno);%></font></td>
                        <td><font size="4" face="Courier New"><%out.print(book_name);%></font></td>
                        <td><font size="4" face="Courier New"><%out.print(ret);%></font></td>
                        <td><font size="4" face="Courier New"><%out.print(fine);%></font></td>
                        <td><input type="checkbox" name="return" value="<%out.print(book_name);%>"/></td>
                        </tr>

                        <%
                  }
                  %>
                  </table>
                  <center><button class = "btn btn-danger" type="submit" value = "SUBMIT"><h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspRETURN&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h4></button></center>
                  </form>
                  
                  <%
            }

        %>
      





<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
      
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src = "//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

</body>
</html>