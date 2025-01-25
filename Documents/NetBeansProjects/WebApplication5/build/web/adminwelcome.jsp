<%-- 
    Document   : adminwelcome
    Created on : 20-Dec-2022, 6:01:23 pm
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

    ResultSet rs = st.executeQuery("select filled from credentials c where c.username = '" + username + "'");
    rs.next();
    String f=rs.getString(1);
    int n = Integer.parseInt(f); 

    Statement st1 = con.createStatement();
    ResultSet rs1 = st1.executeQuery("select * from search order by time desc");
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>BloodCount!</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <!-- <link href="assets/img/favicon.png" rel="icon"> -->
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
            <!-- =======================================================
  * Template Name: Impact - v1.1.1
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
             <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
             <style>
                   @import url('https://fonts.googleapis.com/css2?family=Lora:ital,wght@1,500&family=Merriweather:ital,wght@1,300&family=Orelega+One&family=Updock&display=swap');
             @import url('https://fonts.googleapis.com/css2?family=Lora:ital,wght@1,500&family=Merriweather:ital,wght@1,300&family=Orelega+One&family=Updock&display=swap');
            #myform{
                padding-top: 30px;
                color: white;
            }
            #val{
                margin: 5px;
            }
            #customers {
                margin: 50px;
                /*margin-right: 30px;*/
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 92%;
                font-family: 'Merriweather', serif;
                text-align: center;
            }

            #customers td, #customers th {
                border: 1px solid #ddd;
                /*padding: 8px;*/
            }

            #customers tr{
                background-color: white;
            }
            #btn{
                background-color: white; 
                border: none;
                color: black;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                border-radius: 4px;
                cursor: pointer;
                box-shadow: 0px 0px 2px 2px rgb(0,0,0);
            }
            #btn:hover {
                background-color:#bab7ad;
                transition: 0.5s;
            }
            input {
                border: 2px solid #10144a;
                border-radius: 4px;
             }
             input[type=text]:focus {
                border: 3px solid #555;
             }
/*                   .modal-container{
                display: none;
                background-color: rgba(0,0,0,0.3);
                position: fixed;
                top:0;
                opacity: 0;
                pointer-events: none;
                left: 0;
                height: 100vh;
                width: 100vw;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .modal-container.sh{
                opacity: 1;
                pointer-events: auto;
            }*/
            .modal{
                background-color: rgba(0, 0, 0, 0);
                width: 600px;
                height: 600px;
                margin: 5px;
                margin-left: 340px;
/*                margin-top: 200px;
                margin-bottom: 200px;*/
                max-width: 100%;
                padding: 20px 20px;
                border-radius: 5px;
               
                /*text-align: center;*/
            }
            
            .modal h1{
                margin: 0;
            }
            .close{
                opacity: 0.7;
                float: right;
                margin-right: 20px;
                margin-top: 5px;
                border: none;
                /*font-size: 20px;*/
                font-family: 'Merriweather', serif;
                color: black;
            }

            .close,#open{
                font-family: 'Merriweather', serif;
            }
            
            
            
            .cont {
    height: 560px;
    width: 500px;
    background-color: white;
    box-shadow: 8px 8px 20px rgb(128, 128, 128);
    position: relative;
    overflow: hidden;
}
  
.btn {
    height: 60px;
    width: 300px;
    margin: 16px auto;
    box-shadow: 10px 10px 30px rgb(254, 215, 188);
    border-radius: 50px;
    display: flex;
    justify-content: space-around;
    align-items: center;
}
  
.login,
.signup {
    font-size: 22px;
    border: none;
    outline: none;
    background-color: transparent;
    position: relative;
    cursor: pointer;
}
  
.slider {
    height: 60px;
    width: 150px;
    border-radius: 50px;
    background-image: linear-gradient(to right,
            rgb(255, 195, 110),
            rgb(255, 146, 91));
    position: absolute;
    top: 20px;
    left: 100px;
    transition: all 0.5s ease-in-out;
}
  
.moveslider {
    left: 250px;
}
  
.form-section {
    height: 500px;
    width: 1000px;
    padding: 20px 0;
    display: flex;
    position: relative;
    transition: all 0.5s ease-in-out;
    left: 0px;
}
  
.form-section-move {
    left: -500px;
}
  
.login-box,
.signup-box {
    height: 100%;
    width: 500px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 0px 40px;
}
  
.login-box {
    gap: 50px;
}
  
.signup-box {
    gap: 30px;
}
  
.ele {
    height: 60px;
    width: 400px;
    outline: none;
    border: none;
    color: rgb(77, 77, 77);
    background-color: rgb(240, 240, 240);
    border-radius: 50px;
    padding-left: 30px;
    font-size: 18px;
}
  
