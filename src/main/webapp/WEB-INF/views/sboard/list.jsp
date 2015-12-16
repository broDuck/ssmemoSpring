<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ $("select option:selected").val()
									+ "&keyword=" + $("#keywordInput").val();
						});

				$('#newBtn').on("click", function(evt) {
					self.location = "register";
				});
			});
</script>

<section class="content">
	<div class="box-body">
		
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
		<button type="button" class="btn btn-default" aria-label="Left Align" id="searchBtn">Search
  			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		</button>
		<button id="newBtn" class="btn btn-primary">New Board</button>
	</div>

	<table class="table table-bordered">
		<tr>
			<th style="width: 80px">번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>수정일</th>
			<th style="width: 40px">VIEW</th>
		</tr>

		<c:forEach items="${list}" var="boardVO">
			<tr>
				<td>${boardVO.bno}</td>
				<td><a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a></td>
				<td>${boardVO.writer}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
						value="${boardVO.regdate}" /></td>
				<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
			</tr>
		</c:forEach>
	</table>

	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx?'class = active':'' }"/>>
					<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>