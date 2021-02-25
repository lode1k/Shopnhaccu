/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.IAdminDAO;
import dao.IBillDAO;
import dao.ICatelogDAO;

import dao.IProductDAO;
import dao.ImplAdmin;
import dao.ImplBill;
import dao.ImplBillDetail;
import dao.ImplCatelog;

import dao.ImplProduct;
import entity.Admin;
import entity.Bill;
import entity.BillDetail;
import entity.Cart;
import entity.Catelog;

//import entity.Cart;
import entity.Product;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.smartcardio.Card;
import javax.validation.Valid;
import org.apache.jasper.tagplugins.jstl.ForEach;
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
public class Frontend {

    @RequestMapping("/index")
    public String index(Model m, Integer page) {

        ICatelogDAO edao = new ImplCatelog();
        List<Catelog> listc = edao.getAll();

        IProductDAO dao = new ImplProduct();
        int itemsInPage = 16;
        int total = dao.getCount();
        int pages = (int) Math.ceil((float) total / (float) itemsInPage);
        List<Integer> lstPages = new ArrayList<Integer>();
        for (int i = 0; i < pages; i++) {
            lstPages.add(i);
        }

        if (page == null) {
            page = new Integer(0);
        }

        List<Product> list = dao.getAllPaging(page * itemsInPage, itemsInPage);

        List<Product> home = dao.getAllWithHome();
        m.addAttribute("lstPages", lstPages);
        m.addAttribute("list", list);
        m.addAttribute("listc", listc);
        m.addAttribute("home", home);
        return "index";
    }

    @RequestMapping("/add-cart")
    public String add2cart(@RequestParam Integer idp, HttpServletRequest request, Model m) {
        //Add giỏ hàng vào session
        HashMap<Integer, Integer> lstCart = (HashMap<Integer, Integer>) request.getSession().getAttribute("cart");
        if (lstCart == null) {
            lstCart = new HashMap<>();
        }
        if (lstCart.get(idp) == null) {
            lstCart.put(idp, 1);
        } else {
            int soluong = lstCart.get(idp);
            lstCart.put(idp, soluong + 1);
        }
        request.getSession().setAttribute("cart", lstCart);

        return "redirect:index.htm";
    }

    @RequestMapping("/view-cart")
    public String viewCart(Model m, HttpServletRequest request) {
        HashMap<Integer, Integer> lstCart = (HashMap<Integer, Integer>) request.getSession().getAttribute("cart");
//        List<Cart> list = new ArrayList<>();
        List<Product> list = new ArrayList<>();
        ICatelogDAO edao = new ImplCatelog();
        List<Catelog> listc = edao.getAll();

        IProductDAO dao = new ImplProduct();
        List<Product> home = dao.getAllWithHome();
        int tongtien = 0;
        for (Map.Entry<Integer, Integer> set : lstCart.entrySet()) {
//            Integer key = set.getKey();
//            Integer value = set.getValue();
            Product p = new Product();
            p = dao.getById(set.getKey());
            p.setSoluong(set.getValue());
            tongtien += p.getSoluong() * p.getGiatien();
            list.add(p);
        }

        m.addAttribute("tongtien", tongtien);
        m.addAttribute("lstCart", lstCart);
        m.addAttribute("list", list);
        m.addAttribute("listc", listc);
        m.addAttribute("home", home);
        return "view-cart";
    }

    @RequestMapping("/card-delete")
    public String delete(@RequestParam Integer idp, HttpServletRequest request, Model m) {
        HashMap<Integer, Integer> lstCart = (HashMap<Integer, Integer>) request.getSession().getAttribute("cart");
        lstCart.remove(idp);
        return "redirect:view-cart.htm";

    }

    @RequestMapping("/category-detail")
    public String detail(@RequestParam("id") Integer id, Model m, Integer page) {
        ICatelogDAO eDao = new ImplCatelog();
        Catelog c = eDao.getById(id);

        IProductDAO dao = new ImplProduct();
        // int itemsInPage = 2;
        //int total = dao.getCountById(id);
        //int pages = (int) Math.ceil((float) total / (float) itemsInPage);
        // List<Integer> lstPages = new ArrayList<Integer>();
        // for (int i = 0; i < pages; i++) {
        //    lstPages.add(i);
        //}
        //if (page == null) {
        //    page = new Integer(0);
        // }            
        m.addAttribute("c", c);

        List<Catelog> listc = eDao.getAll();

        //List<Product> list = dao.getAllPaging(page * itemsInPage, itemsInPage);
        List<Product> list = dao.getProductbyIdloai(id);
        List<Product> home = dao.getAllWithHome();
        //m.addAttribute("lstPages", lstPages);
        m.addAttribute("list", list);
        m.addAttribute("listc", listc);
        m.addAttribute("home", home);
        return "category_detail";
    }

