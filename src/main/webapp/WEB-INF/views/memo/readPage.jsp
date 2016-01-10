<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

    <!-- Realtime Scripts -->
    <script type="text/javascript" src="/resources/js/api.js"></script>
    <script src="/resources/js/realtime-client-utils.js"></script>

    <!-- CSS -->
    <link href="/resources/css/ssmemodocs.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw=="
          crossorigin="anonymous">

</head>
<body onload="onLoadStart();">
<div id="editor-container">
    <!--툴 & 이름 들어가는 곳-->
    <div id="tools">
        <!--이름 들어가는 곳-->
        <div id="name">
            <h2>이름 들어가야함</h2>
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
    // lib 변수
    var manager = new editManager();
    var clickOn = 1;
    var imageID = 1;
    var focusID = 1;
    var ratioOn = 0;
    var temp = 30;
    var diagramID = 1;
    var imageID = 0;
    var diagramName = new Array();
    var focusDiagram = 0;
    var dragFlag = 0;
    var dragStart = 0;
    var aliveD = new Array();
    var x1, x2, y1, y2;
    var ml, mt, mw, mh;
    var diagramID = 1;
    var maxTextNum = 100;
    var focusText = 0;
    var textOn = 1;
    var fontSizeArr = ["8", "8", "10", "12", "14", "18", "24", "36"];
    var aliveT = new Array();
    var allElement = [];
    var dragFlag = 0;

    var Request = function () {
        this.getParameter = function (name) {
            var rtnval = "";
            var nowAddress = unescape(location.href);
            var parameters = (nowAddress.slice(nowAddress.indexOf("?") + 1, nowAddress.length)).split("&");

            for (var i = 0; i < parameters.length; i++) {
                var varName = parameters[i].split("=")[0];
                if (varName.toUpperCase() == name.toUpperCase()) {
                    rtnval = parameters[i].split("=")[1];
                    break;
                }
            }
            return rtnval;
        }
    }

    var request = new Request();

    // 처음 시작될 때 저장된 정보가 있으면 불러오는 함수
    var loadElement = ${saveVO.save_info};

