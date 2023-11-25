/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Henrique
 */
public class Solicitante {
    private String id_solic;
    private String nome_solic;
    private String sobrenome_solic;
    private String email_solic;
    private Empresa empresa;
    private Departamento departamento;
    private Local local;

    public Solicitante() {
        this.empresa = new Empresa();
        this.departamento = new Departamento();
        this.local = new Local(); 
}

    public Solicitante(String id_solic, String nome_solic, String sobrenome_solic, String email_solic, Empresa empresa, Departamento departamento, Local local) {
        this.id_solic = id_solic;
        this.nome_solic = nome_solic;
        this.sobrenome_solic = sobrenome_solic;
        this.email_solic = email_solic;
        this.empresa = empresa;
        this.departamento = departamento;
        this.local = local;
    }

    public String getId_solic() {
        return id_solic;
    }

    public void setId_solic(String id_solic) {
        this.id_solic = id_solic;
    }

    public String getNome_solic() {
        return nome_solic;
    }

    public void setNome_solic(String nome_solic) {
        this.nome_solic = nome_solic;
    }

    public String getSobrenome_solic() {
        return sobrenome_solic;
    }

    public void setSobrenome_solic(String sobrenome_solic) {
        this.sobrenome_solic = sobrenome_solic;
    }

    public String getEmail_solic() {
        return email_solic;
    }

    public void setEmail_solic(String email_solic) {
        this.email_solic = email_solic;
    }

    public String getEmpresa() {
        return this.empresa.getNome_fantasia();
    }

    public void setEmpresa(String empresa) {
        this.empresa.setNome_fantasia(empresa);
    }

    public String getDepartamento() {
        return this.departamento.getNome_depart();
    }

    public void setDepartamento(String departamento) {
        this.departamento.setNome_depart(departamento);
    }

    public String getLocal() {
        return this.local.getNome_local();
    }

    public void setLocal(String local) {
        this.local.setNome_local(local);
    }
}