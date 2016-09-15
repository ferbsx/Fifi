<%--
  Created by IntelliJ IDEA.
  User: chaperone
  Date: 13.07.16
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>

<%--DATA MINING PAGE--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        html {
            font-family: 'Open Sans', sans-serif;
            font-weight: 400;
            font-size: 20px;
            line-height: 1.6;
            /*color: white;*/
        }

        .content {
            margin-top: 100px;
            z-index: 0;
            position: absolute;
            padding: 1em 0 0.25em;
            background: white;
        }

        h1, h2, h3, h4 {
            margin-top: 0;
            /*color: black;*/
        }

        .logo img {
            max-height: 75px;
            margin-right: 5px;
            vertical-align: middle;
        }

        /* To place the picture next to the text*/
        @media (min-width: 600px) {
            .logo {
                display: inline-block;
                height: 45px;
                line-height: 35px;
            }
        }


        header {
            /*font-size: 20px;*/
            /*font-size: large;*/
            /*padding: 2em;*/
            /*color: white;*/
            background-color: dimgrey;
            clear: left;
            text-align: left;
            /*border-style: solid;*/
            /*border-color: darkorange;*/
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            /*opacity: 0.9;*/
            /*background-color: green;*/
            position: fixed;
            top: 0;
            width: 100%;
        }

        .inner {
            padding: 0 1em;
        }

        @media (min-width: 1100px) {
            .inner {
                width: 1000px;
                margin: auto;
            }
        }

        .navigation a {
            text-decoration: none;
            color: white;
        }

        .topbar a:hover, .topbar a:active {
            color: darkorange;
        }

        .navigation {
            vertical-align: middle;
            /*color: blue;*/
            /*background-color: blueviolet;*/
        }

        .navigation ul {
            list-style: none;
            margin: 0;
            padding: 0px 0px 0px 30px;
            overflow: auto;
            font-size: 15px;
        }

        .navigation a:hover,
        .navigation .active {
            color: darkorange;
            border-bottom: 2px solid darkorange;
            padding-bottom: 2px;
        }

        @media (min-width: 900px) {
            .navigation a:hover,
            .navigation .active {
                border: none;
            }

            .navigation a:hover:after,
            .navigation .active:after {
                content: "";
                display: block;
                height: 1px;
                margin-top: -1px;
                background-color: darkorange;
            }
        }

        @media (min-width: 600px) {
            .navigation li {
                float: left;
                margin-right: 1em;
            }
        }

        @media (min-width: 900px) {
            .navigation {
                display: inline-block;
                height: 55px;
                line-height: 55px;
            }
        }

        footer {
            padding: 1em;
            color: white;
            background-color: dimgrey;
            clear: left;
            text-align: center;
            font-size: 17px;
            /*margin-bottom: 0%;*/
            width: 100%;
        }







        subheader {
            padding: 1em;
            color: black;
            /*background-color: grey;*/
            clear: left;
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        /*tr:hover {background-color: #f5f5f5}*/

        tr:nth-child(even) {background-color: #f2f2f2}

        .dropbtn {
            background-color: darkorange;
            color: white;
            padding: 9px;
            font-size: 15px;
            border: none;
            cursor: pointer;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {background-color: #f1f1f1}

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: orangered;
        }

        a.hidden {
            display:none;
        }
        .paddedparticipants {
            padding-left: 117px;
        }

    </style>
    <title>Data mining</title>
    <header class="topbar" role="banner">
        <div class="inner">
            <h1 class="logo"><a><img alt="Logo" src="${pageContext.request.contextPath}/logo.jpg" /></a>
            </h1>
            <nav class="navigation" role="navigation">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/index.jsp">Greyhound Data Project</a></li>
                    <li><a href="${pageContext.request.contextPath}/search.jsp">Dog Search</a></li>
                    <li><a href="${pageContext.request.contextPath}/datamining.jsp">Data Mining</a></li>
                    <li><a href="${pageContext.request.contextPath}/documentation.jsp">Documentation</a></li>
                    <li><a href="${pageContext.request.contextPath}/faq.jsp">FAQ</a></li>
                </ul>
            </nav>
        </div>
    </header>
</head>

<body class="content">
<%--<header>--%>
    <%--Welcome to the greyhound race data mining service--%>
<%--</header>--%>
<%--<br>--%>
<subheader>
    Here we offer you a forecast of possible future races. On your request our data mining tool will predict the most probable outcome of a race between up to four dogs of your choice by analysing the dogs recent and prospective physical condition.
</subheader>
<br>
<br>
<%-- query action --%>

<form name ="f1" <%--action="query_details.jsp"--%> method="post">
    <%--<a>participants:</a>--%>
    <%--<a>Please enter the dog names' that you want to see the predictions for. You can see the predictions for up to 4 dogs in a year.</a>--%>
    <input type="hidden" name="state">
    <%-- here query fields--%>
    <div>
        <a id="year">Race year: <input type="text" name="year"></a>
        <input type="submit" value="Predict" class="dropbtn">
    </div>
    <a id="dog1">Participants: <input type="text" name="dog1"></a>
    <div class="paddedparticipants">
        <a id="dog1"><input type="text" name="dog1"><br></a>
        <a id="dog2"><input type="text" name="dog2"><br></a>
        <a id="dog3"><input type="text" name="dog3"><br></a>
        <a id="dog4"><input type="text" name="dog4"><br></a>
    </div>
    <%--<input type="submit" value="Predict" class="dropbtn">--%>
</form>





<%--TODO: need an error for when the field is empty! (validation or something) -when you press search without giving in a dog name.--%>
<script language="JavaScript">
    function submit() {
        document.f1.state.value = "submit";
        f1.submit();
    }
</script>


<%--ausgabe layout--%>
<br>
<br>
<%
    if(request.getParameter("state") != null) {
%>
<h2>Results:</h2>
<p>Dogs are listed in order of their predicted score in the future race.</p>

<jsp:useBean id="q" class="dbs.MiningManager"></jsp:useBean>
<jsp:setProperty name="q" property="dog1"/>
<jsp:setProperty name="q" property="dog2"/>
<jsp:setProperty name="q" property="dog3"/>
<jsp:setProperty name="q" property="dog4"/>
<jsp:setProperty name="q" property="year"/>
<jsp:getProperty name="q" property="query"/>
<div style="overflow-x:auto;">
    <table>
        <tr>
            <th>Dog name</th>
            <th>predicted score</th>
            <th>in year</th>
        </tr>
        <%
            for(int i = 0; i < 100; i++) {
                try {
        %>
        <jsp:getProperty name="q" property="nextRow"/>
        <tr>
            <td><jsp:getProperty name="q" property="nextValue"/></td>
            <td><jsp:getProperty name="q" property="nextValue"/></td>
            <td><jsp:getProperty name="q" property="nextValue"/></td>
        </tr>

        <%
                } catch(Exception e) {

                }
            }
        %>
    </table>
</div>
<%
    }
%>
</body>

<footer>
    Proudly built by Ferdous, Nova and Leli
</footer>

</html>
