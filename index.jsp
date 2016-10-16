<%--
  Created by IntelliJ IDEA.
  User: Ferdous
  Date: 7/12/16
  Time: 11:17 PM
  To change this template use File | Settings | File Templates.
--%>


<%--WELCOME PAGE--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<link rel="stylesheet" href="home.css">--%>
<%--<link rel="stylesheet" href="flashes.sass">--%>
<%--<link rel="stylesheet" href="front.sass">--%>
<html>
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


        .front-title {
        font-size: 30px;
        color: black;
        font-weight: 300;
        @media (min-width: medium)
        font-size: 30px;
        }

        .front-cta {
            padding-top: 3em;
        }

        @media (min-width: medium) {
            .front-cta {
                display: flex;
                flex-flow: row wrap;
                justify-content: space-between;
            }
        }

        .button {
        /*display: block;*/
        /*padding: 2em 1em;*/
        /*text-decoration: none;*/
        /*text-align: center;*/
        /*transition: background 200ms ease;*/


        background-color: dimgrey;
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        -webkit-transition-duration: 0.3s; /* Safari */
        transition-duration: 0.4s;
        border-radius: 2px;
        width: 400px;
            /*float: left;*/
            /*border: 1px solid green*/


        }

        .button:hover {
            background-color: darkorange;
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
        }

        .button.h3 {
        margin: 0;
        font-weight: 400;
        color: white;
        font-size: 28px;
        }

        .button.p {
        margin: 0;
        color: white;
        font-size: 21px;
        font-weight: 300;
        @media (min-width: medium)
        flex: 0 0 49%;
        }

        /*.front-apply.attendee {*/
        /*background-color: dimgrey;*/
        /*}*/

        /*.front-apply.attendee.h3 {*/
            /*!*coloredEm(#606060);*!*/
            /*position: relative;*/
            /*display: inline-block;*/
            /*z-index: 1;*/
        /*}*/

        /*@media {*/
            /*.front-apply.attendee h3:hover,*/
            /*.front-apply.attendee h3:active {*/
                /*background: orangered;*/
            /*}*/
            /*.front-apply.attendee h3:before {*/
                /*content: "";*/
                /*display: block;*/
                /*height: 30%;*/
                /*width: 100%;*/
                /*background: dimgrey;*/
                /*position: absolute;*/
                /*bottom: 5%;*/
                /*z-index: -1;*/
            /*}*/
        /*}*/





        /*.navigation a:hover,*/
        /*.navigation .active {*/
            /*color: darkorange;*/
            /*border-bottom: 2px solid darkorange;*/
            /*padding-bottom: 2px;*/
        /*}*/

        /*@media (min-width: 900px) {*/
            /*.navigation a:hover,*/
            /*.navigation .active {*/
                /*border: none;*/
            /*}*/

            /*.navigation a:hover:after,*/
            /*.navigation .active:after {*/
                /*content: "";*/
                /*display: block;*/
                /*height: 1px;*/
                /*margin-top: -1px;*/
                /*background-color: darkorange;*/
            /*}*/
        /*}*/

        <%--.front-apply.organizer {--%>
        <%--background-color: #606060 h3;--%>
        <%--} +--%>

        <%--coloredEm--%>
        <%--(--%>
        <%--#606060--%>

        <%--)--%>
        <%--&--%>
        <%--: hover,--%>

        <%--&--%>
        <%--: active--%>
        <%--background: #606060--%>

        <%--}--%>
        <%--}--%>


        footer {
        padding: 1em;
        color: white;
        background-color: dimgrey;
        clear: left;
        text-align: center;
        font-size: 17px;
        /*margin-bottom: 0%;*/
        }


    </style>

<head>
    <title>Welcome to Grey Hound Data Project</title>
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
    <%--<div class="flashes">--%>
    <%--</div>--%>
    <div class="inner">
        <h1 class="front-title">Welcome to the Greyhound race archive.
            <%--We help events reach a <em class="em--yellow">more diverse</em> audience. And we help you to <em class="em--yellow">find these events</em>.--%>
        </h1>
        <h2 class="front-title">
            This page was made by the FLY group as a university course project. We used a snippet of the
            <a target="_blank" href="http://www.greyhound-data.com/index.htm?z=b-0seT">Greyhound data</a>
            for our database. You can use the buttons below to
            <%--<em class="em--yellow">--%>
                search for a certain dog
            <%--</em>--%>
            , and add conditions to your search as you like or to
            <%--<em class="em--red">--%>
                mine in the data
            <%--</em> --%>
             and let our system provide you with a forecast of the dog's future run results.
            <%--Because <em class="em--red">diversity</em> is what <em class="em--red">makes communities whole</em>.--%>
        </h2>

        <%--<div class="front-cta">--%>
            <%--<a class="front-apply attendee" href="${pageContext.request.contextPath}/index.jsp">--%>
                <%--<h3>Dog Search</h3>--%>
                <%--<p>Find details to a certain dog.</p>--%>
            <%--</a>--%>
            <%--<a class="front-apply organizer" href="${pageContext.request.contextPath}/data_mining.jsp">--%>
                <%--<h3>Data Mining</h3>--%>
                <%--<p>Predict the dog's future results.</p>--%>
            <%--</a></div>--%>


        <div class="front-cta">
            <a class="button search" href="${pageContext.request.contextPath}/search.jsp">
                <h3>Dog Search</h3>
                <p>Find details to a certain dog.</p>
            </a>
            <a class="button mine" href="${pageContext.request.contextPath}/datamining.jsp">
                <h3>Data Mining</h3>
                <p>Predict the dog's future results.</p>
            </a></div>
    </div>
</body>

<footer class="footer">
    <%--<div class="inner">--%>
        <%--<ul>--%>
            <%--<li>--%>
                <%--<img alt="heart-icon" src="${pageContext.request.contextPath}/heart.png" />--%>
                <%--<p>--%>
                    Proudly built by Ferdous, Nova and Leli
                <%--</p>--%>
            <%--</li>--%>
            <%--<li><img alt="bubble-icon" src="${pageContext.request.contextPath}/bubble.gif" /><p>--%>
                <%--Checkout the code on--%>
                <%--<a target="_blank" href="https://github.com/ferbsx">GitHub</a>--%>
            <%--</p>--%>
            <%--</li>--%>
        <%--</ul>--%>
    <%--</div>--%>
</footer>
</html>
