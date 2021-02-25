/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Admin;
import entity.Bill;
import entity.BillDetail;
import entity.Catelog;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import utils.HibernateUtil;

/**
 *
 * @author PC
 */
public class ImplBillDetail implements IBillDetailDAO {

    @Override
    public List<BillDetail> getAll() {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        List<BillDetail> list = ss.createQuery("from BillDetail").list();
        ss.getTransaction().commit();
        ss.close();
        return list;
    }

    @Override
    public boolean insert(BillDetail b) {
       SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        try {
            ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
            ss.save(b);
            ss.getTransaction().commit();
            ss.close();
            return true;
        } catch (Exception exp) {
            ss.getTransaction().rollback(); // Khôi phục lệnh lỗi
            exp.printStackTrace();
            return false;
        }
    }

    

    
    }


