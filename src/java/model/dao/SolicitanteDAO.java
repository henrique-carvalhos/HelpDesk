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
import model.Solicitante;
import util.ConectaDB;

/**
 *
 * @author Henrique
 */
public class SolicitanteDAO {
    public boolean cadastrar(Solicitante solicitante) {
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                       
            String sql = "INSERT INTO Solicitante (nome_solic, sobrenome_solic, email_solic, nome_empresa, nome_depart, nome_local, ativo) " + 
                    "values('" + solicitante.getNome_solic() + "','" + solicitante.getSobrenome_solic() + "','" + solicitante.getEmail_solic() +
                    "', '" + solicitante.getEmpresa() +"','" + solicitante.getDepartamento() + "','" + solicitante.getLocal() + "', 0)";
            
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
        
        List solicitantes = new ArrayList();
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * from solicitante";
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){  
                Solicitante solicitante = new Solicitante();
                
                solicitante.setId_solic(rs.getString("id_solic"));
                solicitante.setNome_solic(rs.getString("nome_solic"));
                solicitante.setSobrenome_solic(rs.getString("sobrenome_solic"));
                solicitante.setEmail_solic(rs.getString("email_solic"));
                solicitante.setEmpresa(rs.getString("nome_empresa"));
                solicitante.setDepartamento(rs.getString("nome_depart"));
                solicitante.setLocal(rs.getString("nome_local"));
                 
                
                solicitantes.add(solicitante);
                        
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return solicitantes;
            }
            
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    
    public Solicitante consultarId(Solicitante solicitante) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "select * from solicitante s where s.id_solic ='" + solicitante.getId_solic() +"'";
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){
                solicitante.setId_solic(rs.getString("id_solic"));
                solicitante.setNome_solic(rs.getString("nome_solic"));
                solicitante.setSobrenome_solic(rs.getString("sobrenome_solic"));
                solicitante.setEmail_solic(rs.getString("email_solic"));
                solicitante.setEmpresa(rs.getString("nome_empresa"));
                solicitante.setDepartamento(rs.getString("nome_depart"));
                solicitante.setLocal(rs.getString("nome_local"));
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return solicitante;
            }
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    
    public boolean update(Solicitante solicitante) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        
            String sql = "UPDATE solicitante SET nome_solic = '"+ solicitante.getNome_solic() +"', sobrenome_solic='" + solicitante.getSobrenome_solic() +
                                "',email_solic='" + solicitante.getEmail_solic() + "',nome_empresa='" + solicitante.getEmpresa() + "',nome_depart='" + solicitante.getDepartamento() + "',nome_local='" + solicitante.getLocal() +
                                "' WHERE id_solic = " + solicitante.getId_solic();
            
            stmt.executeUpdate(sql);
            
            //System.out.println(" Registro Alterardo com sucesso! ");            
            conexao.close();
            return true;
                   
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }
    
    public boolean inativar(Solicitante solicitante) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        
            String sql = "UPDATE solicitante SET ativo =1 WHERE id_solic = " + solicitante.getId_solic();
            
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
