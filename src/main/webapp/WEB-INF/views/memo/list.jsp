<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SSMemo</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<body class="skin-blue sidebar-mini">

<div class="wrapper">

    <header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini">SSM</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>SSMemo</b> PROJECT</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">

                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img class="user-image" alt="User Image"/>
                            <span class="hidden-xs user-name"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img class="img-circle" alt="User Image"/>

                                <p class="user-name">
                                    <small>Hello? This is SSMemo Web App!</small>
                                    환영합니다!
                                </p>
                            </li>
                            <!-- Menu Body -->

                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-right">
                                    <a href="#" id="sign-out" class="btn btn-default btn-flat">Sign out</a>
                                    <script>

                                    </script>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img class="img-circle" alt="User Image"/>

                </div>
                <div class="pull-left info">
                    <br/>

                    <p class="user-name"></p>

                </div>
            </div>
            <!-- search form -->
            <form action="#" method="get" class="sidebar-form">
            </form>
            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">MAIN MENU</li>
                <li class="treeview">
                    <a href="/memo/list">
                        <i class="fa fa-files-o"></i><span>메모보기</span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="/memo/editPage">
                        <i class="fa fa-files-o"></i><span>메모추가</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->

        <section class="content">
            <div id="thumbnails" class="row">

            </div>
        </section>
        <script type="text/javascript">
            var clientId = '693226472118-29e1i2dc6v1tmgb1s62dnchd7p45f3r2.apps.googleusercontent.com';
            var apiKey = 'AIzaSyAOuYBpXzbRNU7782XQH2FIoHin5D5CyWQ';
            var scopes = 'https://www.googleapis.com/auth/drive.metadata.readonly https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/drive';
            var files;

            function handleClientLoad() {
                gapi.client.setApiKey(apiKey);
                window.setTimeout(checkAuth, 1);
            }

            function checkAuth() {
                gapi.auth.authorize({client_id: clientId, scope: scopes, immediate: true}, handleAuthResult);
            }

            function handleAuthResult(authResult) {
                if (authResult && !authResult.error) {
                    settingUser();
                    loadDriveApi();
                } else {
                    alert("로그인 하지 않으셨군요! 로그인 페이지로 이동합니다.");
                    location.href = "http://www.broduck.com";
                }
            }

            function settingUser() {
                gapi.client.load('plus', 'v1', function () {
                    var request = gapi.client.plus.people.get({
                        'userId': 'me'
                    });
                    request.execute(function (resp) {

                        var image = document.getElementsByClassName("img-circle");
                        var image2 = document.getElementsByClassName("user-image");

                        for (var i = 0; i < image.length; i++) {
                            image[i].src = resp.image.url;
                        }

                        image2[0].src = resp.image.url;

                        var userName = document.getElementsByClassName("user-name");

                        for (var i = 0; i < userName.length; i++) {
                            userName[i].innerHTML += resp.displayName;
                        }

                    });

                });
            }

            $("#sign-out").on("click", function () {
                console.log("sign out");
                gapi.auth.signOut();
                window.location.replace("/");
            });


            // google drive api

            function loadDriveApi() {
                gapi.client.load('drive', 'v2', listFiles);
            }

            function listFiles() {
                var request = gapi.client.drive.files.list({
                    'orderBy': 'modifiedDate',
                    'q': "title contains 'new'"
                });

                request.execute(function (resp) {
                    files = resp.items;

                    if (files && files.length > 0) {
                        for (var i = files.length - 1; i >= 0; i--) {
                            var file = files[i];
                            createThumbnails(file.id, file.thumbnailLink, file.title, file.createdDate, file.modifiedDate);
                        }
                    } else {
                        console.log("no files...");
                        $("#thumbnails").innerText = "empty";
                    }
                });
            }

            function createThumbnails(id, src, title, cd, md) {
                var a = document.createElement("a");
                a.setAttribute("href", "/memo/editPage?id=" + id);

                var outerDiv = document.createElement("div");
                outerDiv.classList.add("col-sm-3");
                outerDiv.classList.add("col-md-2");
                outerDiv.classList.add("col-lg-2");
                a.appendChild(outerDiv);

                var thumbnail = document.createElement("div");
                thumbnail.classList.add("thumbnail");
                outerDiv.appendChild(thumbnail);

                var img = document.createElement("img");
                if (src == null) {
                    src = "/resources/dist/img/25-2duck.gif";
                }
                img.setAttribute("src", src);
                img.setAttribute("alt", "Generic placeholder thumbnail");
                thumbnail.appendChild(img);

                var caption = document.createElement("div");
                caption.classList.add("caption");
                thumbnail.appendChild(caption);

                var h4 = document.createElement("h4");
                if (title.length > 12) {
                    title = title.substring(0, 12) + "...";
                }
                h4.innerHTML = title;
                caption.appendChild(h4);

                var createDate = document.createElement("p");
                createDate.innerHTML = "생성일 : " + cd.substring(0, 10);
                caption.appendChild(createDate);

                var modifyDate = document.createElement("p");
                modifyDate.innerHTML = "수정일 : " + md.substring(0, 10);
                caption.appendChild(modifyDate);

                $("#thumbnails").append(a);
            }

        </script>

        <script src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>

<%@ include file="../include/footer.jsp" %>

