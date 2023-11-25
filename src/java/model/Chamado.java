/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;
/**
 *
 * @author Henrique
 */
public class Chamado {
    private String id_chamado;
    private Solicitante solicitante;
    private String assunto;
    private String descricao;
    private String data_abertura;
    private Empresa empresa;
    private Departamento departamento;
    private String status;
    
    public Chamado() {
        this.empresa = new Empresa();
        this.departamento = new Departamento();
        this.solicitante = new Solicitante();
    }

    public Chamado(Solicitante solicitante, String assunto, String descricao, String data_abertura, Empresa empresa, Departamento departamento, String status) {
        this.solicitante = solicitante;
        this.assunto = assunto;
        this.descricao = descricao;
        this.data_abertura = data_abertura;
        this.empresa = empresa;
        this.departamento = departamento;
        this.status = status;
    }

    public String getId_chamado() {
        return id_chamado;
    }

    public void setId_chamado(String id_chamado) {
        this.id_chamado = id_chamado;
    }
    
    public String getSolicitante() {
        return solicitante.getNome_solic();
    }

    public void setSolicitante(String solicitante) {
        this.solicitante.setNome_solic(solicitante);
    }

    public String getAssunto() {
        return assunto;
    }

    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getData_abertura() {
        return data_abertura;
    }

    public void setData_abertura(String data_abertura) {
        this.data_abertura = data_abertura;
    }

    public String getEmpresa() {
        return empresa.getNome_fantasia();
    }

    public void setEmpresa(String empresa) {
        this.empresa.setNome_fantasia(empresa);
    }

    public String getDepartamento() {
        return departamento.getNome_depart();
    }

    public void setDepartamento(String departamento) {
        this.departamento.setNome_depart(departamento);
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

