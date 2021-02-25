/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author PC
 */
@Table(name = "tblhoadon")
@Entity
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    
    
    
    @Column(name = "ngaytao")
    private Timestamp ngaytao;
    
    @Column(name = "tongtien")
    private float tongtien;
    
    @Column(name = "nguoinhan")
    private String nguoinhan;
    
    @Column(name = "diachinhan")
    private String diachinhan;
    
    @Column(name = "sdt")
    private String sdt;
    
    @Column(name = "email")
    private String email;

    public Bill( Timestamp ngaytao, float tongtien, String nguoinhan, String diachinhan, String sdt, String email) {
        
        this.ngaytao = ngaytao;
        this.tongtien = tongtien;
        this.nguoinhan = nguoinhan;
        this.diachinhan = diachinhan;
        this.sdt = sdt;
        this.email = email;
    }

    public Bill(int id,  Timestamp ngaytao, float tongtien, String nguoinhan, String diachinhan, String sdt, String email) {
        this.id = id;
        
        this.ngaytao = ngaytao;
        this.tongtien = tongtien;
        this.nguoinhan = nguoinhan;
        this.diachinhan = diachinhan;
        this.sdt = sdt;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

   

    public Timestamp getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(Timestamp ngaytao) {
        this.ngaytao = ngaytao;
    }

    public float getTongtien() {
        return tongtien;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }

    public String getNguoinhan() {
        return nguoinhan;
    }

    public void setNguoinhan(String nguoinhan) {
        this.nguoinhan = nguoinhan;
    }

    public String getDiachinhan() {
        return diachinhan;
    }

    public void setDiachinhan(String diachinhan) {
        this.diachinhan = diachinhan;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    

    
    public Bill() {
    }

}
