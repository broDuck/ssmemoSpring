<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SSMemo Presentation</title>

    <!-- Scripts -->
    <script src="/resources/lib/jquery-1.11.3.min.js"></script>
    <script src='/resources/lib/jquery-1.10.2.js'></script>
    <script src='/resources/lib/jquery-1.11.3.js'></script>
    <script src='/resources/lib/jquery-2.1.1.js'></script>
    <script src='/resources/lib/wysiwyg_image.js'></script>
    <script src='/resources/lib/jquery.form.js'></script>
    <script src='/resources/lib/jquery.form.min.js'></script>
    <script src='/resources/lib/jquery.unobtrusive-ajax.js'></script>
    <script src='/resources/lib/jquery.unobtrusive-ajax.min.js'></script>
    <script src='/resources/lib/jquery.validate.js'></script>
    <script src='/resources/lib/jquery.validate.min.js'></script>
    <script src='/resources/lib/jquery.validate.unobtrusive.js'></script>
    <script src='/resources/lib/jquery.validate.unobtrusive.min.js'></script>
    <script src='/resources/lib/jquery.validate-vsdoc.js'></script>
    <script src='/resources/lib/jquery-ui.js'></script>
    <script src='/resources/lib/jquery-ui.unobtrusive-2.2.0.js'></script>
    <script src='/resources/lib/jquery-ui.unobtrusive-2.2.0.min.js'></script>
    <script src='/resources/lib/jquery-ui-1.10.0.js'></script>
    <script src='/resources/lib/jquery-ui-1.10.0.min.js'></script>
    <script src='/resources/lib/farbtastic.js'></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha256-KXn5puMvxCw+dAYznun+drMdG1IFl3agK0p/pqT9KAo= sha512-2e8qq0ETcfWRI4HJBzQiA3UoyFk6tbNyG+qSaIBZLyW9Xf3sWZHN/lxe9fTh1U45DpPf07yj94KsUHHWe4Yk1A=="
            crossorigin="anonymous"></script>

    <!-- Custom JS -->
    <script src="/resources/js/editManager.js"></script>

    <!-- CSS -->
    <link href="/resources/css/ssmemodocs.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw=="
          crossorigin="anonymous">

</head>
<body>
<div id="editor-container">
    <!--툴 & 이름 들어가는 곳-->
    <div id="tools">
        <!--이름 들어가는 곳-->
        <div id="name">
            <span style="font-size: 30px;">${memoVO.memo_name }</span>
        </div>

        <!--툴 버튼 들어가는 곳-->
        <div id="tool">
            <button class="save"><i class="material-icons">picture_as_pdf</i></button>
            <button class="add-slide"><i class="material-icons">note_add</i></button>
            <button class="redo"><i class="material-icons">redo</i></button>
            <button class="undo"><i class="material-icons">undo</i></button>
            <button class="align-left"><i class="material-icons">format_align_left</i></button>
            <button class="align-center"><i class="material-icons">format_align_center</i></button>
            <button class="align-right"><i class="material-icons">format_align_right</i></button>
            <button class="align-normal"><i class="material-icons">format_align_justify</i></button>
            <button class="text-box"><i class="material-icons">format_shapes</i></button>
            <button class="text-box"><i class="material-icons">create</i></button>
            <button class="italic"><i class="material-icons">format_italic</i></button>
            <button class="underline"><i class="material-icons">format_underlined</i></button>
            <button class="bold"><i class="material-icons">format_bold</i></button>
            <button class="font-size"><i class="material-icons">format_size</i></button>
            <button class="color"><i class="material-icons">format_color_fill</i></button>
            <button class="photo"><i class="material-icons">insert_photo</i></button>
            <button class="triangle"><i class="material-icons">change_history</i></button>
            <button class="rect"><i class="material-icons">crop_square</i></button>
            <button class="circle"><i class="material-icons">panorama_fish_eye</i></button>
            <i class="material-icons">sync</i>
            <i class="material-icons">done</i>
        </div>

    </div>

    <table id="panels">
        <tbody>
        <tr>
            <td class="filmstrip">
                <div id="filmstrip">

                </div>
            </td>
            <td id="canvas-view" style="background-color: #d9d9d9">
                <div id="editor-wrapper" style="position: relative;">
                    <div id="editor" style="background-color: #ffffff">

                    </div>
                </div>

            </td>
        </tr>
        </tbody>
    </table>
</div>

<!--script 실행 부분-->
<script>

    $(document).ready(function () {
        var manager = new editManager();
        manager.initMethod();

        $(window).resize(function () {
            manager.setEditorSize();
        });

        // mouse event 등록 // 툴 들
        $("button").hover(function () {
            $(this).addClass("mouse-in");
        }, function () {
            $(this).removeClass("mouse-in");
        });

        // 그리기 함수 호출
        $(".add-slide").on("click", function () {
            manager.addSlide();

            $(".thumbnail-container").hover(function () {
                $(this).addClass("mouse-in");
            }, function () {
                $(this).removeClass("mouse-in");
            }).on("click", function () {
                var hide = $(".click").children(0).html();
                $("div.click").removeClass("click");

                $(this).addClass("click");
                var vis = $(".click").children(0).html();
                manager.changePage(hide, vis);
                $('.dragview').hide();
            });
        });

        $(".add-slide").trigger("click");
        manager.changePage(1, 1);
        $(".thumbnail-container").addClass("click");
        $('.dragview').hide();

    });


</script>

</body>
</html>