/**
 * Created by duck on 15. 12. 3.
 */

function editManager() {
    console.log("create editManager");

    this.totalPage = 0;
    this.visiblePage;
}

editManager.prototype.initMethod = function() {
    this.initEditorSize();

}

editManager.prototype.initEditorSize = function() {

    // 미리보기 부분 setting
    var toolsHeight = $("#tools").height();
    var filmstripWidth = window.innerWidth * 0.12;
    var filmstripHeight = window.innerHeight - toolsHeight;

    $(".filmstrip").css("width", filmstripWidth + "px");
    $(".filmstrip").css("height", filmstripHeight + "px");

    // editor 부분 setting
    var editorWidth = $("#canvas-view").width() * 0.95;
    var editorHeight = $("#canvas-view").height() * 0.95;


    $("#editor").css("width", editorWidth + "px");
    $("#editor").css("height", editorHeight + "px");
}

editManager.prototype.setEditorSize = function() {

    var toolsHeight = $("#tools").height();
    var filmstripHeight = window.innerHeight - toolsHeight;

    $(".filmstrip").css("height", filmstripHeight + "px");

    var editorWidth = $("#canvas-view").width() * 0.95;
    var editorHeight = $("#canvas-view").height() * 0.95;


    $("#editor").css("width", editorWidth + "px");
    $("#editor").css("height", editorHeight + "px");

    for (var i = 1; i <= this.totalPage; i++) {
        $("#canvas- + i").css("width", editorWidth + "px");
        $("#canvas- + i").css("height", editorHeight + "px");
    }
}


editManager.prototype.setCanvas = function(pageNum) {
    var canvas = document.createElement("div");

    canvas.setAttribute("id", "canvas-" + pageNum);
    canvas.style.width = $("#editor").width() + "px";
    canvas.style.height = $("#editor").height() + "px";
    canvas.style.visibility = "hidden";
    canvas.style.position = "absolute";

    var svg = document.createElement("svg");
    svg.setAttribute("class", "dragview");
    svg.style.width = "100px";
    svg.style.height = "100px";
    svg.style.position = "absolute";
    svg.style.border = "2px solid #333";
    svg.style.zIndex = "1001";
    canvas.appendChild(svg);

    $("#editor").append(canvas);
}

// 미리보기 그려주는 부분
editManager.prototype.setThumbnails = function(pageNum) {

    // thumbnail 부분 setting
    var thumbnailWidth = $(".filmstrip").width();
    var thumbnailHeight = thumbnailWidth * 0.543;

    var thumbnailContainer = document.createElement("div");
    var pageNumber = document.createElement("div");
    var thumbnail = document.createElement("div");
    var view = document.createElement("div");

    thumbnailContainer.setAttribute("class", "thumbnail-container");
    thumbnailContainer.style.width = thumbnailWidth + "px";
    thumbnailContainer.style.height = thumbnailHeight + "px";


    pageNumber.setAttribute("id", "page-" + pageNum);
    pageNumber.innerHTML = pageNum;
    pageNumber.style.width = (thumbnailWidth * 0.15) + "px";
    pageNumber.style.float = "left";
    pageNumber.style.textAlign = "right";
    thumbnailContainer.appendChild(pageNumber);

    thumbnail.setAttribute("id", "thumbnail-" + pageNum);
    thumbnail.style.width = (thumbnailWidth * 0.85) + "px";
    thumbnail.style.float = "right";

    view.setAttribute("id", "view-" + pageNum);
    view.style.margin = "1%";
    view.style.width = ((thumbnailWidth * 0.9) * 0.85) + "px";
    view.style.height = (thumbnailHeight * 0.9) + "px";
    view.style.border = "1px solid #000000";
    view.style.backgroundColor = "rgb(255,255,255)";
    thumbnail.appendChild(view);

    thumbnailContainer.appendChild(thumbnail);

    $("#filmstrip").append(thumbnailContainer);

    this.totalPage = pageNum;
}

editManager.prototype.changePage = function(hide, vis) {
    if (hide == null) hide = 1;
    document.getElementById("canvas-" + hide).style.visibility = "hidden";
    document.getElementById("canvas-" + hide).classList.remove('show');
    document.getElementById("canvas-" + vis).style.visibility = "visible";
    document.getElementById("canvas-" + vis).classList.add('show');
    addMouseEvents();

    this.visiblePage = vis;
    $('.dragview').hide();
}

editManager.prototype.addSlide = function() {
    this.totalPage++;

    this.setThumbnails(this.totalPage);
    this.setCanvas(this.totalPage);

    $(".click").removeClass("click");
    $("#page-" + this.totalPage).parent().addClass("click");

    this.changePage(this.visiblePage, this.totalPage);
}

editManager.prototype.save = function (elements, memoId) {
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "/memo/editPage");
    document.body.appendChild(form);

    var id =document.createElement("input");
    id.setAttribute("type", "hidden");
    id.setAttribute("name", "memo_id");
    id.setAttribute("value", memoId);
    form.appendChild(id);

    var element = document.createElement("input");
    element.setAttribute("type", "hidden");
    element.setAttribute("name", "save_info");
    element.setAttribute("value", elements);
    form.appendChild(element);

    form.submit();
}
