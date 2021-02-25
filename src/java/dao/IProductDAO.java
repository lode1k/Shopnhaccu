/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Catelog;
import entity.Product;
import java.util.List;

/**
 *
 * @author PC
 */
public interface IProductDAO {
    public List<Product> getAll();
    public List<Product> getAllWithCatelog();
    public void getProductByCatelog();
    public List<Product> getProductbyIdloai(Integer id);
    public int getCount();
    //public int getCountById(Integer id);
    public List<Product> getAllPaging(int offset, int limit);
    public boolean insert(Product p);
    public boolean update(Product c);
    public boolean delete(Integer id);
    public Product getById(Integer id);
    public Product getByIdloai(Integer idloai);
    public List<Product> getAllWithHome();
}
