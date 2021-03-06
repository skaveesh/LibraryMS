<%-- 
    Document   : UserDashboard
    Created on : Dec 3, 2016, 2:43:54 PM
    Author     : Samintha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || (session.getAttribute("username") == null || session.getAttribute("username").equals(""))) {
        String s = "Please Login First! Goto <a href=\"login.jsp\" >Login</a>";
        request.setAttribute("passedMessage", s);
        RequestDispatcher rd = request.getRequestDispatcher("/TemplateSite.jsp");
        rd.forward(request, response);
    } else if (session != null && session.getAttribute("username").equals("admin")) {
        String s = "You Don't Belong Here!";
        request.setAttribute("passedMessage", s);
        RequestDispatcher rd = request.getRequestDispatcher("/TemplateSite.jsp");
        rd.forward(request, response);
    } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <body>

        <!-- navigation bar-->
        <div class="navbar-fixed" style="z-index:999">
            <nav>
                <div class="nav-wrapper amber darken-1">
                    <a href="#!" class="brand-logo grey-text text-darken-4" style="font-weight: 100">&nbsp;Library Management System</a>
                    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                    <ul class="right hide-on-med-and-down">
                        <li class="black-text">Welcome ${sessionScope.username}</li>
                        <li><a class="waves-effect waves-light btn amber darken-4" href="UserDashboard.jsp">Refresh</a></li>
                        <li><a class="grey-text text-darken-3" href="index.html">LibraryMS</a></li>
                        <li><a class="grey-text text-darken-3" href="LoginHandle">Logout</a></li>
                    </ul>
                    <ul class="side-nav amber darken-1" id="mobile-demo">
                        <li><a href="UserDashboard.jsp">Refresh</a></li>
                        <li><a href="index.html">LibraryMS</a></li>
                        <li><a href="LoginHandle">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="container">
            <br />
            <br />
            <!--beginning of the library app-->
            <div class="row">
                <div class="col s12">
                    <ul class="tabs tabs-fixed-width">
                        <li class="tab col s2"><a id="tabdisplayid" href="#tabdisplay">Display</a></li>
                        <li class="tab col s2"><a id="tabsearchid" href="#tabsearch">Search</a></li>
                        <li class="tab col s2"><a id="tabreservationid" href="#tabreservation">Book Reservation</a></li>
                    </ul>
                </div>

                <div id="tabdisplay" class="col s12 amber lighten-4">
                    <br />
                    <p class="flow-text center-align">Available Books</p>
                    <br />
                    <jsp:include page="book/viewallbooks.jsp" />
                </div>

                <div id="tabsearch" class="col s12 amber lighten-4">
                    <br />
                    <p class="flow-text center-align">Search Books</p>
                    <br />
                    <jsp:include page="book/searchbook.jsp" />
                </div>

                <div id="tabreservation" class="col s12 amber lighten-4">
                    <br />
                    <p class="flow-text center-align">Books Reservation</p>
                    <p>This function can use to reserve book which are currently not
                    available at our library. So you can reserve that book and 
                    get e-mail notification whenever the book is available. E-mail will be 
                    sent to the e-mail that you provided at the registration. Note that you
                    can only reserve one book at a time.</p>
                    <br />
                    <jsp:include page="book/reservebook.jsp" />
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
        </style>
    </body>
    <script type="text/javascript">

        $('#tabdisplayid').click(function () {
            localStorage.setItem("tabvaluestore", "tabdisplay");
        });
        
        $('#tabsearchid').click(function () {
            localStorage.setItem("tabvaluestore", "tabsearch");
        });

        $('#tabreservationid').click(function () {
            localStorage.setItem("tabvaluestore", "tabreservation");
        });

        //automatically redirect to the corresponding tab
        $(document).ready(function () {
            $('ul.tabs').tabs('select_tab', localStorage.getItem("tabvaluestore"));
        });

        //initialize html select 
        $(document).ready(function () {
            $('select').material_select();
        });

        //this will display toasts when inserting, deleting, updating
        <%
            if (request.getAttribute("Status") != null) {
        %>
        Materialize.toast('<%=request.getAttribute("Status")%>', 4000);
        <%
            }
        %>

    </script>
</html>
<%    }
%>