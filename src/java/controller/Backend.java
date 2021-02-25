/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ImplAdmin;
import entity.Admin;
import javax.validation.Valid;
import javax.xml.ws.BindingType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import dao.IAdminDAO;

/**
 *
 * @author PC
 */
@Controller
public class Backend {
    
    @RequestMapping("/admin")
    public String index(Model m){
        Admin a = new Admin();
        m.addAttribute("admin", a);
        return "admin-login";
    }
    
     @RequestMapping("/admin-login")
     public String login(@Valid @ModelAttribute("admin") Admin a,BindingResult result,Model m){
         m.addAttribute("admin",a);
         if(result.hasErrors()){
             return "admin/admin-login";
         }else{
             //Thực hiện đăng nhập
             IAdminDAO dao = new ImplAdmin();
             boolean success = dao.getAdminByParam(a.getUsername(), a.getPassword());
             if(!success){
                 m.addAttribute("msg","Đăng nhập thất bại");
                 return "admin/admin-login";                
             }else{
                 return "admin/admin-home";
             }            
         }
     }
     
}
