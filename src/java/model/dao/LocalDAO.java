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
import util.ConectaDB;
import model.Local;

/**
 *
 * @author Henrique
 */
public class LocalDAO {
    public boolean cadastrar(Local local) {
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                       
            String sql = "INSERT into local(nome_local, ativo) " + 
                    "values('" + local.getNome_local() +"', 0)";
            
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
        
        List locais = new ArrayList();
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * from local";
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){  
                Local local = new Local();
                
                local.setId_local(rs.getString("id_local"));
                local.setNome_local(rs.getString("nome_local"));
                
                locais.add(local);
                        
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return locais;
            }
            
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    
    public Local consultarId(Local local) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "select * from local s where s.id_local ='" + local.getId_local() +"'";
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){
                local.setId_local(rs.getString("id_local"));
                local.setNome_local(rs.getString("nome_local"));
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return local;
            }
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    
    public boolean update(Local local) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        
            String sql = "UPDATE local SET nome_local = '"+ local.getNome_local() +"' WHERE id_local = " + local.getId_local();
            
            stmt.executeUpdate(sql);
            
            //System.out.println(" Registro Alterardo com sucesso! ");            
            conexao.close();
            return true;
                   
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }
    
    public boolean inativar(Local local) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        
            String sql = "UPDATE local SET ativo = 1  WHERE id_local = " + local.getId_local();
            
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

