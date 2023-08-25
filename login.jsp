<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>

<html>
<title>LOGIN</title>
      <head>
            <!--minfied CSS compiled -->
            <link href = "//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel = "stylesheet">

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

            <script>
                // Get the video
                var video = document.getElementById("myVideo");

                // Get the button
                var btn = document.getElementById("myBtn");

                // Pause and play the video, and change the button text
                function myFunction() 
                {
                      if (video.paused) 
                      {
                          video.play();
                          btn.innerHTML = "Pause";
                      } 
                      else 
                      {
                          video.pause();
                          btn.innerHTML = "Play";
                      }
                }
            </script>



            <style>

                 /* Style the video: 100% width and height to cover the entire window */
               #myVideo {
                        position: fixed;
                        right: 0;     
                        bottom: 0;
                        min-width: 100%;
                        min-height: 100%;
                  }
                body
                {
                  background-image:url("cells.gif");
                  
                  background-size: 100%;
                }
                .carousel-inner{
                  width:100%;
                  max-height:400px;
                }
                #wrapper {
                  top: 700px;
                  left: 30px;
                  position: absolute;
                  
                }
                #wrapper2 {
                  top: 700px;
                  right: 30px;
                  position: absolute;
                  
                }
                
            </style>

      </head>
      <body>
      
<%
      Class.forName("com.mysql.jdbc.Driver");
      String connectionURL= "jdbc:mysql://localhost:3306/Diablo";

      Connection connection = null;
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Library","root","pagal.com");

      Statement stmt=null;
      Statement stmt2 = null;
      Statement stmt3 = null;
      PreparedStatement prep=null;
      ResultSet res=null;
      ResultSet res2=null;
      ResultSet res3 = null;
      stmt = connection.createStatement();
      stmt2 = connection.createStatement();
      stmt3 = connection.createStatement();      

