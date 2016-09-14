<%--
  Created by IntelliJ IDEA.
  User: Ferdous
  Date: 7/12/16
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>

<%--DOG SEARCH PAGE--%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <style>
        <%--TODO: make the whole background colour grey--%>
        <%--TODO: make the buttons orange--%>
        /*header {*/
            /*font-size: large;*/
            /*padding: 2em;*/
            /*color: white;*/
            /*background-color: dimgrey;*/
            /*clear: left;*/
            /*text-align: center;*/
            /*border-style: solid;*/
            /*border-color: darkorange;*/
        /*}*/
        /*footer {*/
            /*padding: 1em;*/
            /*color: white;*/
            /*background-color: dimgrey;*/
            /*clear: left;*/
            /*text-align: center;*/
        /*}*/

        html {
            font-family: 'Open Sans', sans-serif;
            font-weight: 400;
            font-size: 20px;
            line-height: 1.6;
            /*color: white;*/
        }

        .content {
            margin-top: 100px;
            /*margin: 100px auto -35px;*/
            /*margin-bottom: -40px;*/
            z-index: 0;
            position: absolute;
            padding: 1em 1em 0.25em;
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
            /*height: 35px;*/
        }

        /*.wrapper {*/
            /*min-height: 100%;*/
            /*!*height: auto !important; !* This line and the next line are not necessary unless you need IE6 support *!*!*/
            /*!*height: 100%;*!*/
            /*margin: 0 auto -40px; !* the bottom margin is the negative value of the footer's height *!*/
        /*}*/

        /*.push {*/
            /*height:40px; !* .push must be the same height as .footer *!*/
        /*}*/






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

    </style>

    <title>Dog Search</title>
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
        <%--Welcome to the greyhound race archive--%>
    <%--</header>--%>
    <%--<br>--%>
    <subheader>
        You can use this tool to search for a dog by its name. You could also press the "+" to set other parameters. The results will then be shown as a table at the bottom of this page.
    </subheader>
    <br>
    <br>
    <%-- query action --%>

    <form name ="f1" <%--action="query_details.jsp"--%> method="post">
        Dog name: <input type="text", name="dogName"><input type="submit" value="search" class="dropbtn">
        <input type="hidden" name="state">
        <input type="hidden" name="sex">
        <%-- here + button and extended query buttons --%>
        <div class="dropdown">
            <button class="dropbtn">+</button>
            <div class="dropdown-content">
                <%--<a href="#">Link 1</a>--%>
                <%--<a href="#">Link 2</a>--%>
                <%--<a href="#">Link 3</a>--%>
                <a onclick="addC('mother')">Dam's Name</a>
                <a onclick="addC('father')">Sire's Name</a>
                <a onclick="addC('gender')">Gender</a>
                <a onclick="addC('byear')">Birth Year</a>
                <a onclick="addC('racecountry')">Race Country</a>
                <a onclick="addC('raceyear')">Race Year</a>
                <%--<a onclick="addC('araceyear')">Race year after</a>--%>
            </div>
        </div>
        <div>
            <a id="mother" class="hidden">Dam's name: <input type="text" name="mother"><br></a>
            <a id="father" class="hidden">Sire's name: <input type="text" name="father"><br></a>
            <a id="byear" class="hidden">Birth year: <input type="text" name="yearOfBirth"><br></a>
            <a id="racecountry" class="hidden">Race country: <input type="text" name="raceCountry"><br></a>
            <a id="araceyear" class="hidden">Race year between: <input type="text" name="raceYearAfter"></a>
            <a id="braceyear" class="hidden"> - <input type="text" name="raceYearBefore"><br></a>
            <a id="gender" class="hidden">Gender: <select name="sexxx">
                <option name="any"></option>
                <option name="male" onclick="setSex('m')">male</option>
                <option name="female" onclick="setSex('f')">female</option>
            </select><br></a>
            <%--<a id="araceyear" style="display: none">after: <input type="text" name="araceyear"></a><br>--%>
        </div>


    </form>





    <%--TODO: need an error for when the field is empty! (validation or something) -when you press search without giving in a dog name.--%>
    <script language="JavaScript">
        //  function addC(button) {
        //      if (button === 'mother') {
        //          document.getElementById("mother").style.display="block";
        //      }
        //    document.extend.attribute.value = button;
        //    extend.submit();
        //  }
        function addC(condition) {
            if(condition == "raceyear") {
                document.getElementById("braceyear").style.display="inline";
                document.getElementById("araceyear").style.display="inline";
            }
            document.getElementById(condition).style.display="inline";
    //      document.getElementById("extBox").style.display="none";
            //document.extend.attribute.value = button;
            //extend.submit();
        }
        function add() {
            <%--document.form1.addButton.value = "added"
            form1.submit();--%>
            document.getElementById("extBox").style.display="block";

        }
        function submit() {
            document.f1.state.value = "submit";
            f1.submit();
        }
        function setSex(s) {
            document.f1.sex.value = s;
            //f1.submit();
        }
    </script>


    <%--ausgabe layout--%>
    <br>
    <br>
    <%
        if(request.getParameter("state") != null) {
    %>
    <h2>Results:</h2>
    <p>This is a list of all dog names that match your query.</p>

    <jsp:useBean id="q" class="dbs.QManager"></jsp:useBean>
    <jsp:setProperty name="q" property="dogName"/>
    <jsp:setProperty name="q" property="mother"/>
    <jsp:setProperty name="q" property="father"/>
    <jsp:setProperty name="q" property="sex"/>
    <jsp:setProperty name="q" property="yearOfBirth"/>
    <jsp:setProperty name="q" property="raceYearBefore"/>
    <jsp:setProperty name="q" property="raceYearAfter"/>
    <jsp:setProperty name="q" property="raceCountry"/>
    <jsp:getProperty name="q" property="query"/>
    <div style="overflow-x:auto;">
        <table>
            <tr>
                <th>Dog name</th>
                <th>Dam's name</th>
                <th>Sire's name</th>
                <th>Gender</th>
                <th>Year of birth</th>
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
