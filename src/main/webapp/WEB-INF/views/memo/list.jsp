<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<script>
	
</script>

<section class="content">
	<div class="row">
		<c:forEach items="${list}" var="memoVO">
		<a href="/memo/editPage${pageMaker.makeSearch(pageMaker.cri.page)}&memo_id=${memoVO.memo_id }">
			<div class="col-sm-3 col-md-2">
				<div class="thumbnail">
					<img src="/resources/dist/img/25-2duck.gif"
						alt="Generic placeholder thumbnail">
					<div class="caption">
						<h4>${memoVO.memo_name }</h4>
						<p>생성일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${memoVO.reg_date}"/></p>
						<p>수정일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${memoVO.update_date}"/></p>
						<ul class="nav navbar-nav">
						<li class="dropdown messages-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="glyphicon glyphicon-user">members</i>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 4 members</li>
								<li>
									<!-- inner menu: contains the actual data -->
									<ul class="menu">
										<li>
											<!-- start message --> 
											<a href="#">
											<div class="pull-left">
											<img
											src="/resources/dist/img/25-2duck.gif"
											class="img-circle" alt="User Image" />
											</div>
											<h4>권정웅</h4>
											</a>
											
										</li>
										<!-- end message -->	
									</ul>
								</li>
							</ul></li></ul>
					</div>
				</div>
			</div>
			</a>
		</c:forEach>
	</div>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a
					href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }"
				var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx?'class = active':'' }"/>>
					<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a
					href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>