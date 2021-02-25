/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author PC
 */
@Table(name = "tbldanhmuc")
@Entity
public class Catelog {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
        
    @Column(name = "tieude")
    @NotEmpty(message = "{catelog.tieude}")
    @Size(max = 50, min = 5, message = "{catelog.tieude.length}")
    private String tieude;
    
    @Column(name = "mota")
    private String mota;
    
    @Column(name = "trangthai")
    private byte trangthai;
    
     
    public Catelog() {
    }

    public Catelog(String tieude, String mota, byte trangthai) {
        this.tieude = tieude;
        this.mota = mota;
        this.trangthai = trangthai;
    }

    

    public Catelog(int id, String tieude, String mota, byte trangthai) {
        this.id = id;
        this.tieude = tieude;
        this.mota = mota;
        this.trangthai = trangthai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTieude() {
        return tieude;
    }

    public void setTieude(String tieude) {
        this.tieude = tieude;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public byte getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(byte trangthai) {
        this.trangthai = trangthai;
    }
    
}
