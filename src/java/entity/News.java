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
import javax.persistence.Table;

/**
 *
 * @author PC
 */
@Table(name = "tblnews")
@Entity
public class News {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "image")
    private String image;

    @Column(name = "tieude")
    private String tieude;
    
    @Column(name = "tintuc")
    private String tintuc;

    public News() {
    }

    public News(int id, String image, String tieude, String tintuc) {
        this.id = id;
        this.image = image;
        this.tieude = tieude;
        this.tintuc = tintuc;
    }

    public News(String image, String tieude, String tintuc) {
        this.image = image;
        this.tieude = tieude;
        this.tintuc = tintuc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTieude() {
        return tieude;
    }

    public void setTieude(String tieude) {
        this.tieude = tieude;
    }

    public String getTintuc() {
        return tintuc;
    }

    public void setTintuc(String tintuc) {
        this.tintuc = tintuc;
    }

    
}
