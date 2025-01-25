<%-- 
    Document   : notify
    Created on : 20-Dec-2022, 7:02:34 pm
    Author     : Sowmi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="mypackage.SendEmail"%>
<%
    String username = (String) session.getAttribute("Nam");
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
    Statement st = con.createStatement();
    ResultSet resultset = st.executeQuery("select userid from credentials where username = '" + username + "'");
    resultset.next();
    String myid = resultset.getString(1); 
    int mid=Integer.parseInt(myid);
   

    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    Statement stt = con.createStatement();
     Statement stment = con.createStatement();
    ResultSet rs1 = st1.executeQuery("select blood, city, hospital, reqid, fname, lname, phone from search where status=false");
    
    int u;
    while(rs1.next()){
        String blood = rs1.getString(1);
        String city = rs1.getString(2);
        String hospital = rs1.getString(3);
        String reqid = rs1.getString(4);
        String fname = rs1.getString(5);
        String lname = rs1.getString(6);
        String contact = rs1.getString(7);
        
        if(blood.equals("A+")){
            ResultSet rs2 = st2.executeQuery("select userid from details where (blood='A+' or blood='A-' or blood='O+' or blood='O-') and city='"+city
            +"' and ({fn TIMESTAMPDIFF(SQL_TSI_DAY, lastdonated,CURRENT_DATE)}>=90 or donated=false)");
            while(rs2.next()){
                String i = rs2.getString(1);
                u=Integer.parseInt(i);
                ResultSet rs3 = stt.executeQuery("select reqid from eligible where reqid="+reqid);
                if(!rs3.next()){
                st3.executeUpdate("INSERT INTO eligible (userid,reqid, hospital, city, fname, lname,contact) " 
                + "VALUES (" +u+","+reqid + ",'" + hospital + "','" + city + "','"+fname+"','"+lname+"','"+contact+"')"); 
                ResultSet rset = stment.executeQuery("select email from credentials where userid = " + u);
                rset.next();
                String toAddress = rset.getString(1);
                System.out.println(toAddress);
                SendEmail s = new SendEmail(toAddress,fname,lname,contact,hospital,city,blood);
                s.sendingMailToRecipient();
                }
            }
           
        }
        else if(blood.equals("A-")){
            ResultSet rs2 = st2.executeQuery("select userid from details where (blood='A-' or blood='O-') and city='"+city+"' and ({fn TIMESTAMPDIFF(SQL_TSI_DAY, lastdonated,CURRENT_DATE)}>=90 or donated=false)");
            while(rs2.next()){
                String i = rs2.getString(1);
                u=Integer.parseInt(i);
                ResultSet rs3 = stt.executeQuery("select reqid from eligible where reqid="+reqid);
                if(!rs3.next()){
                st3.executeUpdate("INSERT INTO eligible (userid,reqid, hospital, city, fname, lname,contact) " + "VALUES (" +u+","+reqid + ",'" + hospital + "','" + city + "','"+fname+"','"+lname+"','"+contact+"')"); 
                ResultSet rset = stment.executeQuery("select email from credentials where userid = " + u);
                rset.next();
                String toAddress = rset.getString(1);
                SendEmail s = new SendEmail(toAddress,fname,lname,contact,hospital,city,blood);
                s.sendingMailToRecipient();
                }
            }
        
        }
        else if(blood.equals("B+")){
            ResultSet rs2 = st2.executeQuery("select userid from details where (blood='B+' or blood='B-' or blood='O+' or blood='O-') and city='"+city+"' and ({fn TIMESTAMPDIFF(SQL_TSI_DAY, lastdonated,CURRENT_DATE)}>=90 or donated=false)");
            while(rs2.next()){
                String i = rs2.getString(1);
                u=Integer.parseInt(i);
                ResultSet rs3 = stt.executeQuery("select reqid from eligible where reqid="+reqid);
                if(!rs3.next()){
                st3.executeUpdate("INSERT INTO eligible (userid,reqid, hospital, city, fname, lname,contact) " + "VALUES (" +u+","+reqid + ",'" + hospital + "','" + city + "','"+fname+"','"+lname+"','"+contact+"')"); 
                ResultSet rset = stment.executeQuery("select email from credentials where userid = " + u);
                rset.next();
                String toAddress = rset.getString(1);
                SendEmail s = new SendEmail(toAddress,fname,lname,contact,hospital,city,blood);
               
                s.sendingMailToRecipient();
                }
            }
           
        }
        else if(blood.equals("B-")){
            ResultSet rs2 = st2.executeQuery("select userid from details where (blood='B-' or blood='O-') and city='"+city+"' and ({fn TIMESTAMPDIFF(SQL_TSI_DAY, lastdonated,CURRENT_DATE)}>=90 or donated=false)");
            while(rs2.next()){
                String i = rs2.getString(1);
                u=Integer.parseInt(i);
                ResultSet rs3 = stt.executeQuery("select reqid from eligible where reqid="+reqid);
                if(!rs3.next()){
                st3.executeUpdate("INSERT INTO eligible (userid,reqid, hospital, city, fname, lname,contact) " + "VALUES (" +u+","+reqid + ",'" + hospital + "','" + city + "','"+fname+"','"+lname+"','"+contact+"')"); 
                ResultSet rset = stment.executeQuery("select email from credentials where userid = " + u);
                rset.next();
                String toAddress = rset.getString(1);
                 SendEmail s = new SendEmail(toAddress,fname,lname,contact,hospital,city,blood);
                s.sendingMailToRecipient();
                }
            }
        
        }
        else if(blood.equals("AB+")){
            ResultSet rs2 = st2.executeQuery("select userid from details where city='"+city+"' and ({fn TIMESTAMPDIFF(SQL_TSI_DAY, lastdonated,CURRENT_DATE)}>=90 or donated=false)");
            while(rs2.next()){
                String i = rs2.getString(1);
                u=Integer.parseInt(i);
                ResultSet rs3 = stt.executeQuery("select reqid from eligible where reqid="+reqid);
                if(!rs3.next()){
                st3.executeUpdate("INSERT INTO eligible (userid,reqid, hospital, city, fname, lname,contact) " + "VALUES (" +u+","+reqid + ",'" + hospital + "','" + city + "','"+fname+"','"+lname+"','"+contact+"')"); 
                ResultSet rset = stment.executeQuery("select email from credentials where userid = " + u);
                rset.next();
                String toAddress = rset.getString(1);
                 SendEmail s = new SendEmail(toAddress,fname,lname,contact,hospital,city,blood);
                s.sendingMailToRecipient();
                }
            }
        
        }
        else if(blood.equals("AB-")){
            ResultSet rs2 = st2.executeQuery("select userid from details where (blood='AB-' or blood='A-' or blood='B-' or blood='O-') and city='"+city+"' and ({fn TIMESTAMPDIFF(SQL_TSI_DAY, lastdonated,CURRENT_DATE)}>=90 or donated=false)");
            while(rs2.next()){
                String i = rs2.getString(1);
                u=Integer.parseInt(i);
               ResultSet rs3 = stt.executeQuery("select reqid from eligible where reqid="+reqid);
                if(!rs3.next()){
                st3.executeUpdate("INSERT INTO eligible (userid,reqid, hospital, city, fname, lname,contact) " + "VALUES (" +u+","+reqid + ",'" + hospital + "','" + city + "','"+fname+"','"+lname+"','"+contact+"')"); 
                ResultSet rset = stment.executeQuery("select email from credentials where userid = " + u);
                rset.next();
                String toAddress = rset.getString(1);
                 SendEmail s = new SendEmail(toAddress,fname,lname,contact,hospital,city,blood);
                s.sendingMailToRecipient();
                }
            }
        
        }
        else if(blood.equals("O+")){
            ResultSet rs2 = st2.executeQuery("select userid from details where (blood='O+' or blood='O-') and city='"+city+"' and ({fn TIMESTAMPDIFF(SQL_TSI_DAY, lastdonated,CURRENT_DATE)}>=90 or donated=false)");
            while(rs2.next()){
                String i = rs2.getString(1);
                u=Integer.parseInt(i);
                ResultSet rs3 = stt.executeQuery("select reqid from eligible where reqid="+reqid);
                if(!rs3.next()){
                st3.executeUpdate("INSERT INTO eligible (userid,reqid, hospital, city, fname, lname,contact) " + "VALUES (" +u+","+reqid + ",'" + hospital + "','" + city + "','"+fname+"','"+lname+"','"+contact+"')"); 
                ResultSet rset = stment.executeQuery("select email from credentials where userid = " + u);
                rset.next();
                String toAddress = rset.getString(1);
                SendEmail s = new SendEmail(toAddress,fname,lname,contact,hospital,city,blood);
                s.sendingMailToRecipient();
                }
            }
        
        }
        else if(blood.equals("O-")){
            ResultSet rs2 = st2.executeQuery("select userid from details where blood='O-' and city='"+city+"' and ({fn TIMESTAMPDIFF(SQL_TSI_DAY, lastdonated,CURRENT_DATE)}>=90 or donated=false)");
            while(rs2.next()){
                String i = rs2.getString(1);
                u=Integer.parseInt(i);
                ResultSet rs3 = stt.executeQuery("select reqid from eligible where reqid="+reqid);
                if(!rs3.next()){
                st3.executeUpdate("INSERT INTO eligible (userid,reqid, hospital, city, fname, lname,contact) " + "VALUES (" +u+","+reqid + ",'" + hospital + "','" + city + "','"+fname+"','"+lname+"','"+contact+"')"); 
                ResultSet rset = stment.executeQuery("select email from credentials where userid = " + u);
                rset.next();
                String toAddress = rset.getString(1);
                 SendEmail s = new SendEmail(toAddress,fname,lname,contact,hospital,city,blood);
                s.sendingMailToRecipient();
                } 
            }
        
        }
        
    }
    
    
    

