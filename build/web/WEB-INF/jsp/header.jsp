<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div style="background: black" id="header-top">
    <div class="container">
        <div  class="row clearfix">
            <div class="col-md-6" id="header-text">
                <b style="font-size: 20px;color: white">Hotline 0366030582</b>
            </div>
            <div class="col-md-6">
                
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row" id="header-main">
        <div class="col-md-5">
            <form class="form-inline">
                <div class="form-group">
                    <label>
                        <select name="category" class="form-control">
                            <option> All Category</option>
                            <option> Dell </option>
                            <option> Hp </option>
                            <option> Asuc </option>
                            <option> Apper </option>
                        </select>
                    </label>
                    <input type="text" name="keywork" placeholder=" input keywork" class="form-control">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                </div>
            </form>
        </div>
        <div class="col-md-4">
            <a href="">
                <img width="60%" src="<c:url value="public/images/utt.png"></c:url>">
            </a>
        </div>
        <div class="col-md-3" id="header-right">
            <div class="pull-right">
                <div class="pull-left">
                    <i class="glyphicon glyphicon-phone-alt"></i>
                </div>
                <div class="pull-right">
                    <p id="hotline">HOTLINE</p>
                    <p>0366030582</p>
                </div>

            </div>
        </div>
    </div>
</div>