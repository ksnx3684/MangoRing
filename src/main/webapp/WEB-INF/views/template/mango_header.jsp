<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="p-3 mb-3 border-bottom">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 me-5 text-dark text-decoration-none">
          <i class="bi bi-apple"></i>
        </a>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-auto">
          <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
        </form>

        <ul class="nav col-12 col-lg-auto me-lg-5 mb-2 justify-content-center mb-md-0">
          <li><a href="#" class="nav-link px-2 link-secondary">Overview</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">Inventory</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">Customers</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">Products</a></li>
        </ul>

        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
            <c:choose>
            	<c:when test="${empty member || membermember.memberFileVO eq null}">
            		<img src="/resources/upload/member/default_profile.png" alt="photo" width="32" height="32" class="rounded-circle">
            	</c:when>
				<c:otherwise>
					<img src="/resources/upload/member/${member.memberFileVO.fileName}" alt="photo" width="32" height="32" class="rounded-circle">
				</c:otherwise>
            </c:choose>
          </a>
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
          	<c:choose>
          		<c:when test="${not empty member}">
          			<li><a class="dropdown-item" href="/member/myPage">My Page</a></li>
          			<c:if test="${member.userType eq 3}">
          				<li><a class="dropdown-item" href="#">관리자 페이지</a></li>
          			</c:if>
		            <li><hr class="dropdown-divider"></li>
          			<li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>
          		</c:when>
          		<c:otherwise>
		            <li><a class="dropdown-item" href="/member/login">로그인</a></li>
          		</c:otherwise>
          	</c:choose>
          </ul>
        </div>
      </div>
    </div>
</header>