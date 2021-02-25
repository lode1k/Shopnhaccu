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
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;



/**
 *
 * @author PC
 */
@Table(name = "tbladmin")
@Entity

public class Admin {
    
    @Id
    @Column(name = "id")
    private int id;    
    @Column(name = "hovaten")
    private String hovaten;
    @Column(name = "username")
    @NotEmpty(message = "Tên đăng nhập ko để trống")
    private String username;
    @Column(name = "password")
    @NotEmpty(message = "Mật khẩu phải có")
    @Size(min = 4,message = "Mật khẩu phải có tối thiêu {2} ký tự")
    private String password;

    public Admin() {
    }

    public Admin(String hovaten, String username, String password) {
        this.hovaten = hovaten;
        this.username = username;
        this.password = password;
    }

    public Admin(int id, String hovaten, String username, String password) {
        this.id = id;
        this.hovaten = hovaten;
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHovaten() {
        return hovaten;
    }

    public void setHovaten(String hovaten) {
        this.hovaten = hovaten;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
