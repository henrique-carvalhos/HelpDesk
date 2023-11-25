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
import model.Departamento;

/**
 *
 * @author Henrique
 */
public class DepartamentoDAO {
    public boolean cadastrar(Departamento departamento) {
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                       
            String sql = "INSERT into departamento(nome_depart, ativo) " + 
                    "values('" + departamento.getNome_depart() + "', 0)";
            
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
        
        List departamentos = new ArrayList();
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * from departamento";
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){  
                Departamento departamento = new Departamento();
                
                departamento.setId_depart(rs.getString("id_depart"));
                departamento.setNome_depart(rs.getString("nome_depart"));
                
                departamentos.add(departamento);
                        
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return departamentos;
            }
            
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    
    public Departamento consultarId(Departamento departamento) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "select * from departamento s where s.id_depart ='" + departamento.getId_depart() +"'";
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){
                departamento.setId_depart(rs.getString("id_depart"));
                departamento.setNome_depart(rs.getString("nome_depart"));
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return departamento;
            }
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    
    public boolean update(Departamento departamento) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        
            String sql = "UPDATE departamento SET nome_depart = '"+ departamento.getNome_depart() +"' WHERE id_depart = " + departamento.getId_depart();
            
            stmt.executeUpdate(sql);
            
            //System.out.println(" Registro Alterardo com sucesso! ");            
            conexao.close();
            return true;
                   
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }
    
    public boolean inativar(Departamento departamento) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        
            String sql = "UPDATE departamento SET ativo = 1 WHERE id_depart = " + departamento.getId_depart();
            
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
