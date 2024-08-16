<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- 
    - primary meta tags
  -->
  <title>Learner's Hub</title>
  <meta name="title" content="Youdemi">
  <meta name="description" content="This is a educational website  made by Srujan">

  <!-- 
    - favicon
  -->
  <link rel="shortcut icon" href="favicon.png" type="image/svg+xml">

  <!-- 
    - custom font link
  -->
  <link rel="stylesheet" href="./assets/font/font.css">

  <!-- 
    - custom css link
  -->
  <link rel="stylesheet" href="./assets/css/Home.css">

  <!-- 
    - preload images
  -->
  <link rel="preload" as="image" href="./assets/images/hero-banner.png">
  <link rel="preload" as="image" href="./assets/images/hero-bg.png">

  <style>
    /* Profile Picture */
.profile-pic{
   display: inline-block;
   vertical-align: middle;
    width: 50px;
    height: 50px;
    overflow: hidden;
   border-radius: 50%;
}

.profile-pic img{
   width: 100%;
   height: auto;
   object-fit: cover;
}
.profile-menu .dropdown-menu {
  right: 0;
  left: unset;
}
.profile-menu .fa-fw {
  margin-right: 10px;
}

.toggle-change::after {
  border-top: 0;
  border-bottom: 0.3em solid;
}
</style>

</head>

<body>
<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	String isAuthenticated = (String) session.getAttribute("user_authenticated");
	String user_type = (String) session.getAttribute("user_type");
	if ((isAuthenticated != "true")) {
		response.sendRedirect("SelectLogin.html");
	}