%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>BloodCount!</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <!--<link href="assets/img/favicon.png" rel="icon">-->
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Impact - v1.1.1
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
<!--  <section id="topbar" class="topbar d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">contact@example.com</a></i>
        <i class="bi bi-phone d-flex align-items-center ms-4"><span>+1 5589 55488 55</span></i>
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
      </div>
    </div>
  </section> End Top Bar -->

  <header id="header" class="header d-flex align-items-center" style="background-color:teal;">

        <div class="container-fluid container-xl d-flex align-items-center justify-content-between ">
            <a href="index.html " class="logo d-flex align-items-center ">
                <!-- Uncomment the line below if you also wish to use an image logo -->
                <!-- <img src="assets/img/logo.png " alt=" "> -->
                <h1>Blood<span style="color:burlywood;">Count!</span></h1>
            </a>
            <nav id="navbar " class="navbar ">
                <ul>
                    <li><a href="welcome.jsp">Home</a></li>
                    <li><a href="welcome.jsp#about ">About</a></li>
                    <!-- <li><a href="#services ">Services</a></li>
                    <li><a href="#portfolio ">Portfolio</a></li>
                    <li><a href="#team ">Team</a></li>-->
                    <li>
                        <a href="notify.jsp ">Notification</a>
                    </li>
                    <li class="dropdown "><a href="# "><span>Donate Blood</span> <i class="bi bi-chevron-down dropdown-indicator "></i></a>
                        <ul>
                           
                            <!-- <li class="dropdown "><a href="# "><span>Deep Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator "></i></a>
                                <ul>
                                    <li><a href="# ">Deep Drop Down 1</a></li>
                                    <li><a href="# ">Deep Drop Down 2</a></li>
                                    <li><a href="# ">Deep Drop Down 3</a></li>
                                    <li><a href="# ">Deep Drop Down 4</a></li>
                                    <li><a href="# ">Deep Drop Down 5</a></li>
                                </ul>
                            </li> -->
                             <li><a href="appointment.jsp">Get Appointment</a></li>
                            <li><a href="camps.jsp">Blood Donation camps</a></li>
                            <!--<li><a href="# ">Voluntary Donar Group</a></li>-->
                            <li><a href="welcome.jsp#about">About Blood donation</a></li>
                        </ul>
                    </li>
                    <li class="dropdown "><a href="# "><span>Search for Blood</span> <i class="bi bi-chevron-down dropdown-indicator "></i></a>
                        <ul>
                            <!-- <li><a href="# ">Donate Blood</a></li>
                            <li class="dropdown "><a href="# "><span>Deep Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator "></i></a>
                                <ul>
                                    <li><a href="# ">Deep Drop Down 1</a></li>
                                    <li><a href="# ">Deep Drop Down 2</a></li>
                                    <li><a href="# ">Deep Drop Down 3</a></li>
                                    <li><a href="# ">Deep Drop Down 4</a></li>
                                    <li><a href="# ">Deep Drop Down 5</a></li>
                                </ul>
                            </li> -->
                            <li><a href="searchblood.jsp" >Search for Blood</a></li>
                            <li><a href="avail.jsp ">Blood availability</a></li>
                            <li><a href="directory.jsp ">Blood bank directory</a></li>
                             <li><a href="#" >Thalassemia</a></li>
                            <!-- <li><a href="# ">Drop Down 4</a></li> -->
                        </ul>
                    </li>
                    <li class="dropdown "><a href="# "><span>Welcome <%= username%><br>&nbsp;&nbsp;&nbsp;&nbsp;userid:<%= myid%> </span> <i class="bi bi-chevron-down dropdown-indicator "></i></a>
                        <ul>
                            <li><a href="index.html">Logout</a></li>
                             <li><a href="addbb.jsp">Add bloodbank</a></li>
                        </ul>
                    </li>
                    <!--<li><a href="#contact ">Login</a></li>-->
                </ul>
            </nav>
            <!-- .navbar -->

            <i class="mobile-nav-toggle mobile-nav-show bi bi-list "></i>
            <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x "></i>

        </div>
    </header>
                <div class="breadcrumbs">
