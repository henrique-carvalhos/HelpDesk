<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.ChamadoDAO" %>
<%@page import="model.Chamado" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Chamados</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="stylesheet" href="css/grid.scss">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg " style="background-color: #aaaba9;">
        <div class="container-fluid">
          <a class="navbar-brand" href="../index.jsp">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cpu" viewBox="0 0 16 16">
                <path d="M5 0a.5.5 0 0 1 .5.5V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2A2.5 2.5 0 0 1 14 4.5h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14a2.5 2.5 0 0 1-2.5 2.5v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14A2.5 2.5 0 0 1 2 11.5H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2A2.5 2.5 0 0 1 4.5 2V.5A.5.5 0 0 1 5 0zm-.5 3A1.5 1.5 0 0 0 3 4.5v7A1.5 1.5 0 0 0 4.5 13h7a1.5 1.5 0 0 0 1.5-1.5v-7A1.5 1.5 0 0 0 11.5 3h-7zM5 6.5A1.5 1.5 0 0 1 6.5 5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3zM6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
              </svg>
              HelpDesk
          </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="../index.jsp">Página inicial</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Chamados
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="lista-chamados.jsp">Lista de Chamados</a></li>
                  <li><a class="dropdown-item" href="../criar-chamado.jsp">Criar Chamado</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Cadastros
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="../cadastrar-solicitantes.jsp">Solicitantes</a></li>
                  <li><a class="dropdown-item" href="../cadastrar-empresas.html">Empresas</a></li>
                  <li><a class="dropdown-item" href="../cadastrar-departamentos.html">Departamentos</a></li>
                  <li><a class="dropdown-item" href="../cadastrar-locais.html">Locais</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Consultas
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="consulta_geral_solicitantes.jsp">Solicitantes</a></li>
                  <li><a class="dropdown-item" href="consulta_geral_empresas.jsp">Empresas</a></li>
                  <li><a class="dropdown-item" href="consulta_geral_depart.jsp">Departamentos</a></li>
                  <li><a class="dropdown-item" href="consulta_geral_locais.jsp">Locais</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
    </nav>
    <div class="row g-3 border p-3 mx-auto" style="max-width: 95%; margin: 50px auto">
        <p class="h3">Lista de Chamados</p>
        <%      
            ChamadoDAO chamadoDAO = new ChamadoDAO();
            List<Chamado> chamados = new ArrayList<>();
            chamados = chamadoDAO.consultarGeral();
            int n_reg = 0;
            for (int i = 0; i < chamados.size(); i++) {   
        %>
        <div class="card mb-3">
            <div class="card-header">
                Código: <%= chamados.get(i).getId_chamado() %>
            </div>
            <div class="card-body">
                <h5 class="card-title">Assunto: <%= chamados.get(i).getAssunto() %></h5>
                <h6 class="card-text">Descrição <%= chamados.get(i).getDescricao() %></h6>
                <p class="card-text">Solicitante: <%= chamados.get(i).getSolicitante() %></p>
                <p class="card-text">Empresa: <%= chamados.get(i).getEmpresa() %></p>
                <p class="card-text">Status: <%= chamados.get(i).getStatus() %></p>
                <a href="../alterar/alterar_status_chamado.jsp?id_chamado=<%= chamados.get(i).getId_chamado() %>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                    </svg>
                </a>
            </div>
        </div>
        <% 
            n_reg++;
            }    
        %>
    </div>
</body>
</html>