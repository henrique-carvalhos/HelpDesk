package org.apache.jsp.alterar;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Chamado;
import java.util.List;
import java.util.ArrayList;
import model.dao.ChamadoDAO;

public final class alterar_005fstatus_005fchamado_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Alterar Status</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("\n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" href=\"css/grid.scss\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL\" crossorigin=\"anonymous\"></script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-expand-lg \" style=\"background-color: #aaaba9;\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("              <a class=\"navbar-brand\" href=\"index.jsp\">\n");
      out.write("                  <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-cpu\" viewBox=\"0 0 16 16\">\n");
      out.write("                    <path d=\"M5 0a.5.5 0 0 1 .5.5V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2A2.5 2.5 0 0 1 14 4.5h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14a2.5 2.5 0 0 1-2.5 2.5v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14A2.5 2.5 0 0 1 2 11.5H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2A2.5 2.5 0 0 1 4.5 2V.5A.5.5 0 0 1 5 0zm-.5 3A1.5 1.5 0 0 0 3 4.5v7A1.5 1.5 0 0 0 4.5 13h7a1.5 1.5 0 0 0 1.5-1.5v-7A1.5 1.5 0 0 0 11.5 3h-7zM5 6.5A1.5 1.5 0 0 1 6.5 5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3zM6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z\"/>\n");
      out.write("                  </svg>\n");
      out.write("                  HelpDesk\n");
      out.write("              </a>\n");
      out.write("              <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNavDropdown\" aria-controls=\"navbarNavDropdown\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("              </button>\n");
      out.write("              <div class=\"collapse navbar-collapse\" id=\"navbarNavDropdown\">\n");
      out.write("                <ul class=\"navbar-nav\">\n");
      out.write("                  <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link active\" aria-current=\"page\" href=\"index.jsp\">Página inicial</a>\n");
      out.write("                  </li>\n");
      out.write("                   <li class=\"nav-item dropdown\">\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n");
      out.write("                      Chamados\n");
      out.write("                    </a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                      <li><a class=\"dropdown-item\" href=\"consultar/lista-chamados.jsp\">Lista de Chamados</a></li>\n");
      out.write("                      <li><a class=\"dropdown-item\" href=\"criar-chamado.jsp\">Criar Chamado</a>\n");
      out.write("                    </ul>\n");
      out.write("                  </li>\n");
      out.write("                  <li class=\"nav-item dropdown\">\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n");
      out.write("                      Cadastros\n");
      out.write("                    </a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                      <li><a class=\"dropdown-item\" href=\"cadastrar-solicitantes.jsp\">Solicitantes</a></li>\n");
      out.write("                      <li><a class=\"dropdown-item\" href=\"cadastrar-empresas.html\">Empresas</a>\n");
      out.write("                      <li><a class=\"dropdown-item\" href=\"cadastrar-departamentos.html\">Departamentos</a>\n");
      out.write("                      <li><a class=\"dropdown-item\" href=\"cadastrar-locais.html\">Locais</a>\n");
      out.write("                    </ul>\n");
      out.write("                  </li>\n");
      out.write("                  <li class=\"nav-item dropdown\">\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n");
      out.write("                      Consultas\n");
      out.write("                    </a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                      <li><a class=\"dropdown-item\" href=\"consultar/consulta_geral_solicitantes.jsp\">Solicitantes</a></li>\n");
      out.write("                      <li><a class=\"dropdown-item\" href=\"consultar/consulta_geral_empresas.jsp\">Empresas</a>\n");
      out.write("                      <li><a class=\"dropdown-item\" href=\"consultar/consulta_geral_depart.jsp\">Departamentos</a>\n");
      out.write("                      <li><a class=\"dropdown-item\" href=\"consultar/consulta_geral_locais.jsp\">Locais</a>\n");
      out.write("                    </ul>\n");
      out.write("                  </li>\n");
      out.write("                </ul>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"row g-3 border p-3 mx-auto\" style=\"max-width: 95%; margin: 50px auto\">\n");
      out.write("        <p class=\"h3\">Lista de Chamados</p>\n");
      out.write("        ");
 
         
        String cham = request.getParameter("id_chamado");
        Chamado chamado = new Chamado();
        chamado.setId_chamado(cham);
        
        ChamadoDAO chamadoDAO = new ChamadoDAO();
        
        if (chamadoDAO.consultarId(chamado) != null){
        
      out.write("\n");
      out.write("        <div class=\"card mb-3\">\n");
      out.write("            <div class=\"card-header\">\n");
      out.write("                Código: ");
      out.print( chamado.getId_chamado() );
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("                <h5 class=\"card-title\">Assunto: ");
      out.print( chamado.getAssunto() );
      out.write("</h5>\n");
      out.write("                <h6 class=\"card-text\">Descrição ");
      out.print( chamado.getDescricao() );
      out.write("</h6>\n");
      out.write("                <p class=\"card-text\">Solicitante: ");
      out.print( chamado.getSolicitante() );
      out.write("</p>\n");
      out.write("                <p class=\"card-text\">Empresa: ");
      out.print( chamado.getEmpresa() );
      out.write("</p>\n");
      out.write("                <p class=\"card-text\">Status: ");
      out.print( chamado.getStatus() );
      out.write("</p>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
          
        }else{
            out.println("<br> <b>Chamado não encontrado! <b>");
        }       
        
        
      out.write("\n");
      out.write("    </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
