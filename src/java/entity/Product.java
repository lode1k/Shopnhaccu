/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author PC
 */
@Table(name = "tblsanpham")
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    @Column(name = "ten")
    private String ten;
    @Column(name = "mota")
    private String mota;
    @Column(name = "idloai")
    private int idloai;
    @Column(name = "nhacc")
    private String nhacc;
    @Column(name = "soluong")
    private int soluong;
    @Column(name = "giatien")
    private float giatien;
    @Column(name = "image")
    private String image;
    @ManyToOne
    @JoinColumn (name = "idloai",insertable =false,updatable = false)
    private Catelog catelog;
    private byte home;

    public Catelog getCatelog() {
        return catelog;
    }

    public void setCatelog(Catelog catelog) {
        this.catelog = catelog;
    }

    public Product() {
    }

    public Product(String ten, String mota, int idloai, String nhacc, int soluong, float giatien, String image, Catelog catelog, byte home) {
        this.ten = ten;
        this.mota = mota;
        this.idloai = idloai;
        this.nhacc = nhacc;
        this.soluong = soluong;
        this.giatien = giatien;
        this.image = image;
        this.catelog = catelog;
        this.home = home;
    }

    public Product(int id, String ten, String mota, int idloai, String nhacc, int soluong, float giatien, String image, Catelog catelog, byte home) {
        this.id = id;
        this.ten = ten;
        this.mota = mota;
        this.idloai = idloai;
        this.nhacc = nhacc;
        this.soluong = soluong;
        this.giatien = giatien;
        this.image = image;
        this.catelog = catelog;
        this.home = home;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public int getIdloai() {
        return idloai;
    }

    public void setIdloai(int idloai) {
        this.idloai = idloai;
    }

    public String getNhacc() {
        return nhacc;
    }

    public void setNhacc(String nhacc) {
        this.nhacc = nhacc;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public float getGiatien() {
        return giatien;
    }

    public void setGiatien(float giatien) {
        this.giatien = giatien;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public byte getHome() {
        return home;
    }

    public void setHome(byte home) {
        this.home = home;
    }

    
    

    
    
}
