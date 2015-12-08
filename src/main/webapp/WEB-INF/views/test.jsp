<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="include/header.jsp" %>

<script>
$(document).ready(function() {

	var bno = 2;
    var str = "";
	
    function getAllList() {
        

        $.getJSON("/replies/all/" + bno, function(data) {
            console.log(data.length);

            $(data).each(function() {
                str += "<li data-rno='"+this.rno+"' class ='replyLi'>"
                    + this.rno + ":" + this.replytext
                    + "<button>MOD</button></li>";
            });
            $("#replies").html(str);
        });
    }

    $("#replies").on("click", ".replyLi button", function() {
        var reply = $(this).parent();

        var rno = reply.attr("data-rno");
        var replytext = reply.text();

        alert(rno + " : " + replytext);
    });


    $("#replyAddBtn").on("click", function() {
        var replyer = $("#newReplyWriter").val();
        var replytext = $("#newReplyText").val();

        $.ajax({
            type : 'post',
            url : '/replies',
            headers : {
                "Content-Type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
            },
            dataType : "text",
            data : JSON.stringify({
                bno : bno,
                replyer : replyer,
                replytext : replytext
            }),
            success : function(result) {
                if (result == 'SUCCESS') {
                    alert("등록 되었습니다.");
                    getAllList();
                }
            }
        });

    });

});
	</script>	

<section class="content">
	<h2>Ajax Test Page</h2>
	
	<div>
		<div>
			REPLYER <input type="text" name="replyer" id="newReplyWriter">
		</div>
		<div>
			REPLY TEXT <input type="text" name="replytext" id="newReplyText">
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	
	<ul id="replies">
	
	</ul>
</section>

<%@ include file="include/footer.jsp" %>