%>          

       <!-- <video autoplay muted loop id="myVideo">
            <source src="back.mp4" type="video/mp4">
            </video>-->


         <%
          //FINE CALCULATION

          res = stmt.executeQuery("show tables");
          String who_stu[] = new String[100];
          int c_who=0;
          while(res.next())
          {
              String table_name = res.getString(1);
              //out.println(table_name);
              res2 = stmt2.executeQuery("select NAME from STUDENT");
              int created=0;
              while(res2.next())
              {
                  String stu_name = res2.getString(1);
                  if(stu_name.length()>0 && stu_name.equalsIgnoreCase(table_name) )
                  {
                      created=1;
                      //out.print(stu_name+" "+table_name);
                      who_stu[c_who++]=table_name;                //got names of students who have issued any book
                      break;
                  }

              }
          }
          /*for(int i=0;i<c_who;i++)
            out.println(who_stu[i]+"\n");*/
          for(int i=0;i<c_who;i++)
          {
                String comp_name = who_stu[i];
                //out.println(comp_name);
                
                res2 = stmt2.executeQuery("select CURDATE()");
                res2.next();
                String cur = res2.getString(1);
                //out.println(cur);
               res = stmt.executeQuery("select END from "+comp_name);
               int sno = 1;
                while(res.next())
                {         
                          String end = res.getString(1);
                          res3 = stmt3.executeQuery("select timestampdiff(DAY,STR_TO_DATE('"+end+"', '%Y-%m-%d'),CURDATE())");
                          res3.next();
                          int diff = res3.getInt(1);
                          //out.println(diff);
                          if(diff>0)
                          {
                                  prep = connection.prepareStatement("UPDATE "+comp_name+" set FINE =  ? where SNO=?");
                                  prep.setInt(1,diff*5);
                                  prep.setInt(2,sno);
                                  prep.executeUpdate();
                          }
                          sno++;
                }
                %><br><%

          }

          //END FINE CALCULATION



         %>

          <div class="container">
            <div class="row">
                <div class="col-sm-12">

                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="lib3.jpg" alt="LIBRARY" >
                                <div class="carousel-caption">
                                    <h1>LMS</h1>
                                    <p>LIBRARY MANAGEMENT SYSTEM</p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="lib2.jpg" alt="LIBRARY2" >
                                <div class="carousel-caption">
                                    <h1>LMS</h1>
                                    <p>LIBRARY MANAGEMENT SYSTEM</p>
                                </div>
                            </div>

                            <div class="item">
                                <img src="libr.jpg" alt="LIBRARY2" >
                                <div class="carousel-caption">
                                    <h1>LMS</h1>
                                    <p>LIBRARY MANAGEMENT SYSTEM</p>
                                </div>
                            </div>
                            
                        </div>

                      <!-- Controls -->
                      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                      </a>
                      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                      </a>
                    </div>
                </div>
            


              
            


                 <center>

                 <div class = "jumbotron" style="background:white !important">

            <h1><b><font color="#0f68b3">Library Management System</font></b></h1>
            </div>

           <div id = "wrapper">
            <div class="mx-auto" style="width: 600px;">
          
             <div class="panel panel-primary">
               <div class="panel-heading">
               <h1 class="panel-title"><h1><b>LOGIN</b></h1></h1></div>
              <div class="panel-body">

           

            <form class = "form-inline" action = "login_res.jsp" >
              <!--<table class = "table ">
              <tr class="active ">-->
              <div class = "form-group row">
                  <div class="col-lg-12">
                <label for = "first" class ="sr-only">First Name</label>
                   <font size="4" face="Courier New"><b>FIRST-NAME</b></font><br><input type="text" name="first" id="first" class="form-control" placeholder="USERNAME" size="50%" required="required" style="font-size:15px;font-family:Courier New;font-weight: bold;"/>
                    </div></div>
                    <br>
                    <br>
                   <div class = "form-group row">
                            <div class="col-lg-12">
                   <label for = "first" class = "sr-only">Password</label>
                    <font size="4" face="Courier New"><b>PASSWORD</b></font><br><input type="password" name="pass" id="pass" class="form-control" placeholder="PASSWORD" size="50%" required="required" style="font-size:15px;font-family:Courier New;font-weight: bold;"/>
                   </div></div>
                  <br>
                  <br>
                   <center> <font size="4" face="Courier New"><b>Admin</b></font></font></b>&nbsp&nbsp&nbsp&nbsp&nbsp<input type="radio" name="admin" value="yes" checked/><br>

                     <font size="4" face="Courier New"><b>Student</b></font></font></b>&nbsp&nbsp&nbsp&nbsp<input type = "radio" name="admin" value="no"/>
                   <br><br>
              <tr><th><center><button class = "btn btn-danger" type="submit" value = "SUBMIT"><h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSUBMIT&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h4></button></center></th></tr>
            </form>
            </div>
            </div>
            </div>
            </div>
            
            <br><br>

            <div id = "wrapper2">
            <div class="mx-auto" style="width: 650px;">
          
             <div class="panel panel-primary">
               <div class="panel-heading">
               <h1 class="panel-title"><h1><b>REGISTER</b></h1></h1></div>
              <div class="panel-body">

           
            
            

            <form class ="form-inline" action = "register_res.jsp" >
            <center>
                <div class = "form-group row">
                  <div class="col-lg-12">
                <label for = "first" class ="sr-only">First Name</label>
                   <font size="4" face="Courier New"><b>FIRST-NAME</b></font><br><input type = "text" name = "first"  id="first" class="form-control" placeholder="FIRST-NAME" size="50%" required="required" style="font-size:15px;font-family:Courier New;font-weight: bold;"/>
                  <br>
                  <br>
                  <div class = "form-group row">
                  <div class="col-lg-12">
                <label for = "first" class ="sr-only">Password</label>
                   <font size="4" face="Courier New"><b>PASSWORD</b></font><br><input type = "password" name = "pass"  id="pass" class="form-control" placeholder="PASSWORD" size="50%" required="required" style="font-size:15px;font-family:Courier New;font-weight: bold;"/>

                  <br>
                  <br>
                  <div class = "form-group row">
                  <div class="col-lg-12">
                <label for = "first" class ="sr-only">SEX</label>
                    <font size="4" face="Courier New"><b>SEX</b></font><br><input type = "text" name = "sex" id="sex" class="form-control" placeholder="SEX" size="50%" required="required" style="font-size:15px;font-family:Courier New;font-weight: bold;"/>

                   <br>
                   <br>
                   <div class = "form-group row">
                  <div class="col-lg-12">
                <label for = "first" class ="sr-only">DOB(YYYY/MM/DD)</label>
                   <font size="4" face="Courier New"><b>DOB</b></font><br><input type="text" name = "dob" id="dob" class="form-control" placeholder="DOB(YYYY/MM/DD)" size="50%" required="required" style="font-size:15px;font-family:Courier New;font-weight: bold;"/>
                  <br>
                  <br>
                  <div class = "form-group row">
                  <div class="col-lg-12">
                <label for = "first" class ="sr-only">DEPARTMENT</label>
                   <font size="4" face="Courier New"><b>DEPARTMENT</b></font><br><input type="text" name="dept" id="dept" class="form-control" placeholder="DEPARTMENT" size="50%" required="required" style="font-size:15px;font-family:Courier New;font-weight: bold;"/>


                  <br>
                  <br>
                  <button class = "btn btn-danger" input type = "submit" value="SUBMIT"><h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSUBMIT&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h4></button>
           </form>
            
     </center>
     </center>
     </div>
     </div>
     </div>
     </div>



       

     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
      
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src = "//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
      </body>
</html>