.clkbtn {
    height: 60px;
    width: 150px;
    border-radius: 50px;
    background-image: linear-gradient(to right,
            rgb(255, 195, 110),
            rgb(255, 146, 91));
    font-size: 22px;
    border: none;
    cursor: pointer;
}
 .js-nametag {
            position: relative;
        }
        
        .js-nametag:nth-child(1) {
            animation-name: fade;
            animation-fill-mode: both;
            animation-iteration-count: infinite;
            animation-duration: 5s;
            animation-direction: alternate-reverse;
        }
        
        .js-nametag:nth-child(2) {
            animation-name: fade;
            animation-fill-mode: both;
            animation-iteration-count: infinite;
            animation-duration: 5s;
            animation-direction: alternate;
        }
        
        @keyframes fade {
            0%,
            50% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
 
  
            
             </style>
 <script>
            $(document).ready(function () {
//                $(".modal2").modal("hide");
                $('.open').on('click', function () {
                    $(".modal").modal("show");
//                    alert("hi");
                });
                
//                $('.close').on('click', function () {
//                    $(".modal").modal("hide");
//                });

let signup = document.querySelector(".signup");
let login = document.querySelector(".login");
let slider = document.querySelector(".slider");
let formSection = document.querySelector(".form-section");
  
signup.addEventListener("click", () => {
    slider.classList.add("moveslider");
    formSection.classList.add("form-section-move");
});
  
login.addEventListener("click", () => {
    slider.classList.remove("moveslider");
    formSection.classList.remove("form-section-move");
});
            });
        </script>
</head>

<body>

     <div class="modal">
       
         <div class="cont">
   <a class="close" href="index.html">x</a>
        <!-- upper button section to select
             the login or signup form -->
        <div class="slider"></div>
        <div class="btn">
            <button class="login">Login</button>
            <button class="signup">Signup</button>
        </div>
  
        <!-- Form section that contains the
             login and the signup form -->
        <div class="form-section">
  
            <!-- login form -->
            <form method = "post" action = "index.jsp">
            <div class="login-box">
                
                <input type="text" class="email ele" placeholder="username" name="uname">
                <input type="password" class="password ele" placeholder="password" name="pwd">
                <button type="submit" class="clkbtn">Login</button>
            
            </div>
      </form>
            <!-- signup form -->
        <form method = "post" action = "register.jsp">
            <div class="signup-box">
                
                <input type="text" class="email ele" placeholder="youremail@email.com" name="email">
                <input type="text" class="name ele" placeholder="Contact" name="contact">
                <input type="text" class="name ele" placeholder="Enter user name" name="uname">
                <input type="password" class="password ele" placeholder="password" name="pwd">
                
                <button type="submit" class="clkbtn">Signup</button>
            </div>
        </form>
        </div>
    </div>        
                    

     </div>
  
          
    <!-- ======= Header ======= -->
    <!-- <section id="topbar" class="topbar d-flex align-items-center">
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
  </section>End Top Bar -->

    <header id="header" class="header d-flex align-items-center" style="background-color:teal;">

        <div class="container-fluid container-xl d-flex align-items-center justify-content-between ">
            <a href="index.html " class="logo d-flex align-items-center " style="text-decoration: none">
                <!-- Uncomment the line below if you also wish to use an image logo -->
                <!-- <img src="assets/img/logo.png " alt=" "> -->
                <h1>Blood<span style="color:burlywood;">Count!</span></h1>
            </a>
            <nav id="navbar " class="navbar ">
                <ul>
                    <li><a href="adminwelcome.jsp">Home</a></li>
                    <li><a href="adminwelcome.jsp#about">About</a></li>
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
                             <!--<li><a href="appointment.jsp">Get Appointment</a></li>-->
                            <li><a href="camps.jsp">Blood Donation camps</a></li>
                            <!--<li><a href="# ">Voluntary Donar Group</a></li>-->
                            <li><a href="#about">About Blood donation</a></li>
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
    
    <!-- End Header -->
    <!-- End Header -->

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="hero ">
        <div class="container position-relative ">
            <div class="row gy-5 " data-aos="fade-in ">
                <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center text-center text-lg-start ">
                    <h2>Welcome to <br> <span>Blood Count!</span></h2> 
                    <div>
                        <p class="js-nametag"><span>Thalassemia and cancer patients rely on periodic blood transfusion</span> </p>
                        <p class="js-nametag"><span>94 percent of blood donors are registered voters.</span></p>
                    </div>
                    <!--<p>Sed autem laudantium dolores. Voluptatem itaque ea consequatur eveniet. Eum quas beatae cumque eum quaerat.</p>-->
                    <div class="d-flex justify-content-center justify-content-lg-start ">
                        
                       <a href="https://www.youtube.com/watch?v=LXb3EKWsInQ " class="glightbox btn-watch-video d-flex align-items-center "><i class="bi bi-play-circle "></i><span>Watch Video</span></a>
                    </div>
                </div>
                <div class="col-lg-6 order-1 order-lg-2 ">
                    <img src="assets/img/hero-img.svg " class="img-fluid " alt=" " data-aos="zoom-out " data-aos-delay="100 ">
                </div>
            </div>
        </div>
                        <h1 style="margin: 45px;">Your Feed</h1>
<TABLE id="customers">
                <TR>
                    <!--<th><input type="checkbox" id='checkall' title="Select all"/></th>-->
                    <TH>User ID</TH>
                    <TH>Request ID</TH>

                    <TH>First Name</TH>

                    <TH>Last Name</TH>
                    <TH>Contact</TH>

                    <TH>Blood Group required</TH>
                    <TH>Hospital</TH>
                    <TH>City</TH>
                    <TH>Country</TH>
                    <TH>Time</TH>
                    <TH>Status</TH>


                </TR>
                 <%
                    while(rs1.next()){%>
                 <tr>
                    
                <TD> <p id="val"><%= rs1.getString(1)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(9)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(2)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(3)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(4)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(7)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(10)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(5)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(6)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(8)%></p></TD>
                <%
                  if(rs1.getBoolean(11)!=true){
                %>
                <td><form method = "post" action = "update.jsp"><input type="hidden" name="reqid" value="<%= rs1.getString(9)%>"><input type="hidden" name="userid" value="<%= rs1.getString(1)%>"><button><i class="fa-solid fa-xmark"></i>&nbsp;not found</button></form></td>
                </tr>
                <%}else{%>
                <td><form method = "post" action = "update.jsp"><input type="hidden" name="reqid" value="<%= rs1.getString(9)%>"><input type="hidden" name="userid" value="<%= rs1.getString(1)%>"><button><i class="fa-solid fa-check"></i>&nbsp;donor found</button></form></td>
                </tr>
                <%}%>
              <%}%>
</table>
                <div class="icon-boxes position-relative ">
            <div class="container position-relative ">
                <div class="row gy-4 mt-5 " >

                    <div class="col-xl-3 col-md-6 " data-aos="fade-up " data-aos-delay="100 " >
                        <div class="icon-box " style="background-color:#FF0000;">
                            <div class="icon "><i class="bi bi-credit-card "></i></div>
                            <h4 class="title "><a href=" " class="stretched-link ">Registration</a></h4>
                        </div>
                    </div>
                    <!--End Icon Box -->

                    <div class="col-xl-3 col-md-6 " data-aos="fade-up " data-aos-delay="200 ">
                        <div class="icon-box " style="background-color:#FF0000;">
                            <div class="icon "><i class="bi bi-heart-pulse"></i></div>
                            <h4 class="title "><a href=" " class="stretched-link ">Physical checkup</a></h4>
                        </div>
                    </div>
                    <!--End Icon Box -->

                    <div class="col-xl-3 col-md-6 " data-aos="fade-up " data-aos-delay="300 ">
                        <div class="icon-box " style="background-color:#FF0000;">
                            <div class="icon "><i class="bi bi-droplet-half"></i></div>
                            <h4 class="title "><a href=" " class="stretched-link ">Donation</a></h4>
                        </div>
                    </div>
                    <!--End Icon Box -->

                    <div class="col-xl-3 col-md-6 " data-aos="fade-up " data-aos-delay="500 ">
                        <div class="icon-box " style="background-color:#FF0000;">
                            <div class="icon "><i class="bi bi-cup-straw"></i></div>
                            <h4 class="title "><a href=" " class="stretched-link ">Refreshment</a></h4>
                        </div>
                    </div>
                    <!--End Icon Box -->

                </div>
            </div>
        </div>
        </div>
    </section>
    <!-- End Hero Section -->

    <main id="main ">

        <!-- ======= About Us Section ======= -->
       <section id="about" class="about ">
            <div class="container " data-aos="fade-up ">

                <div class="section-header ">
                    <h2>About Blood Donation / Know More</h2>
                    <p>Be the reason for someone's heartbeat !</p>
                </div>

                <div class="row gy-4 ">
                    <div class="col-lg-6 ">
                        <br><br><br><br>
                        <img src="assets/img/about.jpg " class="img-fluid rounded-4 mb-4 " alt=" ">
                        <br><br><br><br><br>
                        <div class="content ps-0 ps-lg-5 ">
                            <br><br>
                            <h3>Benefits</h3>
                            <ul>
                                <li><i class="bi bi-check-circle-fill" style="color:#FF0000;"></i>Blood donation is beneficial in reducing the risk of heart and liver ailments caused by the iron overload in the body.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Regular blood donation reduces the weight of the donors.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>This stimulates the production of new blood cells and in turn, helps in maintaining good health.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>This may reduce the risk of heart attack. </li>
                            </ul>
                            <h3>Pre Donation</h3>
                            <ul>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Get plenty of sleep the night before you plan to donate.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>It is best to avoid coffee and caffeinated beverages before donating.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Two rapid test systems are used to test for HIV, namely Determine and Unigold.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>The Red Cross checks your hemoglobin before every donation to ensure that you are healthy enough to donate.</li>
                            </ul>
                            <br><br><br><br><br>
                            <img src="https://nhsbtdbe.blob.core.windows.net/umbraco-assets-corp/19019/2020-number-of-registrations.jpg" class="img-fluid rounded-4 mb-4 " alt=" ">
                        </div>
                    </div>
                    <div class="col-lg-6 ">
                        <div class="content ps-0 ps-lg-5 ">
                            <!-- <p class="fst-italic ">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                            </p> -->
                            <h3>Why Donate Blood</h3>
                            <ul>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Donation helps allow blood transfusion as a life-sustaining and life-saving procedure.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Blood donation itself is used to primarily treat a small subset of medical conditions.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Blood is needed by women with complications during pregnancy and childbirth.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>One blood donation can save up to three lives.</li>
                            </ul>
                            <h3>Protocols and Guidelines</h3>
                            <ul>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>You cannot donate if you have a cold, flu, sore throat, cold sore, stomach bug or any other infection.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>If you have recently had a tattoo or body piercing you cannot donate for 6 months from the date of the procedure.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Check to see if any medications you are taking or recently took would prevent you from donating.</li>
                                <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Avoid heavy lifting or vigorous exercise for at least the rest of the day after donating blood.</li>
                            </ul>

                            <!-- <p>
                                Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident
                            </p> -->

                            <div class="position-relative mt-4 ">
                                <img src="assets/img/about-2.jpg " class="img-fluid rounded-4 " alt=" ">
                                <!--<a href="https://youtu.be/7HXJyMjUBqI" class="glightbox play-btn "></a>-->
                                </ul>
                                <br><br><br><br>
                                <h3>Donation</h3>
                                <ul>
                                    <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>The entire process takes about one hour and 15 minutes.</li>
                                    <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>The actual donation of a pint of whole blood unit takes eight to 10 minutes.</li>
                                    <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>You may experience some dizziness or lightheadedness during or after your donation. </li>
                                    <!-- <li><i class="bi bi-check-circle-fill "></i>The Red Cross checks your hemoglobin before every donation to ensure that you are healthy enough to donate.</li> -->
                                </ul>
                                <h3>Post Donation</h3>
                                <ul>
                                    <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Drink plenty of fluids like water, soup and fruit juices to replace the volume lost during donation.</li>
                                    <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Avoid lifting heavy weights with the donation arm or engaging in strenuous physical activities to prevent complications.</li>
                                    <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Try not to take a hot water shower immediately after donating blood.</li>
                                    <li><i class="bi bi-check-circle-fill " style="color:#FF0000;"></i>Avoid smoking for four hours, and alcohol for 24 hours.</li>
                                </ul>
                            </div>
                        </div>
                    </div>





                </div>
        </section>
        <!-- End About Us Section -->

        <!-- ======= Clients Section ======= -->
        <!-- <section id="clients " class="clients ">
            <div class="container " data-aos="zoom-out ">

                <div class="clients-slider swiper ">
                    <div class="swiper-wrapper align-items-center ">
                        <div class="swiper-slide "><img src="assets/img/clients/client-1.png " class="img-fluid " alt=" "></div>
                        <div class="swiper-slide "><img src="assets/img/clients/client-2.png " class="img-fluid " alt=" "></div>
                        <div class="swiper-slide "><img src="assets/img/clients/client-3.png " class="img-fluid " alt=" "></div>
                        <div class="swiper-slide "><img src="assets/img/clients/client-4.png " class="img-fluid " alt=" "></div>
                        <div class="swiper-slide "><img src="assets/img/clients/client-5.png " class="img-fluid " alt=" "></div>
                        <div class="swiper-slide "><img src="assets/img/clients/client-6.png " class="img-fluid " alt=" "></div>
                        <div class="swiper-slide "><img src="assets/img/clients/client-7.png " class="img-fluid " alt=" "></div>
                        <div class="swiper-slide "><img src="assets/img/clients/client-8.png " class="img-fluid " alt=" "></div>
                    </div>
                </div>

            </div>
        </section> -->
        <!-- End Clients Section -->

        <!-- ======= Stats Counter Section ======= -->
        <!-- <section id="stats-counter " class="stats-counter ">
            <div class="container " data-aos="fade-up ">

                <div class="row gy-4 align-items-center ">

                    <div class="col-lg-6 ">
                        <img src="assets/img/stats-img.svg " alt=" " class="img-fluid ">
                    </div>

                    <div class="col-lg-6 ">

                        <div class="stats-item d-flex align-items-center ">
                            <span data-purecounter-start="0 " data-purecounter-end="232 " data-purecounter-duration="1 " class="purecounter "></span>
                            <p><strong>Happy Clients</strong> consequuntur quae diredo para mesta</p>
                        </div> -->
        <!-- End Stats Item -->

        <!-- <div class="stats-item d-flex align-items-center ">
            <span data-purecounter-start="0 " data-purecounter-end="521 " data-purecounter-duration="1 " class="purecounter "></span>
            <p><strong>Projects</strong> adipisci atque cum quia aut</p>
        </div> -->
        <!-- End Stats Item -->

        <!-- <div class="stats-item d-flex align-items-center ">
            <span data-purecounter-start="0 " data-purecounter-end="453 " data-purecounter-duration="1 " class="purecounter "></span>
            <p><strong>Hours Of Support</strong> aut commodi quaerat</p>
        </div> -->
        <!-- End Stats Item -->

        <!-- </div>

        </div>

        </div>
        </section> -->
        <!-- End Stats Counter Section -->

        <!-- ======= Call To Action Section ======= -->
        <!-- <section id="call-to-action " class="call-to-action ">
            <div class="container text-center " data-aos="zoom-out ">
                <a href="https://www.youtube.com/watch?v=LXb3EKWsInQ " class="glightbox play-btn "></a>
                <h3>Call To Action</h3>
                <p> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <a class="cta-btn " href="# ">Call To Action</a>
            </div>
        </section> -->
        <!-- End Call To Action Section -->

        <!-- ======= Our Services Section ======= -->
        <!-- <section id="services " class="services sections-bg ">
            <div class="container " data-aos="fade-up ">

                <div class="section-header ">
                    <h2>Our Services</h2>
                    <p>Aperiam dolorum et et wuia molestias qui eveniet numquam nihil porro incidunt dolores placeat sunt id nobis omnis tiledo stran delop</p>
                </div>

                <div class="row gy-4 " data-aos="fade-up " data-aos-delay="100 ">

                    <div class="col-lg-4 col-md-6 ">
                        <div class="service-item position-relative ">
                            <div class="icon ">
                                <i class="bi bi-activity "></i>
                            </div>
                            <h3>Nesciunt Mete</h3>
                            <p>Provident nihil minus qui consequatur non omnis maiores. Eos accusantium minus dolores iure perferendis tempore et consequatur.</p>
                            <a href="# " class="readmore stretched-link ">Read more <i class="bi bi-arrow-right "></i></a>
                        </div>
                    </div> -->
        <!-- End Service Item -->

        <!-- <div class="col-lg-4 col-md-6 ">
            <div class="service-item position-relative ">
                <div class="icon ">
                    <i class="bi bi-broadcast "></i>
                </div>
                <h3>Eosle Commodi</h3>
                <p>Ut autem aut autem non a. Sint sint sit facilis nam iusto sint. Libero corrupti neque eum hic non ut nesciunt dolorem.</p>
                <a href="# " class="readmore stretched-link ">Read more <i class="bi bi-arrow-right "></i></a>
            </div>
        </div> -->
        <!-- End Service Item -->

        <!-- <div class="col-lg-4 col-md-6 ">
            <div class="service-item position-relative ">
                <div class="icon ">
                    <i class="bi bi-easel "></i>
                </div>
                <h3>Ledo Markt</h3>
                <p>Ut excepturi voluptatem nisi sed. Quidem fuga consequatur. Minus ea aut. Vel qui id voluptas adipisci eos earum corrupti.</p>
                <a href="# " class="readmore stretched-link ">Read more <i class="bi bi-arrow-right "></i></a>
            </div>
        </div> -->
        <!-- End Service Item -->

        <!-- <div class="col-lg-4 col-md-6 ">
            <div class="service-item position-relative ">
                <div class="icon ">
                    <i class="bi bi-bounding-box-circles "></i>
                </div>
                <h3>Asperiores Commodit</h3>
                <p>Non et temporibus minus omnis sed dolor esse consequatur. Cupiditate sed error ea fuga sit provident adipisci neque.</p>
                <a href="# " class="readmore stretched-link ">Read more <i class="bi bi-arrow-right "></i></a>
            </div>
        </div> -->
        <!-- End Service Item -->

        <!-- <div class="col-lg-4 col-md-6 ">
            <div class="service-item position-relative ">
                <div class="icon ">
                    <i class="bi bi-calendar4-week "></i>
                </div>
                <h3>Velit Doloremque</h3>
                <p>Cumque et suscipit saepe. Est maiores autem enim facilis ut aut ipsam corporis aut. Sed animi at autem alias eius labore.</p>
                <a href="# " class="readmore stretched-link ">Read more <i class="bi bi-arrow-right "></i></a>
            </div>
        </div> -->
        <!-- End Service Item -->

        <!-- <div class="col-lg-4 col-md-6 ">
            <div class="service-item position-relative ">
                <div class="icon ">
                    <i class="bi bi-chat-square-text "></i>
                </div>
                <h3>Dolori Architecto</h3>
                <p>Hic molestias ea quibusdam eos. Fugiat enim doloremque aut neque non et debitis iure. Corrupti recusandae ducimus enim.</p>
                <a href="# " class="readmore stretched-link ">Read more <i class="bi bi-arrow-right "></i></a>
            </div>
        </div> -->
        <!-- End Service Item -->

        <!-- </div>

        </div>
        </section> -->
        <!-- End Our Services Section -->

        <!-- ======= Testimonials Section ======= -->
        <!-- <section id="testimonials " class="testimonials ">
            <div class="container " data-aos="fade-up ">

                <div class="section-header ">
                    <h2>Testimonials</h2>
                    <p>Voluptatem quibusdam ut ullam perferendis repellat non ut consequuntur est eveniet deleniti fignissimos eos quam</p>
                </div>

                <div class="slides-3 swiper " data-aos="fade-up " data-aos-delay="100 ">
                    <div class="swiper-wrapper ">

                        <div class="swiper-slide ">
                            <div class="testimonial-wrap ">
                                <div class="testimonial-item ">
                                    <div class="d-flex align-items-center ">
                                        <img src="assets/img/testimonials/testimonials-1.jpg " class="testimonial-img flex-shrink-0 " alt=" ">
                                        <div>
                                            <h3>Saul Goodman</h3>
                                            <h4>Ceo &amp; Founder</h4>
                                            <div class="stars ">
                                                <i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i>
                                            </div>
                                        </div>
                                    </div>
                                    <p>
                                        <i class="bi bi-quote quote-icon-left "></i> Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam,
                                        risus at semper.
                                        <i class="bi bi-quote quote-icon-right "></i>
                                    </p>
                                </div>
                            </div>
                        </div> -->
        <!-- End testimonial item -->

        <!-- <div class="swiper-slide ">
            <div class="testimonial-wrap ">
                <div class="testimonial-item ">
                    <div class="d-flex align-items-center ">
                        <img src="assets/img/testimonials/testimonials-2.jpg " class="testimonial-img flex-shrink-0 " alt=" ">
                        <div>
                            <h3>Sara Wilsson</h3>
                            <h4>Designer</h4>
                            <div class="stars ">
                                <i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i>
                            </div>
                        </div>
                    </div>
                    <p>
                        <i class="bi bi-quote quote-icon-left "></i> Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
                        <i class="bi bi-quote quote-icon-right "></i>
                    </p>
                </div>
            </div>
        </div> -->
        <!-- End testimonial item -->

        <!-- <div class="swiper-slide ">
            <div class="testimonial-wrap ">
                <div class="testimonial-item ">
                    <div class="d-flex align-items-center ">
                        <img src="assets/img/testimonials/testimonials-3.jpg " class="testimonial-img flex-shrink-0 " alt=" ">
                        <div>
                            <h3>Jena Karlis</h3>
                            <h4>Store Owner</h4>
                            <div class="stars ">
                                <i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i>
                            </div>
                        </div>
                    </div>
                    <p>
                        <i class="bi bi-quote quote-icon-left "></i> Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
                        <i class="bi bi-quote quote-icon-right "></i>
                    </p>
                </div>
            </div>
        </div> -->
        <!-- End testimonial item -->

        <!-- <div class="swiper-slide ">
            <div class="testimonial-wrap ">
                <div class="testimonial-item ">
                    <div class="d-flex align-items-center ">
                        <img src="assets/img/testimonials/testimonials-4.jpg " class="testimonial-img flex-shrink-0 " alt=" ">
                        <div>
                            <h3>Matt Brandon</h3>
                            <h4>Freelancer</h4>
                            <div class="stars ">
                                <i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i>
                            </div>
                        </div>
                    </div>
                    <p>
                        <i class="bi bi-quote quote-icon-left "></i> Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore.
                        <i class="bi bi-quote quote-icon-right "></i>
                    </p>
                </div>
            </div>
        </div> -->
        <!-- End testimonial item -->

        <!-- <div class="swiper-slide ">
            <div class="testimonial-wrap ">
                <div class="testimonial-item ">
                    <div class="d-flex align-items-center ">
                        <img src="assets/img/testimonials/testimonials-5.jpg " class="testimonial-img flex-shrink-0 " alt=" ">
                        <div>
                            <h3>John Larson</h3>
                            <h4>Entrepreneur</h4>
                            <div class="stars ">
                                <i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i><i class="bi bi-star-fill "></i>
                            </div>
                        </div>
                    </div>
                    <p>
                        <i class="bi bi-quote quote-icon-left "></i> Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore.
                        <i class="bi bi-quote quote-icon-right "></i>
                    </p>
                </div>
            </div>
        </div> -->
        <!-- End testimonial item -->

        <!-- </div>
        <div class="swiper-pagination "></div>
        </div>

        </div>
        </section> -->
        <!-- End Testimonials Section -->

        <!-- ======= Portfolio Section ======= -->
        <!-- <section id="portfolio " class="portfolio sections-bg ">
            <div class="container " data-aos="fade-up ">

                <div class="section-header ">
                    <h2>Portfolio</h2>
                    <p>Quam sed id excepturi ccusantium dolorem ut quis dolores nisi llum nostrum enim velit qui ut et autem uia reprehenderit sunt deleniti</p>
                </div>

                <div class="portfolio-isotope " data-portfolio-filter="* " data-portfolio-layout="masonry " data-portfolio-sort="original-order " data-aos="fade-up " data-aos-delay="100 ">

                    <div>
                        <ul class="portfolio-flters ">
                            <li data-filter="* " class="filter-active ">All</li>
                            <li data-filter=".filter-app ">App</li>
                            <li data-filter=".filter-product ">Product</li>
                            <li data-filter=".filter-branding ">Branding</li>
                            <li data-filter=".filter-books ">Books</li>
                        </ul> -->
        <!-- End Portfolio Filters -->
        <!-- </div>

        <div class="row gy-4 portfolio-container ">

            <div class="col-xl-4 col-md-6 portfolio-item filter-app ">
                <div class="portfolio-wrap ">
                    <a href="assets/img/portfolio/app-1.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/app-1.jpg " class="img-fluid " alt=" "></a>
                    <div class="portfolio-info ">
                        <h4><a href="portfolio-details.html " title="More Details ">App 1</a></h4>
                        <p>Lorem ipsum, dolor sit amet consectetur</p>
                    </div>
                </div>
            </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-product ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/product-1.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/product-1.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">Product 1</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-branding ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/branding-1.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/branding-1.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">Branding 1</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-books ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/books-1.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/books-1.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">Books 1</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-app ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/app-2.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/app-2.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">App 2</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-product ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/product-2.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/product-2.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">Product 2</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-branding ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/branding-2.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/branding-2.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">Branding 2</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-books ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/books-2.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/books-2.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">Books 2</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-app ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/app-3.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/app-3.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">App 3</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-product ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/product-3.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/product-3.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">Product 3</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-branding ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/branding-3.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/branding-3.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">Branding 3</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- <div class="col-xl-4 col-md-6 portfolio-item filter-books ">
            <div class="portfolio-wrap ">
                <a href="assets/img/portfolio/books-3.jpg " data-gallery="portfolio-gallery-app " class="glightbox "><img src="assets/img/portfolio/books-3.jpg " class="img-fluid " alt=" "></a>
                <div class="portfolio-info ">
                    <h4><a href="portfolio-details.html " title="More Details ">Books 3</a></h4>
                    <p>Lorem ipsum, dolor sit amet consectetur</p>
                </div>
            </div>
        </div> -->
        <!-- End Portfolio Item -->

        <!-- </div> -->
        <!-- End Portfolio Container -->

        <!-- </div>

        </div>
        </section> -->
        <!-- End Portfolio Section -->

        <!-- ======= Our Team Section ======= -->
        <!-- <section id="team " class="team ">
            <div class="container " data-aos="fade-up ">

                <div class="section-header ">
                    <h2>Our Team</h2>
                    <p>Nulla dolorum nulla nesciunt rerum facere sed ut inventore quam porro nihil id ratione ea sunt quis dolorem dolore earum</p>
                </div>

                <div class="row gy-4 ">

                    <div class="col-xl-3 col-md-6 d-flex " data-aos="fade-up " data-aos-delay="100 ">
                        <div class="member ">
                            <img src="assets/img/team/team-1.jpg " class="img-fluid " alt=" ">
                            <h4>Walter White</h4>
                            <span>Web Development</span>
                            <div class="social ">
                                <a href=" "><i class="bi bi-twitter "></i></a>
                                <a href=" "><i class="bi bi-facebook "></i></a>
                                <a href=" "><i class="bi bi-instagram "></i></a>
                                <a href=" "><i class="bi bi-linkedin "></i></a>
                            </div>
                        </div>
        </div> -->
        <!-- End Team Member -->

        <!-- <div class="col-xl-3 col-md-6 d-flex " data-aos="fade-up " data-aos-delay="200 ">
            <div class="member ">
                <img src="assets/img/team/team-2.jpg " class="img-fluid " alt=" ">
                <h4>Sarah Jhinson</h4>
                <span>Marketing</span>
                <div class="social ">
                    <a href=" "><i class="bi bi-twitter "></i></a>
                    <a href=" "><i class="bi bi-facebook "></i></a>
                    <a href=" "><i class="bi bi-instagram "></i></a>
                    <a href=" "><i class="bi bi-linkedin "></i></a>
                </div>
            </div>
        </div> -->
        <!-- End Team Member -->

        <!-- <div class="col-xl-3 col-md-6 d-flex " data-aos="fade-up " data-aos-delay="300 ">
            <div class="member ">
                <img src="assets/img/team/team-3.jpg " class="img-fluid " alt=" ">
                <h4>William Anderson</h4>
                <span>Content</span>
                <div class="social ">
                    <a href=" "><i class="bi bi-twitter "></i></a>
                    <a href=" "><i class="bi bi-facebook "></i></a>
                    <a href=" "><i class="bi bi-instagram "></i></a>
                    <a href=" "><i class="bi bi-linkedin "></i></a>
                </div>
            </div>
        </div> -->
        <!-- End Team Member -->

        <!-- <div class="col-xl-3 col-md-6 d-flex " data-aos="fade-up " data-aos-delay="400 ">
            <div class="member ">
                <img src="assets/img/team/team-4.jpg " class="img-fluid " alt=" ">
                <h4>Amanda Jepson</h4>
                <span>Accountant</span>
                <div class="social ">
                    <a href=" "><i class="bi bi-twitter "></i></a>
                    <a href=" "><i class="bi bi-facebook "></i></a>
                    <a href=" "><i class="bi bi-instagram "></i></a>
                    <a href=" "><i class="bi bi-linkedin "></i></a>
                </div>
            </div>
        </div> -->
        <!-- End Team Member -->

        <!-- </div>

        </div>
        </section> -->
        <!-- End Our Team Section -->

        <!-- ======= Pricing Section ======= -->
        <!-- <section id="pricing " class="pricing sections-bg ">
            <div class="container " data-aos="fade-up ">

                <div class="section-header ">
                    <h2>Pricing</h2>
                    <p>Aperiam dolorum et et wuia molestias qui eveniet numquam nihil porro incidunt dolores placeat sunt id nobis omnis tiledo stran delop</p>
                </div>

                <div class="row g-4 py-lg-5 " data-aos="zoom-out " data-aos-delay="100 ">

                    <div class="col-lg-4 ">
                        <div class="pricing-item ">
                            <h3>Free Plan</h3>
                            <div class="icon ">
                                <i class="bi bi-box "></i>
                            </div>
                            <h4><sup>$</sup>0<span> / month</span></h4>
                            <ul>
                                <li><i class="bi bi-check "></i> Quam adipiscing vitae proin</li>
                                <li><i class="bi bi-check "></i> Nec feugiat nisl pretium</li>
                                <li><i class="bi bi-check "></i> Nulla at volutpat diam uteera</li>
                                <li class="na "><i class="bi bi-x "></i> <span>Pharetra massa massa ultricies</span></li>
                                <li class="na "><i class="bi bi-x "></i> <span>Massa ultricies mi quis hendrerit</span></li>
                            </ul>
                            <div class="text-center "><a href="# " class="buy-btn ">Buy Now</a></div>
                        </div>
                    </div> -->
        <!-- End Pricing Item -->

        <!-- <div class="col-lg-4 ">
            <div class="pricing-item featured ">
                <h3>Business Plan</h3>
                <div class="icon ">
                    <i class="bi bi-airplane "></i>
                </div>

                <h4><sup>$</sup>29<span> / month</span></h4>
                <ul>
                    <li><i class="bi bi-check "></i> Quam adipiscing vitae proin</li>
                    <li><i class="bi bi-check "></i> Nec feugiat nisl pretium</li>
                    <li><i class="bi bi-check "></i> Nulla at volutpat diam uteera</li>
                    <li><i class="bi bi-check "></i> Pharetra massa massa ultricies</li>
                    <li><i class="bi bi-check "></i> Massa ultricies mi quis hendrerit</li>
                </ul>
                <div class="text-center "><a href="# " class="buy-btn ">Buy Now</a></div>
            </div>
        </div> -->
        <!-- End Pricing Item -->

        <!-- <div class="col-lg-4 ">
            <div class="pricing-item ">
                <h3>Developer Plan</h3>
                <div class="icon ">
                    <i class="bi bi-send "></i>
                </div>
                <h4><sup>$</sup>49<span> / month</span></h4>
                <ul>
                    <li><i class="bi bi-check "></i> Quam adipiscing vitae proin</li>
                    <li><i class="bi bi-check "></i> Nec feugiat nisl pretium</li>
                    <li><i class="bi bi-check "></i> Nulla at volutpat diam uteera</li>
                    <li><i class="bi bi-check "></i> Pharetra massa massa ultricies</li>
                    <li><i class="bi bi-check "></i> Massa ultricies mi quis hendrerit</li>
                </ul>
                <div class="text-center "><a href="# " class="buy-btn ">Buy Now</a></div>
            </div>
        </div> -->
        <!-- End Pricing Item -->

        <!-- </div>

        </div>
        </section> -->
        <!-- End Pricing Section -->

        <!-- ======= Frequently Asked Questions Section ======= -->
        <!-- <section id="faq " class="faq ">
            <div class="container " data-aos="fade-up ">

                <div class="row gy-4 ">

                    <div class="col-lg-4 ">
                        <div class="content px-xl-5 ">
                            <h3>Frequently Asked <strong>Questions</strong></h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit
                            </p>
                        </div>
                    </div>

                    <div class="col-lg-8 ">

                        <div class="accordion accordion-flush " id="faqlist " data-aos="fade-up " data-aos-delay="100 ">

                            <div class="accordion-item ">
                                <h3 class="accordion-header ">
                                    <button class="accordion-button collapsed " type="button " data-bs-toggle="collapse " data-bs-target="#faq-content-1 ">
                    <span class="num ">1.</span>
                    Non consectetur a erat nam at lectus urna duis?
                  </button>
                                </h3>
                                <div id="faq-content-1 " class="accordion-collapse collapse " data-bs-parent="#faqlist ">
                                    <div class="accordion-body ">
                                        Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
                                    </div>
                                </div>
                            </div> -->
        <!-- # Faq item-->

        <!-- <div class="accordion-item ">
            <h3 class="accordion-header ">
                <button class="accordion-button collapsed " type="button " data-bs-toggle="collapse " data-bs-target="#faq-content-2 ">
                    <span class="num ">2.</span>
                    Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque?
                  </button>
            </h3>
            <div id="faq-content-2 " class="accordion-collapse collapse " data-bs-parent="#faqlist ">
                <div class="accordion-body ">
                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in
                    cursus turpis massa tincidunt dui.
                </div>
            </div>
        </div> -->
        <!-- # Faq item-->

        <!-- <div class="accordion-item ">
            <h3 class="accordion-header ">
                <button class="accordion-button collapsed " type="button " data-bs-toggle="collapse " data-bs-target="#faq-content-3 ">
                    <span class="num ">3.</span>
                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi?
                  </button>
            </h3>
            <div id="faq-content-3 " class="accordion-collapse collapse " data-bs-parent="#faqlist ">
                <div class="accordion-body ">
                    Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna
                    molestie at elementum eu facilisis sed odio morbi quis
                </div>
            </div>
        </div> -->
        <!-- # Faq item-->

        <!-- <div class="accordion-item ">
            <h3 class="accordion-header ">
                <button class="accordion-button collapsed " type="button " data-bs-toggle="collapse " data-bs-target="#faq-content-4 ">
                    <span class="num ">4.</span>
                    Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla?
                  </button>
            </h3>
            <div id="faq-content-4 " class="accordion-collapse collapse " data-bs-parent="#faqlist ">
                <div class="accordion-body ">
                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in
                    cursus turpis massa tincidunt dui.
                </div>
            </div>
        </div> -->
        <!-- # Faq item-->

        <!-- <div class="accordion-item ">
            <h3 class="accordion-header ">
                <button class="accordion-button collapsed " type="button " data-bs-toggle="collapse " data-bs-target="#faq-content-5 ">
                    <span class="num ">5.</span>
                    Tempus quam pellentesque nec nam aliquam sem et tortor consequat?
                  </button>
            </h3>
            <div id="faq-content-5 " class="accordion-collapse collapse " data-bs-parent="#faqlist ">
                <div class="accordion-body ">
                    Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in
                </div>
            </div>
        </div> -->
        <!-- # Faq item-->

        <!-- </div>

        </div>
        </div>

        </div>
        </section> -->
        <!-- End Frequently Asked Questions Section -->

        <!-- ======= Recent Blog Posts Section ======= -->
        <!-- <section id="recent-posts " class="recent-posts sections-bg ">
            <div class="container " data-aos="fade-up ">

                <div class="section-header ">
                    <h2>Recent Blog Posts</h2>
                    <p>Consequatur libero assumenda est voluptatem est quidem illum et officia imilique qui vel architecto accusamus fugit aut qui distinctio</p>
                </div>

                <div class="row gy-4 ">

                    <div class="col-xl-4 col-md-6 ">
                        <article>

                            <div class="post-img ">
                                <img src="assets/img/blog/blog-1.jpg " alt=" " class="img-fluid ">
                            </div>

                            <p class="post-category ">Politics</p>

                            <h2 class="title ">
                                <a href="blog-details.html ">Dolorum optio tempore voluptas dignissimos</a>
                            </h2>

                            <div class="d-flex align-items-center ">
                                <img src="assets/img/blog/blog-author.jpg " alt=" " class="img-fluid post-author-img flex-shrink-0 ">
                                <div class="post-meta ">
                                    <p class="post-author ">Maria Doe</p>
                                    <p class="post-date ">
                                        <time datetime="2022-01-01 ">Jan 1, 2022</time>
                                    </p>
                                </div>
                            </div>

                        </article>
                    </div> -->
        <!-- End post list item -->

        <!-- <div class="col-xl-4 col-md-6 ">
            <article>

                <div class="post-img ">
                    <img src="assets/img/blog/blog-2.jpg " alt=" " class="img-fluid ">
                </div>

                <p class="post-category ">Sports</p>

                <h2 class="title ">
                    <a href="blog-details.html ">Nisi magni odit consequatur autem nulla dolorem</a>
                </h2>

                <div class="d-flex align-items-center ">
                    <img src="assets/img/blog/blog-author-2.jpg " alt=" " class="img-fluid post-author-img flex-shrink-0 ">
                    <div class="post-meta ">
                        <p class="post-author ">Allisa Mayer</p>
                        <p class="post-date ">
                            <time datetime="2022-01-01 ">Jun 5, 2022</time>
                        </p>
                    </div>
                </div>

            </article>
        </div> -->
        <!-- End post list item -->

        <!-- <div class="col-xl-4 col-md-6 ">
            <article>

                <div class="post-img ">
                    <img src="assets/img/blog/blog-3.jpg " alt=" " class="img-fluid ">
                </div>

                <p class="post-category ">Entertainment</p>

                <h2 class="title ">
                    <a href="blog-details.html ">Possimus soluta ut id suscipit ea ut in quo quia et soluta</a>
                </h2>

                <div class="d-flex align-items-center ">
                    <img src="assets/img/blog/blog-author-3.jpg " alt=" " class="img-fluid post-author-img flex-shrink-0 ">
                    <div class="post-meta ">
                        <p class="post-author ">Mark Dower</p>
                        <p class="post-date ">
                            <time datetime="2022-01-01 ">Jun 22, 2022</time>
                        </p>
                    </div>
                </div>

            </article>
        </div> -->
        <!-- End post list item -->

        <!-- </div> -->
        <!-- End recent posts list -->

        <!-- </div>
        </section> -->
        <!-- End Recent Blog Posts Section -->

        <!-- ======= Contact Section ======= -->
        <!-- <section id="contact " class="contact ">
            <div class="container " data-aos="fade-up ">

                <div class="section-header ">
                    <h2>Contact</h2>
                    <p>Nulla dolorum nulla nesciunt rerum facere sed ut inventore quam porro nihil id ratione ea sunt quis dolorem dolore earum</p>
                </div>

                <div class="row gx-lg-0 gy-4 ">

                    <div class="col-lg-4 ">

                        <div class="info-container d-flex flex-column align-items-center justify-content-center ">
                            <div class="info-item d-flex ">
                                <i class="bi bi-geo-alt flex-shrink-0 "></i>
                                <div>
                                    <h4>Location:</h4>
                                    <p>A108 Adam Street, New York, NY 535022</p>
                                </div>
                            </div>
                            <!-- End Info Item -->

        <!-- <div class="info-item d-flex ">
            <i class="bi bi-envelope flex-shrink-0 "></i>
            <div>
                <h4>Email:</h4>
                <p>info@example.com</p>
            </div>
        </div> -->
        <!-- End Info Item -->

        <!-- <div class="info-item d-flex ">
            <i class="bi bi-phone flex-shrink-0 "></i>
            <div>
                <h4>Call:</h4>
                <p>+1 5589 55488 55</p>
            </div>
        </div> -->
        <!-- End Info Item -->

        <!-- <div class="info-item d-flex ">
            <i class="bi bi-clock flex-shrink-0 "></i>
            <div>
                <h4>Open Hours:</h4>
                <p>Mon-Sat: 11AM - 23PM</p>
            </div>
        </div> -->
        <!-- End Info Item -->
        <!-- </div>

        </div>

        <div class="col-lg-8 ">
            <form action="forms/contact.php " method="post " role="form " class="php-email-form ">
                <div class="row ">
                    <div class="col-md-6 form-group ">
                        <input type="text " name="name " class="form-control " id="name " placeholder="Your Name " required>
                    </div>
                    <div class="col-md-6 form-group mt-3 mt-md-0 ">
                        <input type="email " class="form-control " name="email " id="email " placeholder="Your Email " required>
                    </div>
                </div>
                <div class="form-group mt-3 ">
                    <input type="text " class="form-control " name="subject " id="subject " placeholder="Subject " required>
                </div>
                <div class="form-group mt-3 ">
                    <textarea class="form-control " name="message " rows="7 " placeholder="Message " required></textarea>
                </div>
                <div class="my-3 ">
                    <div class="loading ">Loading</div>
                    <div class="error-message "></div>
                    <div class="sent-message ">Your message has been sent. Thank you!</div>
                </div>
                <div class="text-center "><button type="submit ">Send Message</button></div>
            </form>
        </div> -->
        <!-- End Contact Form -->

        <!-- </div>

        </div>
        </section> -->
        <!-- End Contact Section -->

        <!-- </main> -->
        <!-- End #main -->

        <!-- ======= Footer ======= -->
        <!-- <footer id="footer " class="footer ">

            <div class="container ">
                <div class="row gy-4 ">
                    <div class="col-lg-5 col-md-12 footer-info ">
                        <a href="index.html " class="logo d-flex align-items-center ">
                            <span>Impact</span>
                        </a>
                        <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus.</p>
                        <div class="social-links d-flex mt-4 ">
                            <a href="# " class="twitter "><i class="bi bi-twitter "></i></a>
                            <a href="# " class="facebook "><i class="bi bi-facebook "></i></a>
                            <a href="# " class="instagram "><i class="bi bi-instagram "></i></a>
                            <a href="# " class="linkedin "><i class="bi bi-linkedin "></i></a>
                        </div>
                    </div>

                    <div class="col-lg-2 col-6 footer-links ">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><a href="# ">Home</a></li>
                            <li><a href="# ">About us</a></li>
                            <li><a href="# ">Services</a></li>
                            <li><a href="# ">Terms of service</a></li>
                            <li><a href="# ">Privacy policy</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-2 col-6 footer-links ">
                        <h4>Our Services</h4>
                        <ul>
                            <li><a href="# ">Web Design</a></li>
                            <li><a href="# ">Web Development</a></li>
                            <li><a href="# ">Product Management</a></li>
                            <li><a href="# ">Marketing</a></li>
                            <li><a href="# ">Graphic Design</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start ">
                        <h4>Contact Us</h4>
                        <p>
                            A108 Adam Street <br> New York, NY 535022<br> United States <br><br>
                            <strong>Phone:</strong> +1 5589 55488 55<br>
                            <strong>Email:</strong> info@example.com<br>
                        </p>

                    </div>

                </div>
            </div>

            <div class="container mt-4 ">
                <div class="copyright ">
                    &copy; Copyright <strong><span>Impact</span></strong>. All Rights Reserved
                </div>
                <div class="credits "> -->
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/impact-bootstrap-business-website-template/ -->
        <!-- Designed by <a href="https://bootstrapmade.com/ ">BootstrapMade</a>
                </div>
            </div>

        </footer> -->
        <!-- End Footer -->
        <!-- End Footer -->

        <!-- <a href="# " class="scroll-top d-flex align-items-center justify-content-center "><i class="bi bi-arrow-up-short "></i></a> -->

        <!-- <div id="preloader "></div> -->

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js "></script>
        <script src="assets/vendor/aos/aos.js "></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js "></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js "></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js "></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js "></script>
        <script src="assets/vendor/php-email-form/validate.js "></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js "></script>

</body>

</html>