    @RequestMapping("/chitietsanpham")
    public String detail(@RequestParam("id") Integer id, Model m) {
        IProductDAO eDao = new ImplProduct();
        Product p = eDao.getById(id);
        ICatelogDAO edao = new ImplCatelog();
        List<Catelog> listc = edao.getAll();
        List<Product> home = eDao.getAllWithHome();
        List<Product> list = eDao.getAll();
        m.addAttribute("p", p);
        m.addAttribute("listc", listc);
        m.addAttribute("home", home);
        m.addAttribute("list", list);
        return "chitietsanpham";
    }

    @RequestMapping("/thanhtoan")
    public String thanhtoan(Model m, HttpServletRequest request, @Valid @ModelAttribute("b") Bill b, BindingResult result) {
        HashMap<Integer, Integer> lstCart = (HashMap<Integer, Integer>) request.getSession().getAttribute("cart");
        m.addAttribute("b", b);
        ICatelogDAO edao = new ImplCatelog();
        List<Catelog> listc = edao.getAll();
        List<Product> list = new ArrayList<>();

        IProductDAO dao = new ImplProduct();
        List<Product> home = dao.getAllWithHome();
        int tongtien = 0;
        ImplBillDetail bill = new ImplBillDetail();
        for (Map.Entry<Integer, Integer> set : lstCart.entrySet()) {
//            Integer key = set.getKey();
//            Integer value = set.getValue();
            Product p = new Product();
            p = dao.getById(set.getKey());
            p.setSoluong(set.getValue());
            tongtien += p.getSoluong() * p.getGiatien();
            list.add(p);

        }

        m.addAttribute("tongtien", tongtien);
        IBillDAO bil = new ImplBill();
        boolean success = bil.insert(b);
        
        
        for (Map.Entry<Integer, Integer> set : lstCart.entrySet()) {
//            Integer key = set.getKey();
//            Integer value = set.getValue();
            Product p = new Product();
            p = dao.getById(set.getKey());
            p.setSoluong(set.getValue());
            bill.insert(new BillDetail(b.getId(), p.getId(),p.getSoluong(), p.getGiatien()));
        }
        if (success) {
                return "redirect:thongbao.htm"; // Điều hướng về trang chính
            }
        
        
        m.addAttribute("listc", listc);
        m.addAttribute("home", home);

        return "thanhtoan"; // Tải dữ liệu lên trang index.jsp
    }

    @RequestMapping("/thongbao")
    public String thongbao(Model m) {
        ICatelogDAO edao = new ImplCatelog();
        List<Catelog> listc = edao.getAll();

        IProductDAO dao = new ImplProduct();

        List<Product> home = dao.getAllWithHome();

        m.addAttribute("listc", listc);
        m.addAttribute("home", home);

        return "thongbao"; // Tải dữ liệu lên trang index.jsp
    }
    
    @RequestMapping("/gioithieu")
    public String gioithieu(Model m) {
        ICatelogDAO edao = new ImplCatelog();
        List<Catelog> listc = edao.getAll();

        IProductDAO dao = new ImplProduct();

        List<Product> home = dao.getAllWithHome();

        m.addAttribute("listc", listc);
        m.addAttribute("home", home);

        return "gioithieu"; // Tải dữ liệu lên trang index.jsp
    }
    
    @RequestMapping("/lienhe")
    public String lienhe(Model m) {
        ICatelogDAO edao = new ImplCatelog();
        List<Catelog> listc = edao.getAll();

        IProductDAO dao = new ImplProduct();

        List<Product> home = dao.getAllWithHome();

        m.addAttribute("listc", listc);
        m.addAttribute("home", home);

        return "lienhe"; // Tải dữ liệu lên trang index.jsp
    }
    
        

}
