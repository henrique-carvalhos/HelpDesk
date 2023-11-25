/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Henrique
 */
public class Departamento {
    private String id_depart;
    private String nome_depart;

    public Departamento() {
    }

    public Departamento(String id_depart, String nome_depart) {
        this.nome_depart = nome_depart;
    }

    public String getId_depart() {
        return id_depart;
    }

    public void setId_depart(String id_depart) {
        this.id_depart = id_depart;
    }

    public String getNome_depart() {
        return nome_depart;
    }

    public void setNome_depart(String nome_depart) {
        this.nome_depart = nome_depart;
    }
}
