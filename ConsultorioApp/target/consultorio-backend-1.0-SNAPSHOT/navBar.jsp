<%-- 
    Document   : navBar
    Created on : Oct 2, 2021, 2:40:14 PM
    Author     : jack
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #3cb9aa;">
        <div class="container-fluid">
    <a class="navbar-brand" href="#"><img src="assets/logo2.png".class="img-fluid" width="258px" height="48px" alt=""></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarColor03">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="perfil.jsp">Mi perfil</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Agenda</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="listener.jsp">Listar Medicos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact_us.jsp">Contáctanos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"><img src="assets/pngegg.png".class="img-fluid" width="40px" height="40px" alt="" ></a>
              </li>
            </ul>
            <!--
               <form class="d-flex">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-primary" type="submit">Search</button>
            </form>
            -->
           
          </div>
        </div>
      </nav>