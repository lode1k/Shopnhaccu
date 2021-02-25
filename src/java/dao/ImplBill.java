/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Admin;
import entity.Bill;
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
public class ImplBill implements IBillDAO {

    @Override
    public List<Bill> getAll() {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        List<Bill> list = ss.createQuery("from Bill").list();
        ss.getTransaction().commit();
        ss.close();
        return list;
    }

    @Override
    public boolean insert(Bill b) {
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

    @Override
    public Bill getById(Integer id) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        Bill b = (Bill) ss.createQuery("from Bill where id = :ide").setInteger("ide", id).list().get(0);
        ss.getTransaction().commit();
        ss.close();
        return b;
    }

    @Override
    public boolean update(Bill b) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        try {
            ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
            ss.update(b);
            ss.getTransaction().commit();
            ss.close();
            return true;
        } catch (Exception exp) {
            ss.getTransaction().rollback(); // Khôi phục lệnh lỗi
            exp.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(Integer id) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        try {
            ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
            Bill b = (Bill) ss.get(Bill.class, id);
            ss.delete(b);
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
