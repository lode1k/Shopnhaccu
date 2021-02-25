/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ICatelogDAO;
import dao.INewsDAO;
import dao.IProductDAO;
import dao.ImplCatelog;
import dao.ImplNews;
import dao.ImplProduct;
import entity.Catelog;
import entity.News;
import entity.Product;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
public class NewsPage {

    @RequestMapping("/baiviet")
    public String baiviet(Model m) {
        ICatelogDAO edao = new ImplCatelog();
        List<Catelog> listc = edao.getAll();

        IProductDAO dao = new ImplProduct();

        List<Product> home = dao.getAllWithHome();
        INewsDAO n = new ImplNews();
        List<News> listn = n.getAll();
        m.addAttribute("listn", listn);
        m.addAttribute("listc", listc);
        m.addAttribute("home", home);

        return "baiviet"; // Tải dữ liệu lên trang index.jsp
    }

    @RequestMapping("/quanlybaiviet")
    public String index(Model m, Integer page) {
        // Load dữ liệu nhân v  iên từ database
        INewsDAO eDao = new ImplNews();
        List<News> list = eDao.getAll();
        

        
        m.addAttribute("list", list);

        return "admin/news-page"; // Tải dữ liệu lên trang index.jsp
    }
    
    @RequestMapping("/init-news-insert")
    public String initinsert(Model m) {
        News n = new News();
       
        m.addAttribute("n", n);
       
        return "admin/news_insert";
    }

    @RequestMapping("/news-insert")
    public String insertWithImage(@ModelAttribute("n") News n, HttpServletRequest request, Model m) {
        try {
            ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
            List<FileItem> lstItem = sfu.parseRequest(request);
            for (FileItem item : lstItem) {
                if (item.isFormField()) {
                    try {
                        String data = item.getString("UTF-8");
                        switch (item.getFieldName()) {
                            case "tieude":
                                n.setTieude(data);
                                break;
                            case "tintuc":
                                n.setTintuc(data);
                                break;
                            
                        }
                    } catch (UnsupportedEncodingException ex) {
                        Logger.getLogger(NewsPage.class.getName()).log(Level.SEVERE, null, ex);
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
                        n.setImage(filename); // Tên file ảnh
                    } catch (Exception ex) {
                        Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }

            m.addAttribute("n", n);

            // TODO: Thêm dữ liệu
            INewsDAO eDao = new ImplNews();
            boolean success = eDao.insert(n);
            if (success) {
                return "redirect:quanlybaiviet.htm"; // Điều hướng về trang chính
            } else {
                m.addAttribute("msg", "Lỗi thêm dữ liệu");
                return "admin/news_insert";
            }
        } catch (FileUploadException ex) {
            Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
            m.addAttribute("msg", "Lỗi thêm dữ liệu ảnh");
            return "admin/news_insert";
        }
    }
    
    @RequestMapping("/init-news-update")
    public String initupdate(@RequestParam("id") Integer id, Model m) {
        INewsDAO eDao = new ImplNews();
        News n = eDao.getById(id);
        
        m.addAttribute("n", n);
      
        return "admin/news_update";
    }
    
    @RequestMapping("/news-update")
    public String updatetWithImage(@ModelAttribute("n") News n, HttpServletRequest request, Model m) {
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
                                n.setId(Integer.parseInt(data));
                                break;
                            case "tieude":
                                n.setTieude(data);
                                break;
                            case "tintuc":
                                n.setTintuc(data);
                                break;
                           
                            case "imagelinkold":
                                n.setImage(data);
                               
                                break;
                        }
                    } catch (UnsupportedEncodingException ex) {
                        Logger.getLogger(NewsPage.class.getName()).log(Level.SEVERE, null, ex);
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
                            n.setImage(filename);
                        } catch (Exception ex) {
                            Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
                        }

                    }                 
                }
            }

            m.addAttribute("n", n);

            INewsDAO eDao = new ImplNews();

            boolean success = eDao.update(n);
            //boolean success = false;
            if (success) {
                return "redirect:quanlybaiviet.htm";
            } else {
                m.addAttribute("msg", "Lỗi thêm dữ liệu");
                return "admin/news_update";
            }
        } catch (FileUploadException ex) {
            Logger.getLogger(ProductPage.class.getName()).log(Level.SEVERE, null, ex);
            m.addAttribute("msg", "Lỗi thêm dữ liệu ảnh");
            return "admin/news_update";
        }
    }
    
    @RequestMapping("/news-delete")
    public String delete(@RequestParam("id") Integer id, Model m) {
        INewsDAO eDao = new ImplNews();
        boolean success = eDao.delete(id);
        return "redirect:quanlybaiviet.htm"; // Điều hướng về trang chính
    }
}
