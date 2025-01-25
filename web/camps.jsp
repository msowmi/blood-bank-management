<%-- 
    Document   : camps
    Created on : 19-Dec-2022, 11:49:51 am
    Author     : Sowmi
--%>






<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%
    String username = (String) session.getAttribute("Nam");
    String state = request.getParameter("state");
    String district = request.getParameter("district");
//    String blood = request.getParameter("blood");
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/blood", "root", "123");
    Statement st = con.createStatement();
    ResultSet resultset = st.executeQuery("select userid from credentials where username = '" + username + "'");
    resultset.next();
    String myid = resultset.getString(1); 
    
    Statement stm = con.createStatement();
 

    ResultSet rs1 = stm.executeQuery("select state, district, city, bname, hname, category, contact, email, userid, time from bloodbank");
    
  
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
<!--  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">-->

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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="//cdn.tutorialjinni.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdn.tutorialjinni.com/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
<link rel="stylesheet" href="//g.tutorialjinni.com/mojoaxel/bootstrap-select-country/dist/css/bootstrap-select-country.min.css" />


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  <style>
      @import url('https://fonts.googleapis.com/css2?family=Lora:ital,wght@1,500&family=Merriweather:ital,wght@1,300&family=Orelega+One&family=Updock&display=swap');
             @import url('https://fonts.googleapis.com/css2?family=Lora:ital,wght@1,500&family=Merriweather:ital,wght@1,300&family=Orelega+One&family=Updock&display=swap');
      
* {
  box-sizing: border-box;
}
 .req:after {
    content:" *";
    color: red;
  }
.title{
  font-family: 'Roboto', sans-serif;
  font-size: 2.2em;
  font-weight: 300;
  color: green;
  text-transform: uppercase;
  }
input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
  margin-left: 735px;
  margin-top: 30px;
  width: 80px !important;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 250px;
  margin-top: 6px;
  margin-left: 320px;
}

.col-75 {
  float: left;
  width: 250px;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

#customers {
                margin: 20px;
                /*margin-right: 30px;*/
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 95%;
                font-family: 'Merriweather', serif;
                text-align: center;
               
                
            }
            #customers td, #customers th {
                border: 1px solid #ddd;
                text-align: center;
                /*padding: 8px;*/
            }

            #customers tr{
                background-color: white;
                text-align: center;
                padding: 5px;
                
            }
/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */

</style>
<!--  <style>
/*      $font:          'Roboto', sans-serif;*/
/*$bg:            #37404a;*/
/*$white:         #FFF;*/
/*$grey:          #333;*/
/*$rose:          #E87E91;*/
/*$blue-light:    #73bec8;*/
/*$blue-lighter:  #ABDAD3;*/
/*$green:         #85FFC7;*/
/*$red:           #EF5350;*/


.m-b-xs {
  margin-bottom: 2%;
}
.m-b-md {
  margin-bottom: 10%;
}
.m-t-xs {
  margin-top: 2%;
}
.m-t-sm {
  margin-top: 5%;
}


/** {
  outline: 0 !important;
}

body {
  padding: 2% 0;
  background-color: #37404a;
  
}*/

h1 {
  font-family: 'Roboto', sans-serif;
  font-size: 2.2em;
  font-weight: 300;
  color: #85FFC7;
  text-transform: uppercase;
}

p {
  font-family: 'Roboto', sans-serif;
  font-size: 1.1em;
  font-weight: 300;
  color: #FFF;
}

a {
  color: #FFF;

  &:hover {
    text-decoration: none;
    color: #FFF;
  }
}

