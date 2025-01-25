<%-- 
    Document   : notify
    Created on : 20-Dec-2022, 7:02:34 pm
    Author     : Sowmi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*, java.util.*"%>

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
    ResultSet rs1 = st1.executeQuery("select bname, city, district, state, category, contact, email from bloodbank");
   
       
    
    
    
    

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
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
  <style>
    @import url(https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css);
/*      .rating>input{
  display: none;
}

.rating>label::before{
  content: '\f005';
  font-family: FontAwesome;
  margin: 5px;
  font-size: 1.5rem;
  display: inline-block;
  cursor: pointer;
}

.rating>.half::before{
  content: '\f089';
  position: absolute;
}

.rating>label{
  color:#ddd;
  float: right;
  transform: 0.2s;
}

.rating > input:checked ~ label,
.rating:not(:checked) > label:hover,
.rating:not(:checked) > label:hover ~ label
{
  color:gold;
}*/
#myrate{
    width: 30px;
}
  </style>
  <script>
      const radioElement=document.querySelectorAll('input');

const rating=document.querySelector('.rating-value');

radioElement.forEach((radio)=>{
  radio.addEventListener('click',()=>{
      let value=radio.value;
      rating.innerText=`${value} of 5`;
  });
});
function myformsub(element){
console.log("hi");
       var ratediv = element.parentNode;
       var formtag=ratediv.parentNode;
       var postdiv = formtag.parentNode;
       var dflex=postdiv.parentNode;
       var art=dflex.parentNode;
       var result = art.parentNode;
       alert(result.id);
//       var bname=document.getElementById("mydiv"+i).querySelector("#fname").querySelector("#r").querySelector("#bname").value;
//       var rate= document.getElementById("mydiv"+i).querySelector("#r").querySelector('input[name="rating"]:checked').value;   
//       alert(bname+" ,"+rate);
    

}
      </script>
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
                    <li><a href="welcome.jsp#about">About</a></li>
                    <!-- <li><a href="#services ">Services</a></li>
                    <li><a href="#portfolio ">Portfolio</a></li>
                    <li><a href="#team ">Team</a></li>-->
                    <li>
                        <a href="notify.jsp">Notification</a>
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

  

  <main id="main">
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">
          <h2>Recommended</h2>
        <div class="row gy-4 posts-list">
            <%
                for(int k=1;k<=6;k++){
                    String bid=request.getParameter("bid"+k);
                    int n = Integer.parseInt(bid);
                    ResultSet r2 = st3.executeQuery("select bname, city, district, state, category, contact, email from bloodbank where bid = " + n);
                    r2.next();
             %>  
             <div class="col-xl-4 col-md-6">
            <article>

              <div class="post-img">
                <img src="https://www.seekpng.com/png/detail/251-2517178_blood-logo-www-blood-donation-png-logo.png" alt="" class="img-fluid">
              </div>

              

              <h2 class="title">
                  <a href="blog-details.html"><%= r2.getString(1)%></a>
              </h2>
              <h6>
                  <%= r2.getString(2)%>, <%= r2.getString(3)%>,<%= r2.getString(4)%>
              </h6>

              <div class="d-flex align-items-center">
                <img src="https://img.favpng.com/5/13/22/blood-donation-blood-bank-world-blood-donor-day-png-favpng-fsJ0SEBYtsXeQp0QdcS2QuTTG.jpg" alt="" class="img-fluid post-author-img flex-shrink-0">
                <div class="post-meta">
                  <p class="post-author-list"><%= r2.getString(5)%></p>
                  <p class="post-date">
                      <time datetime="2022-01-01"><%= r2.getString(6)%></time><br>
                    <time datetime="2022-01-01"><%= r2.getString(7)%></time>                  
                  </p>
                   
                       
    
                </div>
              </div>

            </article>
          </div>
            <%        
                }
            
            
            %>
            
            <!--end of recommended-->
            <h2>All Blood Banks</h2>
            <hr>
            <%int i=1;%>
    <% while(rs1.next()){%>
          <div class="col-xl-4 col-md-6" id="mydiv<%= i%>">
            <article>

              <div class="post-img">
                <img src="https://www.seekpng.com/png/detail/251-2517178_blood-logo-www-blood-donation-png-logo.png" alt="imgg" class="img-fluid">
              </div>

              

              <h2 class="title">
                  <a href="blog-details.html"><%= rs1.getString(1)%></a>
              </h2>
              <h6>
                  <%= rs1.getString(2)%>, <%= rs1.getString(3)%>,<%= rs1.getString(4)%>
              </h6>

              <div class="d-flex align-items-center">
                <img src="https://img.favpng.com/5/13/22/blood-donation-blood-bank-world-blood-donor-day-png-favpng-fsJ0SEBYtsXeQp0QdcS2QuTTG.jpg" alt="" class="img-fluid post-author-img flex-shrink-0">
                <div class="post-meta">
                  <p class="post-author-list"><%= rs1.getString(5)%></p>
                  <p class="post-date">
                      <time datetime="2022-01-01"><%= rs1.getString(6)%></time><br>
                    <time datetime="2022-01-01"><%= rs1.getString(7)%></time>                  
                  </p>
                   
                       <form action ="rating.jsp" id="fname">
                           <div class="rating" id="r">
                           <input type="hidden" name="bname<%= i%>" id="bname" value="<%= rs1.getString(1)%>">
                           <input type="hidden" name="iter"  value="<%= i%>">
                          <% ResultSet rs2= st2.executeQuery("select rate from rating where userid="+mid+" and bloodbank='"+rs1.getString(1)+"'");
                           if(rs2.next()){
                          %>
                                            Your rating &nbsp;<input type="number" name="rating<%= i%>" id="myrate" value='<%= rs2.getString(1)%>'>&nbsp;/5
                          <%}else{%>
                                            Your rating &nbsp;<input type="number" name="rating<%= i%>" id="myrate">&nbsp;/5
                           <%}%>
      <button type="submit">Rate </button>
      </div>
                       </form>
    
                </div>
              </div>

            </article>
          </div>
                           <% i=i+1;System.out.println("i="+i);}%>
                     
      </div>
         
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
<!--  <footer id="footer" class="footer">

    <div class="container">
      <div class="row gy-4">
        <div class="col-lg-5 col-md-12 footer-info">
          <a href="index.html" class="logo d-flex align-items-center">
            <span>Impact</span>
          </a>
          <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus.</p>
          <div class="social-links d-flex mt-4">
            <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

        <div class="col-lg-2 col-6 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Terms of service</a></li>
            <li><a href="#">Privacy policy</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-6 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#">Web Design</a></li>
            <li><a href="#">Web Development</a></li>
            <li><a href="#">Product Management</a></li>
            <li><a href="#">Marketing</a></li>
            <li><a href="#">Graphic Design</a></li>
          </ul>
        </div>

        <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start">
          <h4>Contact Us</h4>
          <p>
            A108 Adam Street <br>
            New York, NY 535022<br>
            United States <br><br>
            <strong>Phone:</strong> +1 5589 55488 55<br>
            <strong>Email:</strong> info@example.com<br>
          </p>

        </div>

      </div>
    </div>

    <div class="container mt-4">
      <div class="copyright">
        &copy; Copyright <strong><span>Impact</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
         All the links in the footer should remain intact. 
         You can delete the links only if you purchased the pro version. 
         Licensing information: https://bootstrapmade.com/license/ 
         Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/impact-bootstrap-business-website-template/ 
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>

  </footer> End Footer -->
  <!-- End Footer -->

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