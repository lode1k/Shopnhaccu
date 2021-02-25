/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Admin;
import entity.Catelog;
import entity.News;
import java.util.List;

/**
 *
 * @author PC
 */
public interface INewsDAO {
       
    public List<News> getAll();
    public boolean insert(News n);
    public News getById(Integer id);
    public boolean update(News n);
    public boolean delete(Integer id);
    
}
