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
public interface ICatelogDAO {
    public List<Catelog> getAll();
    public int getCount();
    public List<Catelog> getAllPaging(int offset, int limit);
    public boolean insert(Catelog c);
    public Catelog getById(Integer id);
    public boolean update(Catelog c);
    public boolean delete(Integer id);
}
