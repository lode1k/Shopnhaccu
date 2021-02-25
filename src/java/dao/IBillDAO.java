/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Bill;
import entity.Catelog;
import entity.Product;
import java.util.List;

/**
 *
 * @author PC
 */
public interface IBillDAO {
    public List<Bill> getAll();   
    public boolean insert(Bill b);
    public Bill getById(Integer id);
    public boolean update(Bill b);
    public boolean delete(Integer id);
}