<!--      <div class="page-header d-flex align-items-center" style="background-image: url('');">
        <div class="container position-relative">
          <div class="row d-flex justify-content-center">
            <div class="col-lg-6 text-center">
              <h2>Blog</h2>
              <p>Odio et unde deleniti. Deserunt numquam exercitationem. Officiis quo odio sint voluptas consequatur ut a odio voluptatem. Sit dolorum debitis veritatis natus dolores. Quasi ratione sint. Sit quaerat ipsum dolorem.</p>
            </div>
          </div>
        </div>
      </div>-->
      <nav>
        <div class="container">
          <ol>
              <li><a href="welcome.jsp" style="color: red">Home</a></li>
            <li>Profile</li>
          </ol>
        </div>
      </nav>
    </div><!-- End Breadcrumbs -->
  <!-- End Header -->

  <%
 Statement st4 = con.createStatement();
    ResultSet rst = st4.executeQuery("select distinct reqid, hospital, city, fname, lname, contact, userid from eligible where status=false and userid = " + mid);
    while(rst.next()){

%>

  <main id="main">
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row gy-4 posts-list">

          <div class="col-xl-4 col-md-6">
            <article>

              <div class="post-img">
                <img src="https://www.seekpng.com/png/detail/251-2517178_blood-logo-www-blood-donation-png-logo.png" alt="" class="img-fluid">
              </div>

                <p class="post-category">Request ID:&nbsp;<%= rst.getString(1)%></p>

              <h2 class="title">
                  <a href="#"><%= rst.getString(2)%>, <%= rst.getString(3)%></a>
              </h2>

              <div class="d-flex align-items-center">
                <img src="https://img.favpng.com/5/13/22/blood-donation-blood-bank-world-blood-donor-day-png-favpng-fsJ0SEBYtsXeQp0QdcS2QuTTG.jpg" alt="" class="img-fluid post-author-img flex-shrink-0">
                <div class="post-meta">
                  <p class="post-author-list"><%= rst.getString(4)%> <%= rst.getString(5)%></p>
                  <p class="post-date">
                    <time datetime="2022-01-01"><%= rst.getString(6)%></time>
                    <%
                        Statement st5 = con.createStatement();
                        ResultSet rst1 = st5.executeQuery("select blood from search s, eligible e where e.reqid = s.reqid");
                        if(rst1.next())
                        { %>
                        <time><form method = "post" action = "donate.jsp"><input type="hidden" name="reqid" value="<%= rst.getString(1)%>"><input type="hidden" name="blood" value="<%= rst1.getString(1)%>"><input type="hidden" name="hosp" value="<%= rst.getString(2)%>"><input type="hidden" name="city" value="<%= rst.getString(3)%>"><button><i class="fa-solid fa-droplet"></i>&nbsp;donate now</button></form></time>
                        <%}%>
                   
                  
                  </p>
                </div>
              </div>

            </article>
          </div>
      </div>
     <%}%>     
     <!-- End blog posts list -->
<!--    <div class="blog-pagination">
      <ul class="justify-content-center">
        <li><a href="#">1</a></li>
        <li class="active"><a href="#">2</a></li>
        <li><a href="#">3</a></li>
      </ul>
    </div> End blog pagination -->

   </div>
</section><!-- End Blog Section -->

</main><!-- End #main -->

  <!-- ======= Footer ======= -->
  

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>