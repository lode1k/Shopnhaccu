/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Admin;
import entity.Catelog;
import entity.News;
import entity.Product;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import utils.HibernateUtil;

/**
 *
 * @author PC
 */
public class ImplNews implements INewsDAO {

    @Override
    public List<News> getAll() {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        List<News> list = ss.createQuery("from News").list();
        ss.getTransaction().commit();
        ss.close();
        return list;
    }

    @Override
    public boolean insert(News n) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        try {
            ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
            ss.save(n);
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
    public News getById(Integer id) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        News n = (News) ss.get(News.class, id);
        ss.getTransaction().commit();
        ss.close();
        return n;
    }

    @Override
    public boolean update(News n) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        try {
            ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
            ss.update(n);
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
            News n = (News) ss.get(News.class,  id);
            ss.delete(n);
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