%>

  <!-- 
    - PRELOADER
  -->

  <div class="preloader" data-preloader>
    <div class="circle" data-circle></div>
  </div>





  <!-- 
    - #HEADER
  -->

  <header class="header" data-header>
    <div class="container">

      <a href="#" class="logo">
        <img src="./assets/images/178689472_padded_logo-removebg-preview.png" width="180" height="40" alt="Learner's Hub ">
      </a>

      <nav class="navbar" data-navbar>

        <div class="navbar-top">
          <a href="#" class="logo">
            <img src="./assets/images/178689472_padded_logo-removebg-preview.png" width="180" height="40" alt="Learner's Hub">
          </a>

          <button class="nav-close-btn" aria-label="close menu" data-nav-toggler>
            <ion-icon name="close-outline" aria-hidden="true"></ion-icon>
          </button>
        </div>

        <ul class="navbar-list">

          <li class="navbar-item">
            <a href="#" class="navbar-link title-sm" data-nav-link>Home</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link title-sm" data-nav-link>About</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link title-sm" data-nav-link>Contact</a>
          </li>

          <!-- <li class="navbar-item">
            <a href="#" class="navbar-link title-sm" data-nav-link>Logout</a>
          </li> -->

          <!-- <img src="./assets/images/Navbar profile.jfif" class="user-pic"> -->
          <li class="nav-item">
	          <ul class="mb-2 mb-lg-0 profile-menu"> 
	              <div class="" href="#" style="position: relative;">
	                <div class="profile-pic dropdown-trigger" onclick="toggleDOM('acc-dropdown');" style="cursor: pointer;" dropdown-target="acc-dropdown">
	                    <img src="./assets/images/download.png" alt="Profile Picture">
	                </div>
	                <div class="dropdown" id="acc-dropdown" style="display: none;">
	                    <ul>
                            <% if (user_type == "student") { %>
						        <li> <span style="cursor:pointer" onclick="window.location.href='./dashboard'">Dashboard </span> </li>
							<% } else { %>
						        <li> <span style="cursor:pointer" onclick="window.location.href='./dashboard1'">Dashboard </span> </li>
							<% } %>
	                        <li> <span style="cursor:pointer" onclick="window.location.href='./logout'">Logout</span> </li>
	                    </ul>
	                </div>
	              </div>
               </ul>
           </li>
        </ul>
        

      </nav>

      <!-- <a href="register1.html" class="btn btn-navi">Register for Free</a> -->

      <button class="nav-open-btn" aria-label="open menu" data-nav-toggler>
        <ion-icon name="menu-outline" aria-hidden="true"></ion-icon>
      </button>

      <div class="overlay" data-overlay data-nav-toggler></div>

    </div>
  </header>





  <main>
    <article>

      <!-- 
        - #HERO
      -->

      <section class="section hero has-bg-image" aria-labelledby="hero-label"
        style="background-image: url('./assets/images/hero-bg.png')">
        <div class="container">

          <div class="hero-content">

            <h1 class="headline-lg" id="hero-label">
              Unlock <span class="span">Your Potential:</span> With Learner's Hub
            </h1>

            <p class="title-md has-before">
              Learner's Hub is Your Gateway to Knowledge.
            </p>

            <div class="btn-group">
              <!-- <a href="#" class="btn btn-primary">SignUp</a> -->

              <a href="#" class="btn btn-secondary">Enroll Course</a>
            </div>

          </div>

          <figure class="hero-banner">
            <img src="./assets/images/hero-banner.png" width="590" height="620" alt="hero banner" class="w-100">
          </figure>

        </div>
      </section>





      <!-- 
        - #CATEGORY
      -->

      <section class="section category has-bg-image" aria-labelledby="category-label"
        style="background-image: url('./assets/images/category-bg.png')">
        <div class="container">

          <p class="title-sm text-center section-subtitle" id="category-label">Course Categories</p>

          <h2 class="headline-md text-center section-title">
            Browse Top <span class="span has-after">Categories</span>
          </h2>

          <ul class="grid-list">

            <li>
              <div class="card category-card">

                <div class="card-icon">
                  <img src="./assets/images/category-1.svg" width="72" height="72" loading="lazy"
                    alt="Data Science icon">
                </div>

                <div>
                  <h3 class="title-lg">Data Science</h3>

                  <p class="title-sm">68 Courses</p>
                </div>

                <a href="#" class="layer-link" aria-label="Data Science Category"></a>

              </div>
            </li>

            <li>
              <div class="card category-card">

                <div class="card-icon">
                  <img src="./assets/images/category-2.svg" width="72" height="72" loading="lazy"
                    alt="UI/UX Design icon">
                </div>

                <div>
                  <h3 class="title-lg">UI/UX Design</h3>

                  <p class="title-sm">68 Courses</p>
                </div>

                <a href="#" class="layer-link" aria-label="UI/UX Design Category"></a>

              </div>
            </li>

            <li>
              <div class="card category-card">

                <div class="card-icon">
                  <img src="./assets/images/category-3.svg" width="72" height="72" loading="lazy"
                    alt="Modern Physics icon">
                </div>

                <div>
                  <h3 class="title-lg">Modern Physics</h3>

                  <p class="title-sm">68 Courses</p>
                </div>

                <a href="#" class="layer-link" aria-label="Modern Physics Category"></a>

              </div>
            </li>

            <li>
              <div class="card category-card">

                <div class="card-icon">
                  <img src="./assets/images/category-4.svg" width="72" height="72" loading="lazy"
                    alt="Music Production icon">
                </div>

                <div>
                  <h3 class="title-lg">Music Production</h3>

                  <p class="title-sm">68 Courses</p>
                </div>

                <a href="#" class="layer-link" aria-label="Music Production Category"></a>

              </div>
            </li>

            <li>
              <div class="card category-card">

                <div class="card-icon">
                  <img src="./assets/images/category-5.svg" width="72" height="72" loading="lazy"
                    alt="Data Science icon">
                </div>

                <div>
                  <h3 class="title-lg">Data Science</h3>

                  <p class="title-sm">68 Courses</p>
                </div>

                <a href="#" class="layer-link" aria-label="Data Science Category"></a>

              </div>
            </li>

            <li>
              <div class="card category-card">

                <div class="card-icon">
                  <img src="./assets/images/category-6.svg" width="72" height="72" loading="lazy" alt="Finances icon">
                </div>

                <div>
                  <h3 class="title-lg">Finances</h3>

                  <p class="title-sm">68 Courses</p>
                </div>

                <a href="#" class="layer-link" aria-label="Finances Category"></a>

              </div>
            </li>

          </ul>

          <a href="#" class="btn btn-navi">View All Categories</a>

        </div>
      </section>





      <!-- 
        - #ABOUT
      -->

      <section class="section about" aria-labelledby="about-label">
        <div class="container">

          <figure class="about-banner">
            <img src="./assets/images/about-banner.png" width="775" height="685" loading="lazy" alt="about banner"
              class="w-100">
          </figure>

          <div class="about-content">

            <p class="title-sm section-subtitle" id="about-label">About Learner's Hub</p>

            <h2 class="headline-md section-title">
              We Provide The Best Online <span class="span has-after">Education</span>
            </h2>

            <p class="title-sm section-text">
              Our platform offers a comprehensive array of top-tier educational courses to empower learners of all backgrounds & aspirations. Dive into a world of unparalleled learning experiences crafted by leading experts in their fields and unleash your full potential.
            </p>

            <ul class="progress-list">

              <li>
                <div class="progress-label-wrapper">
                  <p class="title-sm">Business Studies</p>

                  <p class="title-sm">86%</p>
                </div>

                <div class="progress">
                  <div class="progress-fill red"></div>
                </div>
              </li>

              <li>
                <div class="progress-label-wrapper">
                  <p class="title-sm">Marketing</p>

                  <p class="title-sm">67%</p>
                </div>

                <div class="progress">
                  <div class="progress-fill green"></div>
                </div>
              </li>

              <li>
                <div class="progress-label-wrapper">
                  <p class="title-sm">Design & Development</p>

                  <p class="title-sm">95%</p>
                </div>

                <div class="progress">
                  <div class="progress-fill yellow"></div>
                </div>
              </li>

            </ul>

          </div>

        </div>
      </section>





      <!-- 
        - #COURSE
      -->
