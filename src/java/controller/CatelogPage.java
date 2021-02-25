/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ICatelogDAO;
import dao.ImplCatelog;
import entity.Catelog;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
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
public class CatelogPage {
    @RequestMapping("/danhmucsanpham")
    public String index(Model m,Integer page) {
        // Load dữ liệu nhân v  iên từ database
        ICatelogDAO eDao = new ImplCatelog();
        
                        
        // Tính toán phân trang
        int itemsInPage = 4;
        int total = eDao.getCount();
        int pages = (int) Math.ceil((float)total / (float) itemsInPage);
        List<Integer> lstPages = new ArrayList<Integer>();
        for (int i = 0; i < pages; i++) {
            lstPages.add(i);
        }
        
        if (page == null) {
            page = new Integer(0);
        }
        
        List<Catelog> list = eDao.getAllPaging(page * itemsInPage, itemsInPage);
        
        m.addAttribute("lstPages", lstPages);
        m.addAttribute("list", list);

        return "admin/catelog-page"; // Tải dữ liệu lên trang index.jsp
    }
    
    @RequestMapping("/init-catelog-insert")
    public String initinsert(Model m) {
        Catelog c = new Catelog();
        m.addAttribute("c", c);
        return "admin/catelog_insert";
    }

    @RequestMapping("/catelog-insert")
    public String insert(@Valid @ModelAttribute("c") Catelog c, BindingResult result, Model m) {
        m.addAttribute("c", c);
        if (result.hasErrors()) {
            return "admin/catelog_insert";
        } else {
            // TODO: Thêm dữ liệu
            ICatelogDAO eDao = new ImplCatelog();
            boolean success = eDao.insert(c);
            if (success) {
                return "redirect:danhmucsanpham.htm"; // Điều hướng về trang chính
            } else {
                m.addAttribute("msg", "Lỗi thêm dữ liệu");
                return "admin/catelog_insert";
            }
        }
    }
    
    @RequestMapping("/catelog-detail")
    public String detail(@RequestParam("id") Integer id, Model m) {
        ICatelogDAO eDao = new ImplCatelog();
        Catelog c = eDao.getById(id);
        m.addAttribute("c", c);
        return "admin/catelog_detail";
    }
    
    @RequestMapping("/init-catelog-update")
    public String initupdate(@RequestParam("id") Integer id, Model m) {
        ICatelogDAO eDao = new ImplCatelog();
        Catelog c = eDao.getById(id);
        m.addAttribute("c", c);
        return "admin/catelog_update";
    }

    @RequestMapping("/catelog-update")
    public String udpate(@Valid @ModelAttribute("c") Catelog c, BindingResult result, Model m) {
        m.addAttribute("c", c);
        if (result.hasErrors()) {
            return "admin/catelog_update";
        } else {
            // TODO: Thêm dữ liệu
            ICatelogDAO eDao = new ImplCatelog();
            boolean success = eDao.update(c);
            if (success) {
                return "redirect:danhmucsanpham.htm"; // Điều hướng về trang chính
            } else {
                m.addAttribute("msg", "Lỗi thêm dữ liệu");
                return "admin/catelog_update";
            }
        }
    }
    
    @RequestMapping("/catelog-delete")
    public String delete(@RequestParam("id") Integer id, Model m) {
        ICatelogDAO eDao = new ImplCatelog();
        boolean success = eDao.delete(id);
        return "redirect:danhmucsanpham.htm"; // Điều hướng về trang chính
    }
}