#survey-form {
		label,
	.labels {
			display: block;
			margin-bottom: 2%;
			font-family: 'Roboto', sans-serif;
			font-size: 1.1em;
			font-weight: 300;
			color: #FFF;
			letter-spacing: 0.5px;
	}

	input::-webkit-input-placeholder {
			color: transparent !important;
	}
	input::-moz-placeholder {
			color: transparent !important;
	}
	input:-ms-input-placeholder {
			color: transparent !important;
	}
	input:-moz-placeholder {
			color: transparent !important;
	}

	input,
	select {
			display: block;
			width: 100%;
			overflow: hidden;
			outline: none;
			border: 2px solid #333;
	}

	input {
			margin-top: 1.5%;
			padding: 0 0 5px 0;
			background: transparent;
			border: none;
			outline: none;
			border-bottom: 2px solid #FFF;
			font-size: 1.1em;
			font-weight: 300;
			color: #85FFC7;

			&:focus {
					border-color: #85FFC7;
			}
	}

	[type="checkbox"],
	[type="radio"] {
			display: inline-block;
			width: auto;
			margin: 0px 10px 0 0;
	}

	[type="checkbox"],
	[type="radio"]{
			display: inline-block;
			margin: 0 10px 0 0 !important;
			position: relative;
			top: 5px;
			right: 0;
			bottom: 0;
			left: 0;
			-webkit-appearance: none;
			-moz-appearance: none;
			-ms-appearance: none;
			-o-appearance: none;
			appearance: none;
			height: 23px;
			width: 23px;
			transition: all 0.15s ease-out 0s;
			background: #37404a;
			color: #FFF;
			cursor: pointer;
			outline: none;
			z-index: 1000;
			border: 1px solid #FFF;

			&:hover {
					border-color: #85FFC7;
			}
			&:checked {
					&:before {
							display: inline-block;
							height: 21px;
							width: 21px;
							position: relative;
							left: 0;
							bottom: 0;
							content: "\e013";
							text-align: center;
							font-family: 'Glyphicons Halflings';
							line-height: 20px;
							font-size: 15px;
							color: #85FFC7;
					}
			}
			&:focus {
					outline: none;
					border-color: #FFF;
			}
	}

	[type="radio"] {
			border-radius: 50%;

			&:after {
					border-radius: 50%;
			}
	}

	[type=number] {
			width: 45px;

			&::-webkit-inner-spin-button,
			&::-webkit-outer-spin-button {
					-webkit-appearance: none;
					-moz-appearance: none;
					appearance: none;
					margin: 0;
			}
	}

	select {
			height: 40px;
			padding-left: 5px;
			background-color: #37404a;
			border: 2px solid #FFF;
			color: #85FFC7;

			& option {
					padding: 5px 10px;
					font-weight: 300;
					cursor: pointer;

					&:hover {
							background-color: #85FFC7;
					}
			}
	}

	textarea {
			resize: none;
			margin-top: 2%;
			padding: 10px 10px 0px 20px;
			width: 100%;
			height: 90px;
			color: #85FFC7;
			background-color: #37404a;
			border: 2px solid #FFF;
	}

	.btn {
			display: inline-block;
			position: relative;
			width: 100%;
			margin: 3% 0 0 0;
			height: 45px;
			text-transform: uppercase;
			text-decoration: none;
			cursor: pointer;
			border: 3px solid #85FFC7;
			border-radius: 0;
			font-weight: 500;
			font-size: 1.2em;
			color: #85FFC7;
			text-align: center;
			background: none;
			transition: color 0.25s ease;

			&:after {
					position: absolute;
					content: '';
					top:0;
					left: 0;
					width: 0;
					height: 100%;
					background-color:#85FFC7;
					transform-origin:left;
					transition: width 0.5s ease;
					z-index:-1;
			}
			&:hover {
					color : #37404a;

					&:after {
							width: 100%;
					}
			}
	}

	fieldset {
			margin: 5% 0 0 0;
	}
}


.copyright {
  text-align: center;
  font-size: 10px;
  color: #FFF;

  & i {
    color: #EF5350;
  }
}

@media only screen and (max-width: 600px) {
  body {
    padding: 8% 0;
  }
}
  </style>-->
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

  <header id="header" class="header d-flex align-items-center">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="welcome.jsp" class="logo d-flex align-items-center" style="text-decoration: none">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1>Blood<span>Count!</span></h1>
      </a>
      <nav id="navbar" class="navbar">
