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

<html>
    <head>
        <meta charset="UTF-8">
        <title>Criar Chamado</title>
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
                    <a class="nav-link active" aria-current="page" href="index.jsp">P�gina inicial</a>
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
        <form class="row g-3 border p-3 mx-auto" style="max-width: 90%; margin: 50px auto" method="post" action="cadastrar/cadastrar_chamado.jsp">
            <p class="h3">Criar Chamado</p>
            <div class="col-12">
              <label for="inputState" class="form-label">Solicitante</label>
              <select name="nomeSolicitante" class="form-select">
                <option name="nomeSolicitante" selected></option>
                    <%      
                        SolicitanteDAO solicitanteDAO = new SolicitanteDAO();

                        List<Solicitante> solicitantes  = new ArrayList<>();
                        solicitantes = solicitanteDAO.consultarGeral();
                        int n_r = 0;
                        for(int i=0; i<=solicitantes.size() - 1;i++){   

                    %>
                    <option id="<%= solicitantes.get(i).getId_solic() %>"><%= solicitantes.get(i).getNome_solic()+" "+ solicitantes.get(i).getSobrenome_solic() %></option>
                    <% 
                        n_r++;
                        }    
                    %>
              </select>
            </div>
            <div class="col-12">
              <label for="inputState" class="form-label">Assunto</label>
              <select name="assunto1" class="form-select">
                <option selected></option>
                <option>TI</option>
              </select>
            </div>
            <div class="col-12">
              <select name="assunto2" class="form-select">
                <option selected></option>
                <option>EQUIPAMENTOS</option>
                <option>SISTEMAS</option>
                <option>INTERNET</option>
              </select>
            </div>
            <div class="col-12">
              <select name="assunto3" class="form-select">
                <option selected></option>
                <option>COMPUTADOR</option>
                <option>IMPRESSORA</option>
                <option>ROTEADOR</option>
                <option>SISTEMA</option>
              </select>
            </div>
            <div class="col-12">
              <label for="inputState" class="form-label">Tipo da Solicita��o</label>
              <select name="tipoSolicitacao" class="form-select">
                <option selected></option>
                <option>MELHORIA</option>
                <option>ERRO</option>
                <option>COMPRA</option>
              </select>
            </div>
            <div class="col-12">
               <label for="inputState" class="form-label">Status</label>
              <select name="status" class="form-select">
                <option selected></option>
                <option>Aberto</option>
              </select>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Descri��o</label>
                <textarea name="descricao" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <div class="col-12">
              <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
        </form>
    </body>
</html>
