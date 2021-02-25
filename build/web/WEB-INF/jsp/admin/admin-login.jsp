<%-- 
    Document   : admin-login
    Created on : Sep 16, 2020, 7:27:43 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form</title>
        <style>
            * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    color: #444;
    font-family: calibri;
}

body{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    width: 100vw;
}

.login {
    text-align: center;
    position: relative;
    width: 280px;
}

input, button {
    width: 100%;
    border: 0;
    border-radius: 20px;
}

input{
    border-bottom: 2px solid #444;
    padding: 12px 40px 12px 20px;
}


input, button, .group i, p, a{
    font-size: 13.3333px;
    font-weight: 600;
}

.group{
    margin-bottom: 10px;
    position: relative;
}

.group i{
    position: absolute;
    top: 15px;
    right: 20px;
}

button {
    padding: 12px;
    background-image: linear-gradient(to right, #ff1464, purple);
    margin-bottom: 20px;
    cursor: pointer;
}

button, button i{
    color: #ffffff;
}

button i{
    margin-right: 5px;
}

p{
    margin-bottom: 20px;
}

i.fa.fa-empire, a{
    color: #ff1464;
}

i.fa.fa-empire{
    font-size: 60px;
    margin-bottom: 20px;

}

h2{
    margin-bottom: 20px;
}

input:focus, input:focus::placeholder, input:focus+i{
    color: #ff1464;
}

input:focus, button:focus{
    outline: 0;
}


body:before, body:after{
    content: "";
    position: absolute; 
    height: 300px;
    width: 500px;
}

body:before{
    background-image: linear-gradient(to right, #ff1464, purple);
    bottom: 0;
    left: 0;
    clip-path: polygon(0 0, 0 100%, 100% 100%);
}

body:after{
    background-image: linear-gradient(to right, purple, #ff1464);
    top: 0;
    right: 0;
    clip-path: polygon(100% 0, 0 0, 100% 100%);
}

@media (max-width: 767px){
    body:before, body:after{
        height: 150px;
        width: 300px;
    }
}
        </style>
    </head>
    <body>
        
        <h2 style="color: red">${msg}</h2>
        <hr>

        <form:form action="admin-login.htm" modelAttribute="admin"> 
            <div class="login">
                <i class="fa fa-empire"></i>
                <h2>Login</h2>
                <div class="group"><form:input type = "text" path="username"/><i class="fa fa-user"></i></div>
                <div class="group"><form:input type = "password" path="password"/><i class="fa fa-lock"></i></div>
                <button><i class="fa fa-send"></i>Login</button>
                <p class="fs">Forgot <a href="#">Username</a> / <a href="#">Password</a> ? </p>
                <p class="ss">Don't have an account? <a href="">Signup</a></p>
            </div>
        </form:form>

    </body>
</html>
