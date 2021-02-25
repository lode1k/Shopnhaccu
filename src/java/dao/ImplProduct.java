/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Catelog;
import entity.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import utils.HibernateUtil;

/**
 *
 * @author PC
 */
public class ImplProduct implements IProductDAO {

    @Override
    public List<Product> getAll() {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        List<Product> list = ss.createQuery("from Product").list();
        ss.getTransaction().commit();
        ss.close();
        return list;
    }

    @Override
    public List<Product> getAllWithCatelog() {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        List<Object[]> list = ss.createQuery("from Product p inner join p.catelog c").list();
        //Xử lý dữ liệu
        for (Object[] o : list) {
            Product p = (Product) o[0]; //Phần tử thứ nhất của mảng [item thuộc list]
            Catelog c = (Catelog) o[1]; //Phần tử thứ 2 chứa đối tượng Catelog
            //System.out.println("Sản phẩm "+p.getTen()+"thuộc danh mục"+c.getTieude());       
        }

        return null;

    }

    @Override
    public void getProductByCatelog() {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        List<Object[]> list = ss.createQuery("select p.idloai,count(*) from Product p group by p.idloai").list();
        //Xử lý dữ liệu
        for (Object[] o : list) {
            int p = (int) o[0]; //Phần tử thứ nhất của mảng [item thuộc list]
            long c = (long) o[1]; //Phần tử thứ 2 chứa đối tượng Catelog
            System.out.println("Mã danh mục là " + p + "có số sản phẩm là" + c);
        }

    }

//    public static void main(String[] args) {
//        ImplProduct a = new ImplProduct();
//        int b= a.getCount();
//        System.out.println(b);
//    }

    @Override
    public List<Product> getProductbyIdloai(Integer id) {      
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        List<Product> list = ss.createQuery("from Product where idloai = :ide").setInteger("ide", id).list();
        ss.getTransaction().commit();
        ss.close();
        return list;
    }

    @Override
    public int getCount() {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        int total = ss.createQuery("from Product").list().size();
        ss.getTransaction().commit();
        ss.close();
        return total;
    }

    @Override
    public List<Product> getAllPaging(int offset, int limit) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        List list = ss.createQuery("from Product").setFirstResult(offset).setMaxResults(limit).list();
        ss.getTransaction().commit();
        ss.close();
        return list;
    }

    @Override
    public boolean insert(Product p) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        try {
            ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
            ss.save(p);
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
    public Product getById(Integer id) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        Product p = (Product) ss.get(Product.class, id);
        ss.getTransaction().commit();
        ss.close();
        return p;
    }

    @Override
    public boolean update(Product c) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        try {
            ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
            ss.update(c);
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
            Product e = (Product) ss.get(Product.class, id);
            ss.delete(e);
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
    public List<Product> getAllWithHome() {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        List<Product> list = ss.createQuery(" from Product  where home = 1 ").list();
        ss.getTransaction().commit();
        ss.close();
        return list;
    }

//    @Override
//    public int getCountById(Integer id) {
//        SessionFactory ssf = HibernateUtil.getSessionFactory();
//        Session ss = ssf.openSession(); // Mở phiên
//        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
//        int total = ss.createQuery("from Product where idloai = :ide").setInteger("ide",id ).list().size();
//        ss.getTransaction().commit();
//        ss.close();
//        return total;
//    }

    @Override
    public Product getByIdloai(Integer idloai) {
        SessionFactory ssf = HibernateUtil.getSessionFactory();
        Session ss = ssf.openSession(); // Mở phiên
        ss.beginTransaction(); // Bắt đầu thực hiện truy vấn dữ liệu
        Product p = (Product) ss.get(Product.class, idloai);
        ss.getTransaction().commit();
        ss.close();
        return p;
    }

}
