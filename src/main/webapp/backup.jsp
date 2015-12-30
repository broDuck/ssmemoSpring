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
    var scopes = 'https://www.googleapis.com/auth/drive.metadata.readonly https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/drive';

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

var app = {};

var clientId = '693226472118-29e1i2dc6v1tmgb1s62dnchd7p45f3r2.apps.googleusercontent.com';
var realtimeUtils = new utils.RealtimeUtils({ clientId: clientId });

authorize();

function authorize() {
// Attempt to authorize
realtimeUtils.authorize(function(response){
if(response.error){
realtimeUtils.authorize(function(response){
start();
}, true);
} else {
start();
}
}, false);
}

function start() {
// 만들거나 로드할 수 있다.
// id 는 URL이 아님.
gapi.drive.realtime.debug();

var id = realtimeUtils.getParam('id');
if (id) {
// Load the document id from the URL
realtimeUtils.load(id.replace('/memo/editPage/', ''), onFileLoaded, onFileInitialize);
} else {
// Create a new document, add it to the URL
realtimeUtils.createRealtimeFile('new realtime SSMemo', function(createResponse) {
window.history.pushState(null, null, '?id=' + createResponse.id);
realtimeUtils.load(createResponse.id, onFileLoaded, onFileInitialize);

});
}
}

// The first time a file is opened, it must be initialized with the
// document structure. This function will add a collaborative string
// to our model at the root.
function onFileInitialize(model) {
var filmstrip = model.create(document.getElementById('filmstrip'));

model.getRoot().set('filmstrip', filmstrip);
console.log("onFileInitialize");
}

// After a file has been initialized and loaded, we can access the
// document. We will wire up the data model to the UI.
function onFileLoaded(doc) {
app.object = doc.getModel().getRoot().get('filmstrip');
console.log("onFileLoaded");
setup();
}

function setup() {
console.log("setup");
app.object.addEventListener(gapi.drive.realtime.EventType.OBJECT_CHANGED, addThumbnail);
}

function addThumbnail(evt) {
console.log("addThumbnail");
manager.addSlide();
}

////  리얼타임 끝끝끝