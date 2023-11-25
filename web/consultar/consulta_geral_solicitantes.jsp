<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.SolicitanteDAO" %>
<%@page import="model.Solicitante" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Solicitantes</title>
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
                <a class="nav-link dropdown-toggle" href="#" role"button" data-bs-toggle="dropdown" aria-expanded="false">
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
    <div class="row g-3 p-3 mx-auto" style="max-width: 95%; margin: 50px auto">
        <p class="h3">Lista de Solicitantes</p>
        <div class="row">
            <%
            SolicitanteDAO solicitanteDAO = new SolicitanteDAO();
            List<Solicitante> solicitantes = new ArrayList<>();
            solicitantes = solicitanteDAO.consultarGeral();
            for (Solicitante solicitante : solicitantes) {
            %>
            <div class="col-12 col-sm-6 col-md-4">
                <div class="card mb-3">
                    <div class="card-header">
                        Código: <%= solicitante.getId_solic() %>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Nome: <%= solicitante.getNome_solic() %> <%= solicitante.getSobrenome_solic() %></h5>
                        <p class="card-text">Empresa: <%= solicitante.getEmpresa() %></p>
                        <p class="card-text">Departamento: <%= solicitante.getDepartamento() %></p>
                        <p class="card-text">Local: <%= solicitante.getLocal() %></p>
                        <div class="text-end">
                            <a href="../alterar/editar_solicitante.jsp?id_solic=<%= solicitante.getId_solic() %>" class="btn btn-primary">Editar</a>
                            <a href="../inativar/inativar_solic.jsp?id_solic=<%= solicitante.getId_solic() %>" class="btn btn-danger">Inativar</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>
</body>
</html>
