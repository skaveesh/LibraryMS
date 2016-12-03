<%-- 
    Document   : login
    Created on : Dec 3, 2016, 3:21:44 PM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //check if session is available
    if (session == null || (session.getAttribute("username") == null || session.getAttribute("username").equals(""))) {
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>LibraryMS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css" media="screen,projection" />

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel='shortcut icon' href='images/favicon.ico' type='image/x-icon'/>
    </head>
    <body  style="background: url(images/image_bg_index.jpg) no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover;-o-background-size: cover; background-size: cover;">


        <!-- navigation bar-->
        <nav>
            <div class="nav-wrapper amber darken-1">
                <a href="#!" class="brand-logo grey-text text-darken-4" style="font-weight: 100">&nbsp;Library Management System</a>
                <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down">
                    <li><a class="grey-text text-darken-3" href="index.html">LibraryMS</a></li>
                    <li><a class="grey-text text-darken-3" href="login.jsp">Login</a></li>
                    <li><a class="grey-text text-darken-3" href="requestAccount.html">Request an Account</a></li>
                </ul>
                <ul class="side-nav amber darken-1" id="mobile-demo">
                    <li><a href="index.html">LibraryMS</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="requestAccount.html">Request an Account</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">

            <div class="row">
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>

                <div class="col l4 offset-l4 m6 offset-m3 s12 amber darken-1" style="padding: 30px 30px 30px 30px;border-radius: 5px;box-shadow: 1px 1px 20px black"> 
                    <form action="LoginHandle" method="POST">
                        <div class="row">
                            <div class="input-field">
                                <input id="user_name" type="text" class="validate white-text" name="username">
                                <label for="user_name" class="white-text">Userame</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field">
                                <input id="user_password" type="password" class="validate" name="password">
                                <label for="duser_password" class="white-text">Password</label>
                            </div>
                        </div>
                        <div class="row center">
                            <button  class="waves-effect waves-light white grey-text text-darken-1 btn center-align" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>


        </div>



        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="materialize/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="materialize/js/materialize.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $(".button-collapse").sideNav();
            });
        </script>

        <style>
            /* label focus color */ 
            .input-field input[type=text]:focus + label {
                color: #FFF;
            }

            /* label underline focus color */
            .input-field input[type=text]:focus {
                border-bottom: 1px solid #FFF;
                box-shadow: 0 1px 0 0 #FFF;
            }

            /* label focus color */
            .input-field input[type=password]:focus + label {
                color: #FFF;
            }
            /* label underline focus color */
            .input-field input[type=password]:focus {
                border-bottom: 1px solid #FFF;
                box-shadow: 0 1px 0 0 #FFF;
            }


            password:focus {
                border-bottom: 1px solid orange;
                -webkit-box-shadow: 0 1px 0 0 orange;
                -moz-box-shadow: 0 1px 0 0 orange;
                box-shadow: 0 1px 0 0 orange;
            }
        </style>
    </body>
</html>
<%} else if (session != null || (session.getAttribute("username") != null || !session.getAttribute("username").equals(""))) {
        //if session is admin goto admin page else goto user page
        if (session.getAttribute("username").equals("admin")) {
            response.sendRedirect("AdminDashboard.jsp");
        } else {
            response.sendRedirect("UserDashboard.jsp");
        }
    }
%>