<!-- 
      <section class="section course has-bg-image" aria-labelledby="course-label"
        style="background-image: url('./assets/images/course-bg.png')">
        <div class="container">

          <p class="title-sm section-subtitle text-center">Featured Courses</p>

          <h2 class="headline-md section-title text-center" id="course-label">
            Choose Unlimited <span class="span has-after">Courses</span>
          </h2>

          <ul class="grid-list">

            <li class="card-container">
              <div class="card course-card">

                <figure class="card-banner">
                  <img src="./assets/images/course-1.png" width="370" height="248" loading="lazy"
                    alt="Basic Fundamentals of Interior & Graphics Design" class="img-cover">
                </figure>

                <div class="card-content">

                  <div class="wrapper">

                    <p class="title-lg card-price">$29.28</p>

                    <div class="rating-wrapper">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                    </div>

                  </div>

                  <h3 class="title-lg card-title">
                    Basic Fundamentals of Interior & Graphics Design
                  </h3>

                  <div class="card-meta wrapper">

                    <p class="title-sm">
                      <img src="./assets/images/file-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">2 Lessons</span>
                    </p>

                    <p class="title-sm">
                      <img src="./assets/images/user-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">4k Students</span>
                    </p>

                  </div>

                </div>

                <a href="#" class="layer-link"
                  aria-label="Course Details, Basic Fundamentals of Interior & Graphics Design"></a>

              </div>
            </li>

            <li class="card-container">
              <div class="card course-card">

                <figure class="card-banner">
                  <img src="./assets/images/course-2.png" width="370" height="248" loading="lazy"
                    alt="Increasing Engagement with Instagram & Facebook" class="img-cover">
                </figure>

                <div class="card-content">

                  <div class="wrapper">

                    <p class="title-lg card-price">Free</p>

                    <div class="rating-wrapper">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                    </div>

                  </div>

                  <h3 class="title-lg card-title">
                    Increasing Engagement with Instagram & Facebook
                  </h3>

                  <div class="card-meta wrapper">

                    <p class="title-sm">
                      <img src="./assets/images/file-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">2 Lessons</span>
                    </p>

                    <p class="title-sm">
                      <img src="./assets/images/user-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">4k Students</span>
                    </p>

                  </div>

                </div>

                <a href="#" class="layer-link"
                  aria-label="Course Details, Increasing Engagement with Instagram & Facebook"></a>

              </div>
            </li>

            <li class="card-container">
              <div class="card course-card">

                <figure class="card-banner">
                  <img src="./assets/images/course-3.png" width="370" height="248" loading="lazy"
                    alt="Introduction to Color Theory & Basic UI/UX" class="img-cover">
                </figure>

                <div class="card-content">

                  <div class="wrapper">

                    <p class="title-lg card-price">$72.39</p>

                    <div class="rating-wrapper">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                    </div>

                  </div>

                  <h3 class="title-lg card-title">
                    Introduction to Color Theory & Basic UI/UX
                  </h3>

                  <div class="card-meta wrapper">

                    <p class="title-sm">
                      <img src="./assets/images/file-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">2 Lessons</span>
                    </p>

                    <p class="title-sm">
                      <img src="./assets/images/user-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">4k Students</span>
                    </p>

                  </div>

                </div>

                <a href="#" class="layer-link"
                  aria-label="Course Details, Introduction to Color Theory & Basic UI/UX"></a>

              </div>
            </li>

            <li class="card-container">
              <div class="card course-card">

                <figure class="card-banner">
                  <img src="./assets/images/course-4.png" width="370" height="248" loading="lazy"
                    alt="Financial Security Thinking and Principles Theory" class="img-cover">
                </figure>

                <div class="card-content">

                  <div class="wrapper">

                    <p class="title-lg card-price">$72.39</p>

                    <div class="rating-wrapper">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                    </div>

                  </div>

                  <h3 class="title-lg card-title">
                    Financial Security Thinking and Principles Theory
                  </h3>

                  <div class="card-meta wrapper">

                    <p class="title-sm">
                      <img src="./assets/images/file-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">2 Lessons</span>
                    </p>

                    <p class="title-sm">
                      <img src="./assets/images/user-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">4k Students</span>
                    </p>

                  </div>

                </div>

                <a href="#" class="layer-link"
                  aria-label="Course Details, Financial Security Thinking and Principles Theory"></a>

              </div>
            </li>

            <li class="card-container">
              <div class="card course-card">

                <figure class="card-banner">
                  <img src="./assets/images/course-5.png" width="370" height="248" loading="lazy"
                    alt="Logo Design: From Concept to Presentation" class="img-cover">
                </figure>

                <div class="card-content">

                  <div class="wrapper">

                    <p class="title-lg card-price">Free</p>

                    <div class="rating-wrapper">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                    </div>

                  </div>

                  <h3 class="title-lg card-title">
                    Logo Design: From Concept to Presentation
                  </h3>

                  <div class="card-meta wrapper">

                    <p class="title-sm">
                      <img src="./assets/images/file-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">2 Lessons</span>
                    </p>

                    <p class="title-sm">
                      <img src="./assets/images/user-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">4k Students</span>
                    </p>

                  </div>

                </div>

                <a href="#" class="layer-link"
                  aria-label="Course Details, Logo Design: From Concept to Presentation"></a>

              </div>
            </li>

            <li class="card-container">
              <div class="card course-card">

                <figure class="card-banner">
                  <img src="./assets/images/course-6.png" width="370" height="248" loading="lazy"
                    alt="Professional Ceramic Moulding for Beginners" class="img-cover">
                </figure>

                <div class="card-content">

                  <div class="wrapper">

                    <p class="title-lg card-price">$29.82</p>

                    <div class="rating-wrapper">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                      <img src="./assets/images/star-fill.svg" width="16" height="16" loading="lazy" alt="">
                    </div>

                  </div>

                  <h3 class="title-lg card-title">
                    Professional Ceramic Moulding for Beginners
                  </h3>

                  <div class="card-meta wrapper">

                    <p class="title-sm">
                      <img src="./assets/images/file-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">2 Lessons</span>
                    </p>

                    <p class="title-sm">
                      <img src="./assets/images/user-outline.svg" width="20" height="20" loading="lazy" alt="">

                      <span class="span">4k Students</span>
                    </p>

                  </div>

                </div>

                <a href="#" class="layer-link"
                  aria-label="Course Details, Professional Ceramic Moulding for Beginners"></a>

              </div>
            </li>

          </ul>

          <a href="#" class="btn btn-primary">View All Courses</a>

        </div>
      </section>
 -->




      <!-- 
        - #CTA
      -->

      <section class="cta" aria-labelledby="cta-label">
        <div class="container">

          <h2 class="headline-md section-title" id="cta-label">
            Education Is About Creating Leaders For Tomorrow
          </h2>

          <a href="#" class="btn btn-tertiary">Take Course </a>

        </div>
      </section>

    </article>
  </main>





  <!-- 
    - #FOOTER
  -->

  <footer class="footer has-bg-image" style="background-image: url('./assets/images/footer-bg.png')">

    <div class="section footer-top">
      <div class="container">

        <div class="footer-brand">

          <a href="#" class="logo">
            <img src="./assets/images/178689472_padded_logo-removebg-preview.png" width="290" height="50" alt="Youdemi home">
          </a>

          <p class="title-sm footer-text">
            Backed by years of expertise and a team of seasoned professionals, we continuously raise the bar, setting new benchmarks for success.
          </p>

          <ul class="social-list">

            <li>
              <a href="#" class="social-link">
                <img src="./assets/images/facebook.svg" width="40" height="40" loading="lazy" alt="facebook">
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <img src="./assets/images/twitter.svg" width="40" height="40" loading="lazy" alt="twitter">
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <img src="./assets/images/pinterest.svg" width="40" height="40" loading="lazy" alt="pinterest">
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <img src="./assets/images/instagram.svg" width="40" height="40" loading="lazy" alt="instagram">
              </a>
            </li>

          </ul>

        </div>

        <ul class="footer-list">

          <li>
            <p class="headline-sm footer-list-title">Links</p>
          </li>

          <li>
            <a href="#" class="title-sm footer-link">Home</a>
          </li>

          <li>
            <a href="#" class="title-sm footer-link">About Us</a>
          </li>

          <!-- <li>
            <a href="#" class="title-sm footer-link">Pricing</a>
          </li> -->

          <li>
            <a href="#" class="title-sm footer-link">Courses</a>
          </li>

          <li>
            <a href="#" class="title-sm footer-link">Contact Us</a>
          </li>

          <!-- <li>
            <a href="#" class="title-sm footer-link">Blog</a>
          </li> -->

        </ul>

        <ul class="footer-list">

          <li>
            <p class="headline-sm footer-list-title">Legal</p>
          </li>

          <!-- <li>
            <a href="#" class="title-sm footer-link">Legal</a>
          </li> -->

          <!-- <li>
            <a href="#" class="title-sm footer-link">Tearms of Use</a>
          </li> -->

          <li>
            <a href="#" class="title-sm footer-link">Terms & Conditions</a>
          </li>

          <li>
            <a href="#" class="title-sm footer-link">Payment Method</a>
          </li>

          <li>
            <a href="#" class="title-sm footer-link">Privacy Policy</a>
          </li>

        </ul>

        <ul class="footer-list">

          <li>

            <p class="headline-sm footer-list-title">Instagram Post</p>

            <ul class="grid-list">

              <li>
                <img src="./assets/images/ins-1.png" width="80" height="80" loading="lazy" alt="instagram post"
                  class="img-cover">
              </li>

              <li>
                <img src="./assets/images/ins-2.png" width="80" height="80" loading="lazy" alt="instagram post"
                  class="img-cover">
              </li>

              <li>
                <img src="./assets/images/ins-3.png" width="80" height="80" loading="lazy" alt="instagram post"
                  class="img-cover">
              </li>

              <li>
                <img src="./assets/images/ins-4.png" width="80" height="80" loading="lazy" alt="instagram post"
                  class="img-cover">
              </li>

              <li>
                <img src="./assets/images/ins-5.png" width="80" height="80" loading="lazy" alt="instagram post"
                  class="img-cover">
              </li>

              <li>
                <img src="./assets/images/ins-6.png" width="80" height="80" loading="lazy" alt="instagram post"
                  class="img-cover">
              </li>

            </ul>

          </li>

        </ul>

      </div>
    </div>

    <div class="footer-bottom">
      <div class="container">

        <p class="copyright">
          © Copyright 2024 | Learner's Hub.lnc | All Rights Reserved by Srujan Kumar
        </p>

      </div>
    </div>

  </footer>





  <!-- 
   - custom js link
  -->
  <script src="./assets/js/script.js"></script>

  <!-- 
    - ionicon
  -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

</html>