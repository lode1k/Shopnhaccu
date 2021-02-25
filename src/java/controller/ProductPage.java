/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ICatelogDAO;
import dao.IProductDAO;
import dao.ImplCatelog;
import dao.ImplProduct;
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
public class ProductPage {

    @RequestMapping("/quanlysanpham")
    public String index(Model m, Integer page) {
        // Load dữ liệu nhân v  iên từ database
        IProductDAO eDao = new ImplProduct();

        // Tính toán phân trang
        int itemsInPage = 4;
        int total = eDao.getCount();
        int pages = (int) Math.ceil((float) total / (float) itemsInPage);
        List<Integer> lstPages = new ArrayList<Integer>();
        for (int i = 0; i < pages; i++) {
            lstPages.add(i);
        }

        if (page == null) {
            page = new Integer(0);
        }

        List<Product> list = eDao.getAllPaging(page * itemsInPage, itemsInPage);

        m.addAttribute("lstPages", lstPages);
        m.addAttribute("list", list);

        return "admin/product-page"; // Tải dữ liệu lên trang index.jsp
    }

    @RequestMapping("/init-product-insert")
    public String initinsert(Model m) {
        Product p = new Product();
        ICatelogDAO dao = new ImplCatelog();
        List<Catelog> list = dao.getAll();
        m.addAttribute("p", p);
        m.addAttribute("list", list);
        return "admin/product_insert";
    }

    @RequestMapping("/product-insert")
    public String insertWithImage(@ModelAttribute("p") Product p, HttpServletRequest request, Model m) {
        try {
            ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
            List<FileItem> lstItem = sfu.parseRequest(request);
            for (FileItem item : lstItem) {
                if (item.isFormField()) {
                    try {
                        String data = item.getString("UTF-8");
                        switch (item.getFieldName()) {
                            case "ten":
                                p.setTen(data);
                                break;
                            case "mota":
                                p.setMota(data);
                                break;
                            case "idloai":
                                p.setIdloai(Integer.parseInt(data));
                                break;
                            case "nhacc":
                                p.setNhacc(data);
                                break;
                            case "home":
                                p.setHome(Byte.parseByte(data));
                                break;
                            case "soluong":
                                p.setSoluong(Integer.parseInt(data));
                                break;

                            case "giatien":
                                p.setGiatien(Float.parseFloat(data));
                                break;
                        }
                    } catch (UnsupportedEncodingException ex) {
                        Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    String filepath = request.getServletContext().getRealPath("public/images");
                    String filename = item.getName();
                    File destination = new File(filepath, filename);
                    try {
                        if (destination.exists()) {
                            destination.delete();
                        }
                        item.write(destination);
                        p.setImage(filename); // Tên file ảnh
                    } catch (Exception ex) {
                        Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }

            m.addAttribute("p", p);

            // TODO: Thêm dữ liệu
            IProductDAO eDao = new ImplProduct();
            boolean success = eDao.insert(p);
            if (success) {
                return "redirect:quanlysanpham.htm"; // Điều hướng về trang chính
            } else {
                m.addAttribute("msg", "Lỗi thêm dữ liệu");
                return "admin/product_insert";
            }
        } catch (FileUploadException ex) {
            Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
            m.addAttribute("msg", "Lỗi thêm dữ liệu ảnh");
            return "admin/product_insert";
        }
    }

    @RequestMapping("/product-detail")
    public String detail(@RequestParam("id") Integer id, Model m) {
        IProductDAO eDao = new ImplProduct();
        Product p = eDao.getById(id);
        m.addAttribute("p", p);
        return "admin/product_detail";
    }

    @RequestMapping("/init-product-update")
    public String initupdate(@RequestParam("id") Integer id, Model m) {
        IProductDAO eDao = new ImplProduct();
        Product p = eDao.getById(id);
        ICatelogDAO dao = new ImplCatelog();
        List<Catelog> list = dao.getAll();
        m.addAttribute("p", p);
        m.addAttribute("list", list);
        return "admin/product_update";
    }

    @RequestMapping("/product-update")
    public String updatetWithImage(@ModelAttribute("p") Product p, HttpServletRequest request, Model m) {
        try {
            ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
            List<FileItem> lstItem = sfu.parseRequest(request);
            String imagelinkold = "";
            for (FileItem item : lstItem) {
                if (item.isFormField()) {
                    try {
                        String data = item.getString("UTF-8");
                        switch (item.getFieldName()) {
                            case "id":
                                p.setId(Integer.parseInt(data));
                                break;
                            case "ten":
                                p.setTen(data);
                                break;
                            case "mota":
                                p.setMota(data);
                                break;
                            case "idloai":
                                p.setIdloai(Integer.parseInt(data));
                                break;
                            case "nhacc":
                                p.setNhacc(data);
                                break;
                            case "soluong":
                                p.setSoluong(Integer.parseInt(data));
                                break;
                            case "giatien":
                                p.setGiatien(Float.parseFloat(data));
                                break;
                            case "home":
                                p.setHome(Byte.parseByte(data));
                                break;
                            case "imagelinkold":
                                p.setImage(data);
                                //imagelinkold=data;
                                break;
                        }
                    } catch (UnsupportedEncodingException ex) {
                        Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    String filepath = request.getServletContext().getRealPath("public/images");
                    String filename = item.getName();
                    if (filename == null || filename.isEmpty()) {
                        //System.out.println("linh ảnh cũ" + imagelinkold);
                    } else if (filename != null || !filename.isEmpty()) {
                        File destination = new File(filepath, filename);
                        try {
                            if (destination.exists()) {
                                destination.delete();
                            }
                            item.write(destination);
                            p.setImage(filename);
                        } catch (Exception ex) {
                            Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
                        }

                    }
//                    File destination = new File(filepath, filename);
//                    try {
//                        if (destination.exists()) {
//                            //destination.delete();
//                        }
//                        item.write(destination);
//                        e.setImagelink(filename); 
//                    } catch (Exception ex) {
//                        Logger.getLogger(sanpham.class.getName()).log(Level.SEVERE, null, ex);
//                    }
                }
            }

            m.addAttribute("p", p);

            IProductDAO eDao = new ImplProduct();

            boolean success = eDao.update(p);
            //boolean success = false;
            if (success) {
                return "redirect:quanlysanpham.htm";
            } else {
                m.addAttribute("msg", "Lỗi thêm dữ liệu");
                return "admin/product_update";
            }
        } catch (FileUploadException ex) {
            Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
            m.addAttribute("msg", "Lỗi thêm dữ liệu ảnh");
            return "admin/product_update";
        }
    }

    @RequestMapping("/product-delete")
    public String delete(@RequestParam("id") Integer id, Model m) {
        IProductDAO eDao = new ImplProduct();
        boolean success = eDao.delete(id);
        return "redirect:quanlysanpham.htm"; // Điều hướng về trang chính
    }

}
