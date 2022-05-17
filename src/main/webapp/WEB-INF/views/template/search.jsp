<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
</head>
<body>
	<form action="/search/searchResult" method="get">
		<div class="container">
			<input class="site" name="address" value="전국" readonly style="border: none; background: none; width: 110px;">
		  	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
			    지역 선택
			</button>
			<input type="text" placeholder="지역, 메뉴, 점포명 검색" name="name">
			<input type="hidden" name="star" value="0">
			<button>검색</button>
			<div class="modal fade" id="myModal">
		    	<div class="modal-dialog modal-xl">
		    		<div class="modal-content">
		    			<div class="modal-header">
		    				<h4 class="modal-title">지역 선택</h4>
		    				<button type="button" class="close" data-dismiss="modal">&times;</button>
		    			</div>
		    			<div class="modal-body">
		    				<ul class="nav nav-tabs">
    							<li class="nav-item">
      								<a class="nav-link active" data-toggle="tab" href="#전국">전국</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#서울">서울</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#부산">부산</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#인천">인천</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#대구">대구</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#대전">대전</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#광주">광주</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#울산">울산</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#경기">경기</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#강원">강원</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#충남">충남</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#충북">충북</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#경남">경남</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#경북">경북</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#전남">전남</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#전북">전북</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#제주">제주</a>
    							</li>
    							<li class="nav-item">
      								<a class="nav-link" data-toggle="tab" href="#세종">세종</a>
    							</li>
  							</ul>
							<div class="tab-content">
								<div id="전국" class="tab-pane active"><br>
									<h3>전국</h3>
									<button type="button" class="btn btn-outline-primary" value="전국">전국</button>
								</div>
								<div id="서울" class="tab-pane fade"><br>
									<h3>서울</h3>
									<button type="button" class="btn btn-outline-primary" value="서울">전체</button>
									<button type="button" class="btn btn-outline-primary" value="서울 종로구">종로구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 중구">중구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 용산구">용산구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 성동구">성동구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 광진구">광진구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 동대문구">동대문구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 중랑구">중랑구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 성북구">성북구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 강북구">강북구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 도봉구">도봉구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 노원구">노원구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 은평구">은평구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 서대문구">서대문구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 마포구">마포구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 양천구">양천구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 강서구">강서구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 구로구">구로구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 금천구">금천구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 영등포구">영등포구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 동작구">동작구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 관악구">관악구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 서초구">서초구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 강남구">강남구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 송파구">송파구</button>
									<button type="button" class="btn btn-outline-primary" value="서울 강동구">강동구</button>
								</div>
								<div id="부산" class="tab-pane fade"><br>
									<h3>부산</h3>
									<button type="button" class="btn btn-outline-primary" value="부산">전체</button>
									<button type="button" class="btn btn-outline-primary" value="부산 중구">중구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 서구">서구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 동구">동구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 영도구">영도구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 부산진구">부산진구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 동래구">동래구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 남구">남구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 북구">북구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 해운대구">해운대구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 사하구">사하구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 금정구">금정구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 강서구">강서구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 연제구">연제구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 수영구">수영구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 사상구">사상구</button>
									<button type="button" class="btn btn-outline-primary" value="부산 기장군">기장군</button>
								</div>
								<div id="인천" class="tab-pane fade"><br>
									<h3>인천</h3>
									<button type="button" class="btn btn-outline-primary" value="인천">전체</button>
									<button type="button" class="btn btn-outline-primary" value="인천 중구">중구</button>
									<button type="button" class="btn btn-outline-primary" value="인천 동구">동구</button>
									<button type="button" class="btn btn-outline-primary" value="인천 미추홀구">미추홀구</button>
									<button type="button" class="btn btn-outline-primary" value="인천 연수구">연수구</button>
									<button type="button" class="btn btn-outline-primary" value="인천 남동구">남동구</button>
									<button type="button" class="btn btn-outline-primary" value="인천 부평구">부평구</button>
									<button type="button" class="btn btn-outline-primary" value="인천 계양구">계양구</button>
									<button type="button" class="btn btn-outline-primary" value="인천 서구">서구</button>
									<button type="button" class="btn btn-outline-primary" value="인천 강화군">강화군</button>
									<button type="button" class="btn btn-outline-primary" value="인천 옹진군">옹진군</button>
								</div>
								<div id="대구" class="tab-pane fade"><br>
									<h3>대구</h3>
									<button type="button" class="btn btn-outline-primary" value="대구">전체</button>
									<button type="button" class="btn btn-outline-primary" value="대구 중구">중구</button>
									<button type="button" class="btn btn-outline-primary" value="대구 동구">동구</button>
									<button type="button" class="btn btn-outline-primary" value="대구 서구">서구</button>
									<button type="button" class="btn btn-outline-primary" value="대구 남구">남구</button>
									<button type="button" class="btn btn-outline-primary" value="대구 북구">북구</button>
									<button type="button" class="btn btn-outline-primary" value="대구 수성구">수성구</button>
									<button type="button" class="btn btn-outline-primary" value="대구 달서구">달서구</button>
									<button type="button" class="btn btn-outline-primary" value="대구 달성군">달성군</button>
								</div>
								<div id="대전" class="tab-pane fade"><br>
									<h3>대전</h3>
									<button type="button" class="btn btn-outline-primary" value="대전">전체</button>
									<button type="button" class="btn btn-outline-primary" value="대전 동구">동구</button>
									<button type="button" class="btn btn-outline-primary" value="대전 중구">중구</button>
									<button type="button" class="btn btn-outline-primary" value="대전 서구">서구</button>
									<button type="button" class="btn btn-outline-primary" value="대전 유성구">유성구</button>
									<button type="button" class="btn btn-outline-primary" value="대전 대덕구">대덕구</button>
								</div>
								<div id="광주" class="tab-pane fade"><br>
									<h3>광주</h3>
									<button type="button" class="btn btn-outline-primary" value="광주">전체</button>
									<button type="button" class="btn btn-outline-primary" value="광주 동구">동구</button>
									<button type="button" class="btn btn-outline-primary" value="광주 서구">서구</button>
									<button type="button" class="btn btn-outline-primary" value="광주 남구">남구</button>
									<button type="button" class="btn btn-outline-primary" value="광주 북구">북구</button>
									<button type="button" class="btn btn-outline-primary" value="광주 광산구">광산구</button>
								</div>
								<div id="울산" class="tab-pane fade"><br>
									<h3>울산</h3>
									<button type="button" class="btn btn-outline-primary" value="울산">전체</button>
									<button type="button" class="btn btn-outline-primary" value="울산 중구">중구</button>
									<button type="button" class="btn btn-outline-primary" value="울산 남구">남구</button>
									<button type="button" class="btn btn-outline-primary" value="울산 동구">동구</button>
									<button type="button" class="btn btn-outline-primary" value="울산 북구">북구</button>
									<button type="button" class="btn btn-outline-primary" value="울산 울주군">울주군</button>
								</div>
								<div id="경기" class="tab-pane fade"><br>
									<h3>경기</h3>
									<button type="button" class="btn btn-outline-primary" value="경기">전체</button>
									<button type="button" class="btn btn-outline-primary" value="경기 고양시">고양시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 수원시">수원시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 용인시">용인시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 과천시">과천시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 광명시">광명시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 광주시">광주시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 구리시">구리시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 군포시">군포시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 김포시">김포시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 남양주시">남양주시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 동두천시">동두천시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 부천시">부천시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 성남시">성남시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 시흥시">시흥시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 안산시">안산시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 안성시">안성시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 안양시">안양시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 양주시">양주시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 여주시">여주시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 오산시">오산시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 의왕시">의왕시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 의정부시">의정부시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 이천시">이천시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 파주시">파주시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 평택시">평택시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 포천시">포천시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 하남시">하남시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 화성시">화성시</button>
									<button type="button" class="btn btn-outline-primary" value="경기 가평군">가평군</button>
									<button type="button" class="btn btn-outline-primary" value="경기 양평군">양평군</button>
									<button type="button" class="btn btn-outline-primary" value="경기 연천군">연천군</button>
								</div>
								<div id="강원" class="tab-pane fade"><br>
									<h3>강원</h3>
									<button type="button" class="btn btn-outline-primary" value="강원">전체</button>
									<button type="button" class="btn btn-outline-primary" value="강원 강릉시">강릉시</button>
									<button type="button" class="btn btn-outline-primary" value="강원 동해시">동해시</button>
									<button type="button" class="btn btn-outline-primary" value="강원 삼척시">삼척시</button>
									<button type="button" class="btn btn-outline-primary" value="강원 속초시">속초시</button>
									<button type="button" class="btn btn-outline-primary" value="강원 원주시">원주시</button>
									<button type="button" class="btn btn-outline-primary" value="강원 춘천시">춘천시</button>
									<button type="button" class="btn btn-outline-primary" value="강원 태백시">태백시</button>
									<button type="button" class="btn btn-outline-primary" value="강원 고성군">고성군</button>
									<button type="button" class="btn btn-outline-primary" value="강원 양구군">양구군</button>
									<button type="button" class="btn btn-outline-primary" value="강원 양양군">양양군</button>
									<button type="button" class="btn btn-outline-primary" value="강원 영월군">영월군</button>
									<button type="button" class="btn btn-outline-primary" value="강원 인제군">인제군</button>
									<button type="button" class="btn btn-outline-primary" value="강원 정선군">정선군</button>
									<button type="button" class="btn btn-outline-primary" value="강원 철원군">철원군</button>
									<button type="button" class="btn btn-outline-primary" value="강원 평창군">평창군</button>
									<button type="button" class="btn btn-outline-primary" value="강원 홍천군">홍천군</button>
									<button type="button" class="btn btn-outline-primary" value="강원 화천군">화천군</button>
									<button type="button" class="btn btn-outline-primary" value="강원 횡성군">횡성군</button>
								</div>
								<div id="충남" class="tab-pane fade"><br>
									<h3>충남</h3>
									<button type="button" class="btn btn-outline-primary" value="충남">전체</button>
									<button type="button" class="btn btn-outline-primary" value="충남 계룡시">계룡시</button>
									<button type="button" class="btn btn-outline-primary" value="충남 공주시">공주시</button>
									<button type="button" class="btn btn-outline-primary" value="충남 논산시">논산시</button>
									<button type="button" class="btn btn-outline-primary" value="충남 당진시">당진시</button>
									<button type="button" class="btn btn-outline-primary" value="충남 보령시">보령시</button>
									<button type="button" class="btn btn-outline-primary" value="충남 서산시">서산시</button>
									<button type="button" class="btn btn-outline-primary" value="충남 아산시">아산시</button>
									<button type="button" class="btn btn-outline-primary" value="충남 천안시">천안시</button>
									<button type="button" class="btn btn-outline-primary" value="충남 금산군">금산군</button>
									<button type="button" class="btn btn-outline-primary" value="충남 부여군">부여군</button>
									<button type="button" class="btn btn-outline-primary" value="충남 서천군">서천군</button>
									<button type="button" class="btn btn-outline-primary" value="충남 예산군">예산군</button>
									<button type="button" class="btn btn-outline-primary" value="충남 청양군">청양군</button>
									<button type="button" class="btn btn-outline-primary" value="충남 태안군">태안군</button>
									<button type="button" class="btn btn-outline-primary" value="충남 홍성군">홍성군</button>
								</div>
								<div id="충북" class="tab-pane fade"><br>
									<h3>충북</h3>
									<button type="button" class="btn btn-outline-primary" value="충북">전체</button>
									<button type="button" class="btn btn-outline-primary" value="충북 제천시">제천시</button>
									<button type="button" class="btn btn-outline-primary" value="충북 청주시">청주시</button>
									<button type="button" class="btn btn-outline-primary" value="충북 충주시">충주시</button>
									<button type="button" class="btn btn-outline-primary" value="충북 괴산군">괴산군</button>
									<button type="button" class="btn btn-outline-primary" value="충북 단양군">단양군</button>
									<button type="button" class="btn btn-outline-primary" value="충북 보은군">보은군</button>
									<button type="button" class="btn btn-outline-primary" value="충북 영동군">영동군</button>
									<button type="button" class="btn btn-outline-primary" value="충북 옥천군">옥천군</button>
									<button type="button" class="btn btn-outline-primary" value="충북 음성군">음성군</button>
									<button type="button" class="btn btn-outline-primary" value="충북 증평군">증평군</button>
									<button type="button" class="btn btn-outline-primary" value="충북 진천군">진천군</button>
								</div>
								<div id="경남" class="tab-pane fade"><br>
									<h3>경남</h3>
									<button type="button" class="btn btn-outline-primary" value="경남">전체</button>
									<button type="button" class="btn btn-outline-primary" value="경남 창원시">창원시</button>
									<button type="button" class="btn btn-outline-primary" value="경남 거제시">거제시</button>
									<button type="button" class="btn btn-outline-primary" value="경남 김해시">김해시</button>
									<button type="button" class="btn btn-outline-primary" value="경남 밀양시">밀양시</button>
									<button type="button" class="btn btn-outline-primary" value="경남 사천시">사천시</button>
									<button type="button" class="btn btn-outline-primary" value="경남 양산시">양산시</button>
									<button type="button" class="btn btn-outline-primary" value="경남 진주시">진주시</button>
									<button type="button" class="btn btn-outline-primary" value="경남 통영시">통영시</button>
									<button type="button" class="btn btn-outline-primary" value="경남 거창군">거창군</button>
									<button type="button" class="btn btn-outline-primary" value="경남 고성군">고성군</button>
									<button type="button" class="btn btn-outline-primary" value="경남 남해군">남해군</button>
									<button type="button" class="btn btn-outline-primary" value="경남 산청군">산청군</button>
									<button type="button" class="btn btn-outline-primary" value="경남 의령군">의령군</button>
									<button type="button" class="btn btn-outline-primary" value="경남 창녕군">창녕군</button>
									<button type="button" class="btn btn-outline-primary" value="경남 하동군">하동군</button>
									<button type="button" class="btn btn-outline-primary" value="경남 함안군">함안군</button>
									<button type="button" class="btn btn-outline-primary" value="경남 함양군">함양군</button>
									<button type="button" class="btn btn-outline-primary" value="경남 합천군">합천군</button>
								</div>
								<div id="경북" class="tab-pane fade"><br>
									<h3>경북</h3>
									<button type="button" class="btn btn-outline-primary" value="경북">전체</button>
									<button type="button" class="btn btn-outline-primary" value="경북 경산시">경산시</button>
									<button type="button" class="btn btn-outline-primary" value="경북 경주시">경주시</button>
									<button type="button" class="btn btn-outline-primary" value="경북 구미시">구미시</button>
									<button type="button" class="btn btn-outline-primary" value="경북 김천시">김천시</button>
									<button type="button" class="btn btn-outline-primary" value="경북 문경시">문경시</button>
									<button type="button" class="btn btn-outline-primary" value="경북 상주시">상주시</button>
									<button type="button" class="btn btn-outline-primary" value="경북 안동시">안동시</button>
									<button type="button" class="btn btn-outline-primary" value="경북 영주시">영주시</button>
									<button type="button" class="btn btn-outline-primary" value="경북 영천시">영천시</button>
									<button type="button" class="btn btn-outline-primary" value="경북 포항시">포항시</button>
									<button type="button" class="btn btn-outline-primary" value="경북 고령군">고령군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 군위군">군위군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 봉화군">봉화군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 성주군">성주군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 영덕군">영덕군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 영양군">영양군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 예천군">예천군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 울릉군">울릉군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 울진군">울진군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 의성군">의성군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 청도군">청도군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 청송군">청송군</button>
									<button type="button" class="btn btn-outline-primary" value="경북 칠곡군">칠곡군</button>
								</div>
								<div id="전남" class="tab-pane fade"><br>
									<h3>전남</h3>
									<button type="button" class="btn btn-outline-primary" value="전남">전체</button>
									<button type="button" class="btn btn-outline-primary" value="전남 광양시">광양시</button>
									<button type="button" class="btn btn-outline-primary" value="전남 나주시">나주시</button>
									<button type="button" class="btn btn-outline-primary" value="전남 목포시">목포시</button>
									<button type="button" class="btn btn-outline-primary" value="전남 순천시">순천시</button>
									<button type="button" class="btn btn-outline-primary" value="전남 여수시">여수시</button>
									<button type="button" class="btn btn-outline-primary" value="전남 강진군">강진군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 고흥군">고흥군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 곡성군">곡성군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 구례군">구례군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 담양군">담양군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 무안군">무안군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 보성군">보성군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 신안군">신안군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 영광군">영광군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 영암군">영암군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 완도군">완도군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 장성군">장성군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 장흥군">장흥군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 진도군">진도군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 함평군">함평군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 해남군">해남군</button>
									<button type="button" class="btn btn-outline-primary" value="전남 화순군">화순군</button>
								</div>
								<div id="전북" class="tab-pane fade"><br>
									<h3>전북</h3>
									<button type="button" class="btn btn-outline-primary" value="전북">전체</button>
									<button type="button" class="btn btn-outline-primary" value="전북 군산시">군산시</button>
									<button type="button" class="btn btn-outline-primary" value="전북 김제시">김제시</button>
									<button type="button" class="btn btn-outline-primary" value="전북 남원시">남원시</button>
									<button type="button" class="btn btn-outline-primary" value="전북 익산시">익산시</button>
									<button type="button" class="btn btn-outline-primary" value="전북 전주시">전주시</button>
									<button type="button" class="btn btn-outline-primary" value="전북 정읍시">정읍시</button>
									<button type="button" class="btn btn-outline-primary" value="전북 고창군">고창군</button>
									<button type="button" class="btn btn-outline-primary" value="전북 무주군">무주군</button>
									<button type="button" class="btn btn-outline-primary" value="전북 부안군">부안군</button>
									<button type="button" class="btn btn-outline-primary" value="전북 순창군">순창군</button>
									<button type="button" class="btn btn-outline-primary" value="전북 완주군">완주군</button>
									<button type="button" class="btn btn-outline-primary" value="전북 임실군">임실군</button>
									<button type="button" class="btn btn-outline-primary" value="전북 장수군">장수군</button>
									<button type="button" class="btn btn-outline-primary" value="전북 진안군">진안군</button>
								</div>
								<div id="제주" class="tab-pane fade"><br>
									<h3>제주</h3>
									<button type="button" class="btn btn-outline-primary" value="제주">전체</button>
									<button type="button" class="btn btn-outline-primary" value="제주 제주시">제주시</button>
									<button type="button" class="btn btn-outline-primary" value="제주 서귀포시">서귀포시</button>
								</div>
								<div id="세종" class="tab-pane fade"><br>
									<h3>세종</h3>
									<button type="button" class="btn btn-outline-primary" value="세종">전체</button>
								</div>
							</div>
		    			</div>    
		    			<div class="modal-footer">
		    				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		   				 </div>
		    		</div>
		    	</div>
		  	</div>
		</div>
	</form>
	<script>
		$(document).ready(function(){
		  $(".btn-outline-primary").click(function(){
		    let select = $(this).val();
		    console.log(select);
		    $(".site").val(select);
		    $('.modal').modal("hide");
		  });
		});
	</script>
</body>
</html>