<!--        <ul>
          <li><a href="#hero">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#services">Services</a></li>
          <li><a href="#portfolio">Portfolio</a></li>
          <li><a href="#team">Team</a></li>
          <li><a href="blog.html">Blog</a></li>
          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
          <li><a href="#contact">Contact</a></li>
        </ul>-->
        <ul>
                    <li><a href="welcome.jsp" style="text-decoration: none">Home</a></li>
                    <li><a href="welcome.jsp#about" style="text-decoration: none">About</a></li>
                    <!-- <li><a href="#services ">Services</a></li>
                    <li><a href="#portfolio ">Portfolio</a></li>
                    <li><a href="#team ">Team</a></li>-->
                    <li>
                        <a href="notify.jsp"style="text-decoration: none">Notification</a>
                    </li>
                    <li class="dropdown "><a href="# "style="text-decoration: none"><span>Donate Blood</span> <i class="bi bi-chevron-down dropdown-indicator "></i></a>
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
                             <li><a href="appointment.jsp" style="text-decoration: none">Get Appointment</a></li>
                            <li><a href="camps.jsp" style="text-decoration: none">Blood Donation camps</a></li>
                            <!--<li><a href="# ">Voluntary Donar Group</a></li>-->
                            <li><a href="welcome.jsp#about" style="text-decoration: none">About Blood donation</a></li>
                        </ul>
                    </li>
                    <li class="dropdown "><a href="# " style="text-decoration: none"><span>Search for Blood</span> <i class="bi bi-chevron-down dropdown-indicator "></i></a>
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
                            <li><a href="searchblood.jsp" style="text-decoration: none">Search for Blood</a></li>
                            <li><a href="avail.jsp " style="text-decoration: none">Blood availability</a></li>
                            <li><a href="directory.jsp " style="text-decoration: none">Blood bank directory</a></li>
                             <li><a href="#" style="text-decoration: none">Thalassemia</a></li>
                            <!-- <li><a href="# ">Drop Down 4</a></li> -->
                        </ul>
                    </li>
                    <li class="dropdown "><a href="# " style="text-decoration: none"><span>Welcome <%= username%><br>&nbsp;&nbsp;&nbsp;&nbsp;userid:<%= myid%> </span> <i class="bi bi-chevron-down dropdown-indicator "></i></a>
                        <ul>
                            <li><a href="index.html" style="text-decoration: none">Logout</a></li>
                           
                        </ul>
                    </li>
                    <!--<li><a href="#contact ">Login</a></li>-->
                </ul>
      </nav><!-- .navbar -->

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
  </header><!-- End Header -->
  <!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
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

     <!-- ======= profile section ======= -->
    
    <div class="container">
        <h4 style="margin-left:20px;">Blood Donation Camps</h4>
  
      
      
     
<TABLE id="customers">
                <TR>
                    <!--<th><input type="checkbox" id='checkall' title="Select all"/></th>-->
                    <TH>State</TH>
                    <TH>District</TH>

                    <TH>City</TH>
                    <TH>Blood Bank Name</TH>
                    <TH>Hospital</TH>
                    <TH>Contact</TH>
                    <TH>Category</TH>
                    
                    
                    <TH>Email ID</TH>
                    <TH>Admin ID</TH>
                   
                    <th>Time</th>
                                      
                    
                    
                    
                    

                    
                   
                    
                </TR>
                 <%
                    while(rs1.next()){%>
                    <tr style="margin-top: 5px;">
                    
                <TD> <p id="val"><%= rs1.getString(1)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(2)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(3)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(4)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(5)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(6)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(7)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(8)%></p></TD>
                <TD> <p id="val"><%= rs1.getString(9)%></p></TD>
                <!--<TD> <p id="val"><a href="#" onclick="alert('I am a popup!');">Register now</a></p></TD>-->
                <TD> <p id="val"><%= rs1.getString(10)%></p></TD>
               
               
                
                <!--<td><form method = "post" action = "donate.jsp"><input type="hidden" name="reqid" value=""><button><i class="fa-solid fa-trash"></i>donate now</button></form></td>-->
                </tr>
                <%}%>
</table>

    
    <!-- ======= Blog Section ======= -->
    


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


