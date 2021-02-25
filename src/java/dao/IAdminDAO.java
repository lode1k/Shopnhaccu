/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Admin;
import entity.Catelog;
import java.util.List;

/**
 *
 * @author PC
 */
public interface IAdminDAO {
    
    public boolean getAdminByParam(String uname,String upass);
    public List<Admin> getAll();
    public boolean insert(Admin a);
    public Admin getById(Integer id);
    public boolean update(Admin a);
    public boolean delete(Integer id);
    
}
