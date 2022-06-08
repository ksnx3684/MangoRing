<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table" style="text-align: center; vertical-align: middle;">
	<tr>
		<th>번호</th>
		<th>예약자</th>
		<th>아이디</th>
		<th>방문일시</th>
		<th>인원</th>
		<th>예약 상태</th>
		<th></th>
	</tr>
	<c:forEach items="${reservationVOs}" var="vo" varStatus="status">
		<tr>
			<td>${fn:length(reservationVOs) - status.index}</td>
			<td>${vo.memberVO.name}</td>
			<td>${vo.id}</td>
			<td>
				<fmt:formatDate value="${vo.reservationTime}" pattern="M월 d일 HH시 mm분"/>
			</td>
			<td>${vo.count}명</td>
			<td>
				<c:choose>
					<c:when test="${vo.visitStatus eq 0}">
						예약 완료
					</c:when>
					<c:when test="${vo.visitStatus eq 1}">
						방문 완료
					</c:when>
					<c:when test="${vo.visitStatus eq 2}">
						예약 취소
					</c:when>
					<c:otherwise>
						미방문 신고 상태
					</c:otherwise>
				</c:choose>
			</td>
			<td>				
				<c:choose>
					<c:when test="${vo.visitStatus eq 0}">
						<button type="button" class="btn btn-primary cancelBtn" data-num="${vo.reservationNum}">예약 취소</button>
					</c:when>
					<c:when test="${vo.visitStatus eq 1}">
						<button type="button" class="btn btn-primary reportBtn" data-num="${vo.reservationNum}">미방문 신고</button>
					</c:when>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>

<div class="row mt-5 justify-content-center">
	 <div class="col-3">
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link pager" href="#" data-pn="${pager.pre?pager.startNum-1:1}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    	<c:choose>
		    		<c:when test="${pager.pn eq i}">
		    			<li class="page-item active" aria-current="page">
					      <a class="page-link" href="#">${i}</a>
					    </li>
		    		</c:when>
		    		<c:otherwise>
		    			<li class="page-item"><a class="page-link pager" data-pn="${i}" href="#">${i}</a></li>
		    		</c:otherwise>
		    	</c:choose>
		    </c:forEach>
		    <li class="page-item">
		      <a class="page-link pager" href="#" data-pn="${pager.next?pager.lastNum+1:pager.lastNum}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
</div>