//    console.log(loadInfo);
    function onLoadStart() {
        if (loadElement != null) {
            loadElementFunc();
        }
    }

    $('.dragview').hide();
    manager.initMethod();

    $(document).ready(function () {
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
        $("#add-slide").on("click", function () {
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
            });
        });
        $("#add-slide").trigger("click");
        manager.changePage(1, 1);
        $(".thumbnail-container").addClass("click");

        // 저장 버튼 클릭 시 디비에 insert or update
        $("#save").on("click", function () {
            updateElement();
            manager.save(JSON.stringify(allElement), request.getParameter("id"));
            loadElementFunc();
        });


    });

    function updateElement()
    {
        for(var i=0;i<allElement.length;i++)
        {
            if(allElement[i].dName!="text")
            {
                var element = document.getElementById("ad" + allElement[i].id);

                allElement[i].il = element.style.left.split('px')[0];
                console.log(allElement[i].il);
                allElement[i].it = element.style.top.split('px')[0];
                allElement[i].iw = element.style.width.split('px')[0];
                allElement[i].ih = element.style.height.split('px')[0];
            }
            else
            {
                var element = document.getElementById("dt" + allElement[i].id);
                allElement[i].il = element.style.left.split('px')[0];
                allElement[i].it = element.style.top.split('px')[0];

                var element = document.getElementById("t" + allElement[i].id);
                allElement[i].iw = element.style.width.split('px')[0];
                allElement[i].ih = element.style.height.split('px')[0];
            }
        }
    }
    function loadElementFunc()
    {
        for(var i=0;i<loadElement.length;i++)
        {
            diagramID = loadElement[i].id;
            diagramName[diagramID] = loadElement[i].dName;
            mw = loadElement[i].iw;
            mh = loadElement[i].ih;
            ml = loadElement[i].il;
            mt = loadElement[i].it;
            //console.log("loadE : "+String(mw)+" , " +String(mh)+" , " +String(ml)+" , " +String(mt));
            createElement(diagramID, diagramName[diagramID], mw, mh, ml, mt,loadElement[i].page,true);
        }
    }

    function addMouseEvents() {
        //'.body-content'
        $('.show').on('mousedown', function (e) {
            console.log('mousedown1');
            if (dragFlag) {
                console.log('mousedown2');
                x1 = e.clientX;
                y1 = e.clientY;
                dragStart = 1;
                clickOn = 1;
            }
        });
        //'.body-content'
        $('.show').on('mousemove', function (e) {
            //console.log('mousemove1');
            if (dragStart) {
                console.log('mousemove2');
                $('.dragview').show();
                x2 = e.clientX;
                y2 = e.clientY;
                ml = (x1 < x2) ? x1 : x2;
                mw = (x1 == ml) ? x2 - x1 : x1 - x2;
                mt = (y1 < y2) ? y1 : y2;
                mh = (y1 == mt) ? y2 - y1 : y1 - y2;
                $('.dragview').css('width', mw + 'px');
                $('.dragview').css('height', mh + 'px');
                $('.dragview').offset({top: mt, left: ml});
            }
        });
        //'.body-content'
        $('.show').on('mouseleave', function () {
            console.log('mouseleave1');
            if (dragStart) {
                console.log('mouseleave2');
                mouseRelease();
            }
        });
        //'.body-content'
        $('.show').on('mouseup', function () {
            console.log('mouseup1');
            if (dragStart) {
                console.log('mouseup2');
                createElement(diagramID, diagramName[diagramID], mw, mh, ml, mt, manager.visiblePage);
                mouseRelease();
                //recodeUndo();
            }
        });
    }

    //폰트 설정
    function font_right() {
        document.execCommand('justifyright', null, false);
    }
    function font_full() {
        document.execCommand('justifyfull', null, false);
    }
    function font_senter() {
        document.execCommand('justifycenter', null, false);
    }
    function font_underline() {
        document.execCommand('underline', null, false);
    }
    function font_left() {
        document.execCommand('justifyleft', null, false);
    }
    function font_bold() {
        document.execCommand('bold', null, false);
    }
    function font_italic() {
        document.execCommand('italic', null, false);
    }

    //글자 색 바꾸는 함수.
    function clickColor(color) {
        console.log('color  : ' + color.toString());
        document.execCommand('forecolor', false, color);
    }

    var agent = {
        isMac: navigator.appVersion.indexOf('Mac') > -1,
        isMSIE: navigator.userAgent.indexOf('MSIE') > -1 || navigator.userAgent.indexOf('Trident') > -1,
        isFF: navigator.userAgent.indexOf('Firefox') > -1
    };
    // 크롬 폰트 초기화
    function initfont() {
        if ($('#text-area' + focusText).text() == '') {
            for (var i = 0; i < 3; i++) {
                document.execCommand('justifycenter', false, null);
                document.execCommand('justifyleft', false, null);
                document.execCommand("FontSize", false, "7");
                document.execCommand("FontName", false, "돋움체");
                document.execCommand("forecolor", false, "red");
            }
        }
    }
    // 핸들 숨김
    function hidehandle() {
//        for (var i = 1; i < imageID; i++) {
//            $('#d' + i).addClass("ui-resizable-autohide");
//        }
        for (var i = 1; i <= diagramID; i++) {
            $('#ad' + i).addClass("ui-resizable-autohide");
        }
    }

    function Figure(id, dName, iw, ih, il, it,showPage)
    {
        this.id = id;
        this.dName = dName;
        this.iw = iw;
        this.il = il;
        this.ih = ih;
        this.it = it;
        this.hide = false;
        this.page = showPage;
    }

    function Image(id, dName, iw, ih, il, it, src, showPage)
    {
        this.id = id;
        this.dName = dName;
        this.iw = iw;
        this.il = il;
        this.ih = ih;
        this.it = it;
        this.src = src;
        this.hide = false;
        this.page = showPage;
    }

    function Text(id, dName, iw, ih, il, it, txt, showPage)
    {
        this.id = id;
        this.dName = dName;
        this.iw = iw;
        this.il = il;
        this.ih = ih;
        this.it = it;
        this.txt = txt;
        this.hide = false;
        this.page = showPage;
    }

    // 도형 텍박 이미지 넣기
    function createElement(id, dName, iw, ih, il, it, showPage, isCopy) {
        //$('.show').css('width');
        var elem;
        if (dName == "rect") {
            aliveD[id] = 2;
            $('#canvas-'+showPage).append('<div id = "ad' + id + '" style="z-index:800;"><svg class="draggable" id ="a' + id + '" style="z-index:800;">' +
                    '<rect x = "0" width="100%" y="0" height="100%" style="stroke:#ff0000; fill:#00ff00; stroke-width:5;"></rect>' +
                    '</svg></div>');
            $('#a' + id).css('width', '100%');
            $('#a' + id).css('height', '100%');
            $('#ad' + id).css('position', 'absolute');
            $('#ad' + id).css('width', iw + 'px');
            $('#ad' + id).css('height', ih + 'px');
            if(!isCopy)
            {
                $('#ad' + id).offset({top: it, left: il});
            }
            else
            {
                $('#ad' + id).css('top', it + 'px');
                $('#ad' + id).css('left', il + 'px');
            }
            console.log("top : "+it+"  left : "+il);
            if (ratioOn)
                $('#ad' + id).resizable({ handles: "ne,nw,se,sw,s,w,n,e",
                    stop: function () {},
                    aspectRatio: true });
            else
                $('#ad' + id).resizable({ handles: "ne,nw,se,sw,s,w,n,e",
                    stop: function () {}
                });
            elem = new Figure(id, dName, iw, ih, il, it,showPage);
            setDiagram(id);
        }
        else if(dName == "line"){
            aliveD[id] = 3;
            $('#canvas-'+showPage).append('<div id = "ad' + id + '" style="z-index:800;"><svg class="draggable" id ="a' + id + '" style="z-index:800;">' +
                    '<line x1 = "0" y1="0" x2="100%" y2="100%" style="stroke:#00ff00; stroke-width:5;"></line>' +
                    '</svg></div>');
            $('#a' + id).css('width', '100%');
            $('#a' + id).css('height', '100%');
            $('#ad' + id).css('position', 'absolute');
            $('#ad' + id).css('width', iw + 'px');
            $('#ad' + id).css('height', ih + 'px');
            if(!isCopy)
            {
                $('#ad' + id).offset({top: it, left: il});
            }
            else
            {
                $('#ad' + id).css('top', it + 'px');
                $('#ad' + id).css('left', il + 'px');
            }
            if (ratioOn)
                $('#ad' + id).resizable({ handles: "ne,nw,se,sw,s,w,n,e",
                    stop: function () {}
                    , aspectRatio: true });
            else
                $('#ad' + id).resizable({ handles: "ne,nw,se,sw,s,w,n,e",
                    stop: function () {}
                });
            elem = new Figure(id, dName, iw, ih, il, it,showPage);
            setDiagram(id);
        }
        else if(dName == "circle"){
            aliveD[id] = 4;
            $('#canvas-'+showPage).append('<div id = "ad' + id + '" style="z-index:800;"><svg class="draggable" id ="a' + id + '" style="z-index:800;">' +
                    '<ellipse cx = "50%" cy="50%" rx="50%" ry="50%" style="stroke:#00ff00; fill:#0000ff stroke-width:5;"></ellipse>' +
                    '</svg></div>');
            $('#a' + id).css('width', '100%');
            $('#a' + id).css('height', '100%');
            $('#ad' + id).css('position', 'absolute');
            $('#ad' + id).css('width', iw + 'px');
            $('#ad' + id).css('height', ih + 'px');
            if(!isCopy)
            {
                $('#ad' + id).offset({top: it, left: il});
            }
            else
            {
                $('#ad' + id).css('top', it + 'px');
                $('#ad' + id).css('left', il + 'px');
            }
            if (ratioOn)
                $('#ad' + id).resizable({ handles: "ne,nw,se,sw,s,w,n,e",
                    stop: function () {}
                    , aspectRatio: true });
            else
                $('#ad' + id).resizable({ handles: "ne,nw,se,sw,s,w,n,e",
                    stop: function () {}
                });
            elem = new Figure(id, dName, iw, ih, il, it,showPage);
            setDiagram(id);
        }
        else if(dName == "text")        {
            var contents;
            if (agent.isMSIE) contents = '<p align="left"><font color="#000000" face="돋움체" ' +
                    'size="7">' +
                    '텍스트를 입력하세요' +
                    '</font></p>';
            else contents = '<div style="text-align: left;"><font color="#000000" ' +
                    'face="돋움체" fontSize="200pt">' +
                    '텍스트를 입력하세요' +
                    '</font></div>';
            textView(diagramID, contents, iw, il, it,showPage);
            elem = new Text(id, dName, iw, ih, il, it, '텍스트를 입력하세요',showPage,isCopy);
        }
        else if(dName == "image") {
            aliveD[id] = 1;
            $('#canvas-'+showPage).append('<div id ="ad' + id + '" style="z-index:800;"><img id="a' + id +
                    '" src="' +
                    'test.jpg' +
                    '"/></div>');
            $('#a' + id).css('width', '100%');
            $('#a' + id).css('height', '100%');
            $('#ad' + id).css('position', 'absolute');
            $('#ad' + id).css('width', iw + 'px');
            $('#ad' + id).css('height', ih + 'px');
            if(!isCopy)
            {
                $('#ad' + id).offset({top: it, left: il});
            }
            else
            {
                $('#ad' + id).css('top', it + 'px');
                $('#ad' + id).css('left', il + 'px');
            }
            if (ratioOn)
                $('#ad' + id).resizable({ handles: "ne,nw,se,sw,s,w,n,e",
                    stop: function () {}
                    , aspectRatio: true });
            else
                $('#ad' + id).resizable({ handles: "ne,nw,se,sw,s,w,n,e",
                    stop: function () {}
                });
            elem = new Image(id, dName, iw, ih, il, it,'test.jpg',showPage);
            setDiagram(id);
        }
        allElement.push(elem);

        console.log("createElement");
        console.log(elem);

        diagramID++;
    }

    // 버튼 리스트

    $("#rect").click(function () {
        mouseDraw();
        diagramName[diagramID] = "rect";
    });
    $("#triangle").click(function () {
        mouseDraw();
        diagramName[diagramID] = "line";
    });
    $("#circle").click(function () {
        mouseDraw();
        diagramName[diagramID] = "circle";
    });
    $("#arrow_left").click(function () {
        mouseDraw();
        diagramName[diagramID] = "image_arrow_left";
    });
    $("#arrow_right").click(function () {
        mouseDraw();
        diagramName[diagramID] = "image_arrow_right";
    });
    $("#arrow_top").click(function () {
        mouseDraw();
        diagramName[diagramID] = "image_arrow_top";
    });
    $("#arrow_bottom").click(function () {
        mouseDraw();
        diagramName[diagramID] = "image_arrow_bottom";
    });
    $("#text").click(function () {
        mouseDraw();
        diagramName[diagramID] = "text";
    });
    $("#photo").click(function () {
        mouseDraw();
        diagramName[diagramID] = "image";
//        imageadd(iw, ih, il, it, src);
    });

    //-------------------------------  도형     --------------------------------------//

    //그리기 시작
    function mouseDraw() {
        dragFlag = 1;
        $('.show').css('cursor', 'crosshair');
        $('.show').fadeTo(0, 0.5);
        console.log('fadeTo');
        for (var i = 1; i < imageID; i++) {
            $('#' + i).resizable('disable');
        }
    }

    // 정상 상태로 변함
    function mouseRelease() {
        dragFlag = 0;
        dragStart = 0;
        $('.show').fadeTo(0, 1);
        $('.show').css('cursor', '');
        $('.dragview').hide();
        for (var i = 1; i < imageID; i++) {
            $('#' + i).resizable('enable');
        }
    }
    // 도형 설정
    function setDiagram(id) {
        $('#ad' + id).css('display', 'inline-block');
        $('#ad' + id).draggable({ cursor: "move", stop: function () {
//            recodeUndo();
        } });
//        if (ratioOn) $('#a' + id).resizable({ handles: "ne,nw,se,sw,s,w,n,e", stop: function () {
////            recodeUndo();
//        }, aspectRatio: true });
//        else $('#a' + id).resizable({ handles: "ne,nw,se,sw,s,w,n,e", stop: function () {
////            recodeUndo();
//        } });

        hidehandle();
        focusID = 0;
        focusText = 0;
        focusDiagram = id;

        console.log("focus D : "+ id);

        $('#ad' + id).removeClass("ui-resizable-autohide");
        $('#ad' + id).mousedown(function () {
            clickOn = 1;
            hidehandle();
            if (textOn) deleteTextControl(0);
            $(this).removeClass("ui-resizable-autohide");
            focusID = 0;
            focusText = 0;
            focusDiagram = this.id[2];
            if (this.id[3]) focusDiagram = this.id[2] + this.id[3];
        });
    }

    //-------------------------------  도형 끝  --------------------------------------//


    function setControlColor(control,id,color)
    {
        $(control + id).css('border-color',color);
    }
    function deleteControlColor(control,id)
    {
        $(control + id).css('border-color','#000000');
    }

    // 텍스트 컨트롤 생성
    function setTextControl() {
        console.log('set : '+focusText.toString());
        textOn = 1;
        setControlColor('#text-area',focusText,'#ff0000');
//            $('#text-area' + focusText).css('border-color','#000000');
        $('#t' + focusText).resizable('enable');
        $('#dt' + focusText).draggable('enable');
        $('#toolbar' + focusText).show();

        var temp_top = parseInt($('#dt' + focusText).css('top'));
        temp_top -= parseInt($('#toolbar' + focusText).css('height'));
        $('#dt' + focusText).css('top', parseInt(temp_top));
        if (!agent.isMSIE) initfont();
    }
    // 텍스트 컨트롤 제거
    function deleteTextControl(focus) {
        console.log('delete : '+focusText.toString());
        textOn = 0;
        deleteControlColor('#text-area',focusText);
        $('#t' + focusText).resizable('disable');
        $('#dt' + focusText).draggable('disable');
//            $('#text-area' + focusText).css('border-color','#000000');
        $('#toolbar' + focusText).hide();

        var temp_top = parseInt($('#dt' + focusText).css('top'));
        temp_top += parseInt($('#toolbar' + focusText).css('height'));
        $('#dt' + focusText).css('top', parseInt(temp_top));
        if (focus != 1) focusText = 0;
    }

    function textView(id, contents, width, left, top ,showPage,isCopy) {
        $('#canvas-'+showPage).append('<div id="dt' + id + '"><div id="t' + id + '" style="width:' + width + 'px;"><div id="toolbar' + id + '"></div><div id="text-area' + id + '" class="text-area" style="border:#d3d3d3 solid 1px;"></div></div></div>');
        $('#text-area' + id).wysiwyg({ toolbar_selector: "#toolbar" + id });
        $('#text-area' + id).wysiwyg("edit", true);
        $('#text-area' + id).append(contents);

        // 드래그 허용
        $('#dt' + id).css('z-index', '1000');
        $('#dt' + id).css('display', 'inline-block');
        $('#dt' + id).css('position', 'absolute');
        if(!isCopy)
        {
            $('#dt' + id).offset({top: top, left: left});
        }
        else
        {
            $('#dt' + id).css('top', top + 'px');
            $('#dt' + id).css('left', left + 'px');
        }
        $('#dt' + id).draggable({
            cursor: "move",
            stop: function () {
////                recodeUndo();
            },
            handle: "#toolbar" + id,
            cancel: "#text-area" + id
        });

        // 리사이즈 허용
        $('#t' + id).resizable(
                { handles: "w, e",
//            cursor: "se-resize",
                    stop: function () {
////            recodeUndo();
                    },
                    minWidth: 20 }
        );

        // 텍스트 마우스 다운 이벤트
        $('#dt' + id).mousedown(function () {
            if (dragFlag) return;
            clickOn = 1;
            focusID = 0;
            focusDiagram = 0;
            hidehandle();
            if (textOn) deleteTextControl(0);
            var id = this.id.split('t');
            focusText = id[1];
            if (textOn == 0) {
                setTextControl();
                textOn = 1;
            }
        });

        // 텍스트 블록지정을 위해 추가
        $('#text-area' + id).mousedown(function () {
            if (dragFlag) return;
            $(document).unbind("mousemove");
        });

        // x축 오버플로우 hide 및 텍스트 쪼개기
        $('.text-area').css("overflow-x", "hidden");
        $('.text-area').css("white-space", "wrap");          // 자동 줄바꿈

        if (textOn) deleteTextControl(0);
        hidehandle();
        setTextControl();
        aliveT[id] = 1;
        focusText = id;
        focusID = 0;
        focusDiagram = 0;
    }
    //--------------------------------------텍스트 끝----------------------------------------------//


</script>
</body>
</html>