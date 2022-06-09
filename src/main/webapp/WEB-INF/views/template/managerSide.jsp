<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sidebars/">

    <style>
		
    </style>
    
        <!-- Custom styles for this template -->
    <link href="../resources/css/managerSide.css" rel="stylesheet">
</head>
<body>	


  <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">MANGORING</span>
    </a>
    <ul class="list-unstyled ps-0">
    
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
          회원
        </button>
        <div class="collapse show" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="../manager/list" class="link-dark rounded">회원관리</a></li>
            <li><a href="../manager/memberChange" class="link-dark rounded">회원변경관리</a></li>
            <li><a href="../manager/blackList" class="link-dark rounded">블랙리스트관리</a></li>
          </ul>
        </div>
      </li>
      
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          가게
        </button>
        <div class="collapse" id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="../manager/resList" class="link-dark rounded">가게관리</a></li>
            <li><a href="../manager/reviewList" class="link-dark rounded">리뷰신고관리</a></li>
          </ul>
        </div>
      </li>
      
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
         일반
        </button>
        <div class="collapse" id="orders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">해시태그관리</a></li>
            <li><a href="../manager/noticeList" class="link-dark rounded">공지사항관리</a></li>
          </ul>
        </div>
      </li>
      
    </ul>
  </div>

      <script src="../resources/js/managerSide.js"></script>
</body>
</html>