/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.IAdminDAO;
import dao.ICatelogDAO;
import dao.IProductDAO;
import dao.ImplAdmin;
import dao.ImplCatelog;
import dao.ImplProduct;
import entity.Admin;
import entity.Catelog;
import entity.Product;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.jboss.classfilewriter.annotations.IntAnnotationValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author PC
 */
@Controller
public class AdminPage {

    @RequestMapping("/quanlyadmin")
    public String index(Model m, Integer page) {
        // Load dữ liệu nhân v  iên từ database
        IAdminDAO eDao = new ImplAdmin();
        List<Admin> list = eDao.getAll();
        m.addAttribute("list", list);

        return "admin/admin-page"; // Tải dữ liệu lên trang index.jsp
    }

    @RequestMapping("/init-admin-insert")
    public String initinsert(Model m) {
        Admin a = new Admin();
        m.addAttribute("a", a);
        return "admin/admin_insert";
    }
//
    @RequestMapping("/admin-insert")
    public String insert(@Valid @ModelAttribute("a") Admin a, BindingResult result, Model m) {
        m.addAttribute("a", a);
        if (result.hasErrors()) {
            return "admin/admin_insert";
        } else {
            // TODO: Thêm dữ liệu
            IAdminDAO eDao = new ImplAdmin();
            boolean success = eDao.insert(a);
            if (success) {
                return "redirect:quanlyadmin.htm"; // Điều hướng về trang chính
            } else {
                m.addAttribute("msg", "Lỗi thêm dữ liệu");
                return "admin/admin_insert";
            }
        }
    }

    @RequestMapping("/init-admin-update")
    public String initupdate(@RequestParam("id") Integer id, Model m) {
        IAdminDAO eDao = new ImplAdmin();
        Admin a = eDao.getById(id);
        m.addAttribute("a", a);
        return "admin/admin_update";
    }

    @RequestMapping("/admin-update")
    public String udpate(@Valid @ModelAttribute("a") Admin a, BindingResult result, Model m) {
        m.addAttribute("a", a);
        if (result.hasErrors()) {
            return "admin/admin_update";
        } else {
            // TODO: Thêm dữ liệu
            IAdminDAO eDao = new ImplAdmin();
            boolean success = eDao.update(a);
            if (success) {
                return "redirect:quanlyadmin.htm"; // Điều hướng về trang chính
            } else {
                m.addAttribute("msg", "Lỗi thêm dữ liệu");
                return "admin/admin_update";
            }
        }
    }

    @RequestMapping("/admin-delete")
    public String delete(@RequestParam("id") Integer id, Model m) {
        IAdminDAO eDao = new ImplAdmin();
        boolean success = eDao.delete(id);
        return "redirect:quanlyadmin.htm"; // Điều hướng về trang chính
    }
    
    
}
