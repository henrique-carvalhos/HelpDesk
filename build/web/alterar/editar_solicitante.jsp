<%-- 
    Document   : alterar_solicitante
    Created on : 1 de nov. de 2023, 14:18:59
    Author     : Henrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.dao.SolicitanteDAO"%>
<%@page import="model.Solicitante"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.LocalDAO" %>
<%@page import="model.Local" %>
<%@page import="model.dao.EmpresaDAO" %>
<%@page import="model.Empresa" %>
<%@page import="model.dao.DepartamentoDAO" %>
<%@page import="model.Departamento" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <link rel="stylesheet" href="css/grid.scss">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
        <title>Editar solicitante</title>
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
        <%
        String solic = request.getParameter("id_solic");
        
        Solicitante solicitante = new Solicitante();
        solicitante.setId_solic(solic);
        
        SolicitanteDAO solicitanteDAO = new SolicitanteDAO();
        
        if (solicitanteDAO.consultarId(solicitante) != null){
        %>
        <form class="row g-3 border p-3 mx-auto" style="max-width: 90%; margin: 50px auto" method="post" action="update_solic.jsp?id_solic=<%= solicitante.getId_solic() %>">
            <p class="h3" name="solicitante" value="<%= solicitante.getId_solic() %>">Editar solicitante - <%= solicitante.getId_solic() %></p>
            <div class="col-md-6">
              <label for="inputEmail4" class="form-label">Nome</label>
              <input type="text" class="form-control" name="nomeSolicitante" value="<%= solicitante.getNome_solic() %>">
            </div>
            <div class="col-md-6">
              <label for="inputPassword4" class="form-label">Sobrenome</label>
              <input type="text" class="form-control" name="sobrenomeSolicitante" value="<%= solicitante.getSobrenome_solic() %>">
            </div>
            <div class="col-12">
              <label for="inputPassword4" class="form-label">Email</label>
              <input type="email" class="form-control" value="<%= solicitante.getEmail_solic() %>" name="email">
            </div>
            <div class="col-12">
              <label for="inputState" class="form-label">Empresa</label>
              <select name="empresa" id="inputState" class="form-select">
                  <option selected><%= solicitante.getEmpresa() %></option>
                    <%      
                        EmpresaDAO empresaDAO = new EmpresaDAO();

                        List<Empresa> empresas  = new ArrayList<>();
                        empresas = empresaDAO.consultarGeral();
                        int n_r = 0;
                        for(int i=0; i<=empresas.size() - 1;i++){   

                    %>
                    <option id="<%= empresas.get(i).getId_empresa() %>"><%= empresas.get(i).getNome_fantasia() %></option>
                    <% 
                        n_r++;
                        }    
                    %>
              </select>
            </div>
            <div class="col-12">
              <label for="inputState" class="form-label">Departamento</label>
              <select name="departamento" id="inputState" class="form-select">
                <option selected><%= solicitante.getDepartamento() %></option>
                <%      
                DepartamentoDAO departamentoDAO = new DepartamentoDAO();

                List<Departamento> departamentos = new ArrayList<>();
                departamentos = departamentoDAO.consultarGeral();
                int n_reg = 0;
                for(int i=0; i<=departamentos.size() - 1;i++){   

                %>
                  <option id="<%= departamentos.get(i).getId_depart() %>"><%= departamentos.get(i).getNome_depart() %></option>
                <% 
                    n_reg++;
                    }    
                %>
              </select>
            </div>
            <div class="col-12">
              <label for="inputState" class="form-label">Local</label>
              <select name="local" id="inputState" class="form-select">
                <option selected><%= solicitante.getLocal() %></option>
                    <%      
                        LocalDAO localDAO = new LocalDAO();

                        List<Local> locais  = new ArrayList<>();
                        locais = localDAO.consultarGeral();
                        int n_re = 0;
                        for(int i=0; i<=locais.size() - 1;i++){   

                    %>
                    <option id="<%= locais.get(i).getId_local() %>"><%= locais.get(i).getNome_local() %></option> 
                    <% 
                        n_re++;
                        }    
                    %>
              </select>
            </div>
            <div class="col-12">
              <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
        </form>
        <%          
        }else{
            out.println("<br> <b>Solicitante não encontrado! <b>");
        }       
        
        %>
    </body>
</html>
