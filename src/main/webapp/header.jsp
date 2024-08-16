<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <header class="header" data-header style="background-image: url('./assets/images/hero-bg.png')">
    <div class="container ">

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
            <a href="./Home.jsp" class="navbar-link title-sm" data-nav-link>Home</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link title-sm" data-nav-link>About</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link title-sm" data-nav-link>Contact</a>
          </li>

          <li class="navbar-item">
            <a href="logout" class="navbar-link title-sm" data-nav-link >Logout</a>
          </li>
          
          <!-- <form class="navbar-item" action="logout">
            <input class="navbar-link title-sm" type="submit"  data-nav-link value="LogOut">
          </form> -->

        </ul>

      </nav>
	
	  <% if (user_type == "admin") { %>
      <a href="#" class="btn btn-navi">Courses</a>
    <% } else { %>
      <a href="#" class="btn btn-navi">Register Course</a>
    <% } %>

      <button class="nav-open-btn" aria-label="open menu" data-nav-toggler>
        <ion-icon name="menu-outline" aria-hidden="true"></ion-icon>
      </button>

      <div class="overlay" data-overlay data-nav-toggler></div>

    </div>

    
  <script src="./assets/js/script.js"></script>

  <!-- 
    - ionicon
  -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
  
  </header>