/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Bill;
import entity.BillDetail;
import entity.Catelog;
import entity.Product;
import java.util.List;

/**
 *
 * @author PC
 */
public interface IBillDetailDAO {
    public List<BillDetail> getAll();   
    public boolean insert(BillDetail b);
    
 
}
