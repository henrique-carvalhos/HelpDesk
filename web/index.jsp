<%@page import="java.util.List"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="model.dao.ChamadoDAO"%>
<%@page import="model.Chamado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bem vindo!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        
        <link rel="stylesheet" href="css/grid.scss">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-lg " style="background-color: #aaaba9;">
            <div class="container-fluid">
              <a class="navbar-brand" href="index.jsp">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cpu" viewBox="0 0 16 16">
                    <path d="M5 0a.5.5 0 0 1 .5.5V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2A2.5 2.5 0 0 1 14 4.5h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14a2.5 2.5 0 0 1-2.5 2.5v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14A2.5 2.5 0 0 1 2 11.5H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2A2.5 2.5 0 0 1 4.5 2V.5A.5.5 0 0 1 5 0zm-.5 3A1.5 1.5 0 0 0 3 4.5v7A1.5 1.5 0 0 0 4.5 13h7a1.5 1.5 0 0 0 1.5-1.5v-7A1.5 1.5 0 0 0 11.5 3h-7zM5 6.5A1.5 1.5 0 0 1 6.5 5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3zM6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
                  </svg>
                  HelpDesk
              </a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Página inicial</a>
                  </li>
                   <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Chamados
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="consultar/lista-chamados.jsp">Lista de Chamados</a></li>
                      <li><a class="dropdown-item" href="criar-chamado.jsp">Criar Chamado</a>
                    </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Cadastros
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="cadastrar-solicitantes.jsp">Solicitantes</a></li>
                      <li><a class="dropdown-item" href="cadastrar-empresas.html">Empresas</a>
                      <li><a class="dropdown-item" href="cadastrar-departamentos.html">Departamentos</a>
                      <li><a class="dropdown-item" href="cadastrar-locais.html">Locais</a>
                    </ul>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Consultas
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="consultar/consulta_geral_solicitantes.jsp">Solicitantes</a></li>
                      <li><a class="dropdown-item" href="consultar/consulta_geral_empresas.jsp">Empresas</a>
                      <li><a class="dropdown-item" href="consultar/consulta_geral_depart.jsp">Departamentos</a>
                      <li><a class="dropdown-item" href="consultar/consulta_geral_locais.jsp">Locais</a>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
        </nav>
        <%
        ChamadoDAO chamadoDAO = new ChamadoDAO();
        List<Chamado> chamados = chamadoDAO.consultarStatus();
        %>
    <div class="container">
        <div class="row justify-content-center" style="margin: 50px auto;">
            <div class="col-12">
                <p class="h3 text-center">Dashboards</p>
            </div>
            <div class="col-5 col-md-3 mt-3 mb-3 mr-3">
                <div class="p-3 mt-3 mb-3 text-dark rounded text-center h-100 d-flex flex-column align-items-center justify-content-center" style="background-color: #4A4BFC" >
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-font-fill" viewBox="0 0 16 16">
                            <path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM5.057 6h5.886L11 8h-.5c-.18-1.096-.356-1.192-1.694-1.235l-.298-.01v5.09c0 .47.1.582.903.655v.5H6.59v-.5c.799-.073.898-.184.898-.654V6.755l-.293.01C5.856 6.808 5.68 6.905 5.5 8H5l.057-2z"/>
                          </svg>
                    <%
                            if (chamados != null && chamados.size() > 3) {
                                out.print("<p>Todos " + chamados.get(3).getStatus() + "</p>");
                            } else {
                                out.print("<p>Todos 0</p>");
                            }
                    %>
                </div>
            </div>
            <div class="col-5 col-md-3 mt-3 mb-3 mr-3">
                <div class="p-3 mt-3 mb-3 text-dark rounded text-center h-100 d-flex flex-column align-items-center justify-content-center" style="background-color: #FF484A">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-door-open-fill" viewBox="0 0 16 16">
                        <path d="M1.5 15a.5.5 0 0 0 0 1h13a.5.5 0 0 0 0-1H13V2.5A1.5 1.5 0 0 0 11.5 1H11V.5a.5.5 0 0 0-.57-.495l-7 1A.5.5 0 0 0 3 1.5V15H1.5zM11 2h.5a.5.5 0 0 1 .5.5V15h-1V2zm-2.5 8c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
                    </svg>
                    <%
                            if (chamados != null && chamados.size() > 0) {
                                out.print("<p>Abertos " + chamados.get(0).getStatus() + "</p>");
                            } else {
                                out.print("<p>Abertos 0</p>");
                            }
                    %>
                </div>
            </div>
            <div class="col-5 col-md-3 mt-3 mb-3 mr-3">
                <div class="p-3 mt-3 mb-3 text-dark rounded text-center h-100 d-flex flex-column align-items-center justify-content-center" style="background-color: #FFFA46">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-x-fill" viewBox="0 0 16 16">
                            <path d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3Zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3Z"/>
                            <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5v-1Zm4 7.793 1.146-1.147a.5.5 0 1 1 .708.708L8.707 10l1.147 1.146a.5.5 0 0 1-.708.708L8 10.707l-1.146 1.147a.5.5 0 0 1-.708-.708L7.293 10 6.146 8.854a.5.5 0 1 1 .708-.708L8 9.293Z"/>
                         </svg>
                    <%
                            if (chamados != null && chamados.size() > 2) {
                                out.print("<p>Em andamento " + chamados.get(2).getStatus() + "</p>");
                            } else {
                                out.print("<p>Em andamento 0</p>");
                            }
                    %>
                </div>
            </div>
            <div class="col-5 col-md-3 mt-3 mb-3 mr-3">
                <div class="p-3 mt-3 mb-3 text-dark rounded text-center h-100 d-flex flex-column align-items-center justify-content-center" style="background-color: #4AFF4A">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-square-fill" viewBox="0 0 16 16">
                            <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z"/>
                        </svg>
                    <%
                            if (chamados != null && chamados.size() > 1) {
                                out.print("<p>Concluidos " + chamados.get(1).getStatus() + "</p>");
                            } else {
                                out.print("<p>Concluidos 0</p>");
                            }
                    %>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
