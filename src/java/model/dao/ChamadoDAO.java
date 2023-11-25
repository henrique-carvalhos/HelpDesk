/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Chamado;
import util.ConectaDB;

/**
 *
 * @author Henrique
 */
public class ChamadoDAO {
    public boolean cadastrar(Chamado chamado) {
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                       
            String sql = "INSERT INTO Chamado (assunto, descricao, data_abertura, status_chamado, nome_solicitante) " + 
                    "values('" + chamado.getAssunto() + "','" + chamado.getDescricao() + "', now(),'" + chamado.getStatus() + "','" + chamado.getSolicitante() + "')";
            
            stmt.executeUpdate(sql); // Insert    
            System.out.println(" Registro Inserido! ");            
            conexao.close();
            return true;
                   
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return false;
        }
    } 
    
    public List consultarGeral() {
        Connection conexao = null;
        
        List chamados = new ArrayList();
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT c.id_chamado, c.assunto, c.descricao, c.data_abertura, c.status_chamado, c.nome_solicitante, s.nome_empresa, s.nome_depart " +
                         "FROM chamado c " +
                         "INNER JOIN solicitante s ON c.nome_solicitante = CONCAT(s.nome_solic, ' ', s.sobrenome_solic)";
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){  
                Chamado chamado = new Chamado();
                
                chamado.setId_chamado(rs.getString("c.id_chamado"));
                chamado.setAssunto(rs.getString("c.assunto"));
                chamado.setDescricao(rs.getString("c.descricao"));
                chamado.setData_abertura(rs.getString("c.data_abertura"));
                chamado.setStatus(rs.getString("c.status_chamado"));
                chamado.setSolicitante(rs.getString("c.nome_solicitante"));
                chamado.setEmpresa(rs.getString("s.nome_empresa"));
                chamado.setDepartamento(rs.getString("s.nome_depart"));
                                            
                chamados.add(chamado);
                        
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return chamados;
            }
            
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    
    public List consultarStatus() {
        Connection conexao = null;
        
        List chamados = new ArrayList();
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql =    "SELECT qtd, status_chamado " +
                            "FROM ( " +
                            "    SELECT COUNT(status_chamado) qtd, status_chamado " +
                            "    FROM chamado " +
                            "    GROUP BY status_chamado " +
                            ") subquery " +
                            "UNION ALL " +
                            "SELECT SUM(qtd), 'Total' " +
                            "FROM ( " +
                            "    SELECT COUNT(status_chamado) qtd, status_chamado " +
                            "    FROM chamado " +
                            "    GROUP BY status_chamado " +
                            ") total " +
                            "ORDER BY status_chamado ";

            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){  
                Chamado chamado = new Chamado();
                
                chamado.setStatus(rs.getString("qtd"));
                                            
                chamados.add(chamado);
                        
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return chamados;
            }
            
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    
    public Chamado consultarId(Chamado chamado) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT c.id_chamado, c.assunto, c.descricao, c.data_abertura, c.status_chamado, c.nome_solicitante, s.nome_empresa, s.nome_depart " +
                         "FROM chamado c " +
                         "INNER JOIN solicitante s ON c.nome_solicitante = CONCAT(s.nome_solic, ' ', s.sobrenome_solic) where c.id_chamado = " + chamado.getId_chamado();
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){
                chamado.setId_chamado(rs.getString("c.id_chamado"));
                chamado.setAssunto(rs.getString("c.assunto"));
                chamado.setDescricao(rs.getString("c.descricao"));
                chamado.setData_abertura(rs.getString("c.data_abertura"));
                chamado.setStatus(rs.getString("c.status_chamado"));
                chamado.setSolicitante(rs.getString("c.nome_solicitante"));
                chamado.setEmpresa(rs.getString("s.nome_empresa"));
                chamado.setDepartamento(rs.getString("s.nome_depart"));
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return chamado;
            }
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    
    public boolean update(Chamado chamado) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        
            String sql = "UPDATE chamado SET status_chamado = '"+ chamado.getStatus() +"' WHERE id_chamado = " + chamado.getId_chamado();
            
            stmt.executeUpdate(sql);
            
            //System.out.println(" Registro Alterardo com sucesso! ");            
            conexao.close();
            return true;
                   
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }
}
