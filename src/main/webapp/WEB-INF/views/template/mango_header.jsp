<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

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
            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
          	<c:choose>
          		<c:when test="${not empty member}">
          			<li><a class="dropdown-item" href="/member/myPage">My Page</a></li>
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