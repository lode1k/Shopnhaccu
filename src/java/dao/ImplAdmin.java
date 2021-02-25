/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import entity.Admin;
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
public class ImplAdmin implements IAdminDAO{

    @Override
    public boolean getAdminByParam(String uname, String upass) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession();
        ss.beginTransaction();
        Admin a =null;
        try{
        a = (Admin)ss.createQuery("from Admin where username = :un AND password = :up")
                .setString("un", uname)
                .setString("up", upass).uniqueResult();
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("Lỗi:"+e.getMessage());
            ss.getTransaction().rollback();//Khôi phục các lệnh đã thực hiện trước đó >> tránh lỗi
        }
        if(a!=null){
            return true;
        }else{
            return false;
        }
        
    }

    @Override
    public List<Admin> getAll() {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        List<Admin> list = ss.createQuery("from Admin").list();
        ss.getTransaction().commit();
        ss.close();
        return list;
    }

    @Override
    public boolean insert(Admin a) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        try {
            ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
            ss.save(a);
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
    public Admin getById(Integer id) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        Admin a = (Admin) ss.createQuery("from Admin where id = :ide").setInteger("ide", id).list().get(0);
        ss.getTransaction().commit();
        ss.close();
        return a;
    }

    @Override
    public boolean update(Admin a) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        try {
            ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
            ss.update(a);
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
            Admin a = (Admin) ss.get(Admin.class, id);
            ss.delete(a);
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
