<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>

<html>
      <title>SEARCH_RES</title>
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

      Statement stmt = null;
      PreparedStatement prep= null;
      ResultSet res=null;
       stmt = connection.createStatement();


%>

<body>
      <center>



       <center>
       <%
         String name = request.getParameter("name");
         name = name.toUpperCase();

         String store = (String)session.getAttribute("firs");
         res = stmt.executeQuery("show tables");
                        int exists=0;
                        String strike[] = new String[100];
                        int c_st=0;
                        //out.println(store);
                        store=store.toUpperCase();
                        while(res.next())
                        {
                              String n = res.getString(1);
                              if(store.equals(n))
                              {
                                    exists=1;
                                    break;
                              }
                        }

                        if(exists==1)
                        {
                              res = stmt.executeQuery("select NAME from "+store);
                              while(res.next())
                              {
                                    String ex = res.getString(1);
                                    strike[c_st++]=ex;
                                    //out.println(ex);
                              }

                        }

       %>
       <br><br>
       <!--PANEL-->
        <center><div class="mx-auto" style="width: 1000px;">
                  <div class="panel panel-primary">
                    <div class="panel-heading">
                      <h1 class="panel-title"><h1><center><h1><%out.print(name);%></h1></center></h1></h1></div>
                      <div class="panel-body">


      <%
           

            String result = request.getParameter("search");
           // name = request.getParameter("name");
            
            String ser = (String)session.getAttribute("first");
            session.setAttribute("first",ser);
            //out.println(name);
            if(result.equals("book"))
            {
                  //name = name.toUpperCase();
                  res = stmt.executeQuery("select ID,NAME from BOOKS");
                  %>
                  <table class="table table-striped">
                  <tr class="active">
                        
                   <form action="status.jsp">
                        <th>SNO</th>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>SELECT</th>

                  </tr>

                  
                 
                  <%
                  int c = 1;
                  while(res.next())
                  {

                        String b = res.getString(2);
                        int id = res.getInt(1);
                       // b = b.toUpperCase();
                        if(name.equals(b))
                        {
                              %>


                              <tr>
                              <td><%out.print(c++);%></td>
                               <td><%out.print(id);%></td>
                              <td colspan="2"><font size="5" color="Black"><%

                              int issued = 0;
                              for(int i=0;i<c_st;i++)
                              {
                                  //String u = strike[i];
                                  //u = u.toUpperCase();
                                  if(b.equals(strike[i]))
                                  {
                                    issued = 1;
                                    break;
                                  }
                              }
                              if(issued==0)
                                out.print(b);
                              else
                                %><del><%out.print(b);%></del><%
                                %></td>
                              <td><input type="checkbox" name="book" value="<%out.print(b);%>"/>
                              </td>
                              </tr>
                              <%

                        }

                  }
                  %>
                  <tr>
                        <td colspan="4"><button input type = "submit" value="SUBMIT" class="btn btn-danger">SUBMIT</button></td>
                  </tr>
            </form>
            </table><%

            }
            else if(result.equals("auth"))
            {

            }
            else if(result.equals("cat"))
            {
                 res = stmt.executeQuery("select b.NAME,c.NAME,b.ID from BOOK as b,CATEGORY as c where b.ID=c.ID and c.NAME='"+name+"'");
                 int C=1;
                 %>
                 <center>
                 <br>
                 <table class="table table-striped">
                       <form action="status.jsp">
                 <tr class="active">
                        <th><b><font size="4" face="Courier New">SNO</th>
                        <th><b><font size="4" face="Courier New">ID</th>
                        <th ><center><b><font size="4" face="Courier New">NAME</th>
                        <th><b><font size="4" face="Courier New">SELECT</th>
                 </tr>

                 <%
                 while(res.next())
                 {
                       String b = res.getString(2);
                       String c = res.getString(1);
                       int id = res.getInt(3);
                       if(name.equals(b))
                       {
                             %>

                             <tr>
                             <td><b><font size="4" face="Courier New"><%out.print(C++);%></td>
                             <td><font size="4" face="Courier New"><%out.print(name);%></font></td>
                             <td><font size="4" face="courier New"><b>
                              <%

                              int issued = 0;
                              for(int i=0;i<c_st;i++)
                              {
                                  if(c.equals(strike[i]))
                                  {
                                    issued = 1;
                                    break;
                                  }
                              }
                              if(issued==0)
                              {
                                out.print(c);
                                %>
                                 </td>
                             
                             <td><input type="checkbox" name="book" value="<%out.print(c);%>"/>
                             <%

                              }
                              else
                              {
                                     %><button class="btn btn-danger" disabled><font size="4" face="courier New"><del><b><%out.print(c);%></del></font></button><%
                                %>
                                </font></button>
                            
                             </td>
                             <%
                              }
                               %>
                             </tr>
                             <%

                       }

                 }
                 %>
                 <tr>

                 <td colspan="5"><center><button input type = "submit" value="SUBMIT" class="btn btn-danger"><h4>&nbsp&nbsp&nbsp&nbspSUBMIT&nbsp&nbsp&nbsp&nbsp</h4></button></td></tr>
           </form></table><%
     }
      %>


      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
      
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src = "//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>


</body>
</html>
