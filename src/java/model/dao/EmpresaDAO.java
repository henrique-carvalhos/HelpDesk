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
import model.Empresa;
import util.ConectaDB;

/**
 *
 * @author Henrique
 */
public class EmpresaDAO{
    public boolean cadastrar(Empresa empresa) {
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                       
            String sql = "INSERT INTO Empresa (nome_fantasia, razao_social, cnpj, nome_contato, email, telefone, ativo) " + 
                    "values('" + empresa.getNome_fantasia() + "','" + empresa.getRazao_social() + "','" + empresa.getCnpj() +
                    "', '" + empresa.getNome_contato() +"','" + empresa.getEmail() + "','" + empresa.getTelefone() + "', 0)";
            
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
        
        List empresas = new ArrayList();
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * from empresa";
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){  
                Empresa empresa = new Empresa();
                
                empresa.setId_empresa(rs.getString("id_empresa"));
                empresa.setNome_fantasia(rs.getString("nome_fantasia"));
                empresa.setRazao_social(rs.getString("razao_social"));
                empresa.setCnpj(rs.getString("cnpj"));
                empresa.setNome_contato(rs.getString("nome_contato"));
                empresa.setEmail(rs.getString("email"));
                empresa.setTelefone(rs.getString("telefone")); 
                
                empresas.add(empresa);
                        
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return empresas;
            }
            
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    public Empresa consultarId(Empresa empresa) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "select * from empresa s where s.id_empresa ='" + empresa.getId_empresa() +"'";
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while (rs.next()){
                empresa.setId_empresa(rs.getString("id_empresa"));
                empresa.setNome_fantasia(rs.getString("nome_fantasia"));
                empresa.setRazao_social(rs.getString("razao_social"));
                empresa.setCnpj(rs.getString("cnpj"));
                empresa.setNome_contato(rs.getString("nome_contato"));
                empresa.setEmail(rs.getString("email"));
                empresa.setTelefone(rs.getString("telefone"));
                n_reg++;
            }
            conexao.close();
                   
            if (n_reg == 0){
                return null;
            }else{
                return empresa;
            }
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
    
    public boolean update(Empresa empresa) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            
            String sql = "UPDATE empresa SET nome_fantasia = '" + empresa.getNome_fantasia() + "', razao_social = '" + empresa.getRazao_social() + "', cnpj = '" + empresa.getCnpj() + "',"
                    + " nome_contato = '" + empresa.getNome_contato() + "', email = '" + empresa.getEmail() + "', telefone = '" + empresa.getTelefone() + 
                    "' WHERE id_empresa = " + empresa.getId_empresa();
            
            stmt.executeUpdate(sql);
            
            //System.out.println(" Registro Alterardo com sucesso! ");            
            conexao.close();
            return true;
                   
        } catch(ClassNotFoundException | SQLException ex){
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }
    
    public boolean inativar(Empresa empresa) {
        Connection conexao = null;
        
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            
            String sql = "UPDATE empresa SET ativo = 1 WHERE id_empresa = " + empresa.getId_empresa();
            
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