/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.IAdminDAO;
import dao.IBillDAO;
import dao.IBillDetailDAO;
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
public class HoaDonCTPage {

    @RequestMapping("/quanlyhdchitiet")
    public String index(Model m, Integer page) {
        // Load dữ liệu nhân v  iên từ database
        IBillDetailDAO eDao = new ImplBillDetail();
        List<BillDetail> list = eDao.getAll();
        m.addAttribute("list", list);

        return "admin/hdchitiet-page"; // Tải dữ liệu lên trang index.jsp
    }

    
    
    
}
