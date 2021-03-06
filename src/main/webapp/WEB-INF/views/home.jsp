<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SSMemo Login Page</title>
    <script src="//code.jquery.com/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha256-KXn5puMvxCw+dAYznun+drMdG1IFl3agK0p/pqT9KAo= sha512-2e8qq0ETcfWRI4HJBzQiA3UoyFk6tbNyG+qSaIBZLyW9Xf3sWZHN/lxe9fTh1U45DpPf07yj94KsUHHWe4Yk1A==" crossorigin="anonymous"></script>

    <style type="text/css">
        @font-face {
            font-family: "BILLY ARGEL TRIAL";
            src: url("/resources/login/BILLY ARGEL TRIAL__.otf");
        }

        p { font-family: "BILLY ARGEL TRIAL"; }
    </style>

</head>
<body background="/resources/login/background.jpg" style="background-size: cover; position: relative; margin: 0px; overflow: hidden;">

<div style="margin-top: 5%; position: relative;">
    <p style="text-align: center; color: white; font-size: 15em; ">SSMemo</p>
</div>

<div style="margin-top: 10%; width: 100%;">
    <button id="authButton" class="btn btn-lg btn-default" style="background-color: rgba(255, 255, 255, 0); margin-left: 40%; width: 20%;"><span style="color: white;">Sign in with Google</span></button>
</div>
<script>
    var clientId = '693226472118-29e1i2dc6v1tmgb1s62dnchd7p45f3r2.apps.googleusercontent.com';
    var apiKey = 'AIzaSyAOuYBpXzbRNU7782XQH2FIoHin5D5CyWQ';
    var scopes = 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/plus.me';

    // Use a button to handle authentication the first time.
    function handleClientLoad() {
        gapi.client.setApiKey(apiKey);
        window.setTimeout(checkAuth,1);
    }

    function checkAuth() {
        gapi.auth.authorize({client_id: clientId, scope: scopes, immediate: true}, handleAuthResult);
    }

    function handleAuthResult(authResult) {
        var authButton = document.getElementById('authButton');

        authButton.onclick = handleAuthClick;

    }

    function handleAuthClick(event) {
        gapi.auth.authorize({client_id: clientId, scope: scopes, immediate: false}, handleAuthResult);
        doPost();
        return false;
    }

    function doPost() {
        gapi.client.load('plus', 'v1', function() {
            var request = gapi.client.plus.people.get({
                'userId' : 'me'
            });
            request.execute(function(resp) {
                var form = document.createElement("form");
                form.setAttribute("method", "post");
                form.setAttribute("action", "/register");
                document.body.appendChild(form);

                var email = document.createElement("input");
                email.setAttribute("type", "hidden");
                email.setAttribute("name", "user_email");
                email.setAttribute("value", resp.emails[0].value);
                form.appendChild(email);

                var name = document.createElement("input");
                name.setAttribute("type", "hidden");
                name.setAttribute("name", "user_name");
                name.setAttribute("value", resp.displayName);
                form.appendChild(name);

                var pic = document.createElement("input");
                pic.setAttribute("type", "hidden");
                pic.setAttribute("name", "user_picture");
                pic.setAttribute("value", resp.image.url);
                form.appendChild(pic);

                var ai = document.createElement("input");
                ai.setAttribute("type", "hidden");
                ai.setAttribute("name", "access_id");
                ai.setAttribute("value", resp.id);
                form.appendChild(ai);


                form.submit();
            });
        });

    }

</script>
<script src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>

</body>
</html>