/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author PC
 */
@Table(name = "tblhdchitiet")
@Entity
public class BillDetail {
    @Id
    @Column(name = "idhd")
    private int idhd;
    
    @Column(name = "idsp")
    private int idsp;
    
    @Column(name = "soluong")
    private int soluong;
    
    @Column(name = "dongia")
    private float dongia;

    public int getIdhd() {
        return idhd;
    }

    public void setIdhd(int idhd) {
        this.idhd = idhd;
    }

    public int getIdsp() {
        return idsp;
    }

    public void setIdsp(int idsp) {
        this.idsp = idsp;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public float getDongia() {
        return dongia;
    }

    public void setDongia(float dongia) {
        this.dongia = dongia;
    }

    public BillDetail(int idsp, int soluong, float dongia) {
        this.idsp = idsp;
        this.soluong = soluong;
        this.dongia = dongia;
    }

    public BillDetail(int idhd, int idsp, int soluong, float dongia) {
        this.idhd = idhd;
        this.idsp = idsp;
        this.soluong = soluong;
        this.dongia = dongia;
    }

    public BillDetail() {
    }
}
