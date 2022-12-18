<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 신청</title>
<c:import url="../template/bootstrap_css.jsp"></c:import>
<c:import url="../template/mango_header.jsp"></c:import>
</head>
<body>	

  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
    
      <div class="col-xl-9">
        <h1 class="text-center">Business Page</h1>
        <form action="./business" method="POST" enctype="multipart/form-data">
        <div class="card mt-3" style="border-radius: 15px;">
          <div class="card-body">
            <div class="row align-items-center pt-4 pb-3">
              <div class="col-md-3 ps-5">
                <h6 class="mb-0">사업자번호</h6>
              </div>
              <div class="col-md-9 pe-5">
                <input type="text" class="form-control form-control-lg" name="businessNum" />
              </div>
            </div>
            
            <hr class="mx-n3">
            
            <div class="row align-items-center pt-4 pb-3">
              <div class="col-md-3 ps-5">
                <h6 class="mb-0">상호명</h6>
              </div>
              <div class="col-md-9 pe-5">
                <input type="text" class="form-control form-control-lg" name="restaurantName" />
              </div>
            </div>
            
            <hr class="mx-n3">

            	<div class="row align-items-center py-3">
	              <div class="col-md-3 ps-5">
	                <h6 class="mb-0">가게 주소</h6>
	              </div>
	              <div class="col-md-8 pe-3">
	                <div class="input-group mb-3">
		                <input type="text" id="address" name="address" class="form-control form-control-lg" 
		                	readonly="readonly"/>
		                <button type="button" id="search" class="btn btn-outline-secondary">주소 검색</button>
	                </div>
	                
	                <div class="col-md-10 pe-2 mb-3">
	                	<input type="text" id="postCode" name="postCode" class="form-control form-control-lg" 
	                		readonly="readonly"/>
	                </div>
	                <div class="col-md-10 pe-2 mb-3">
	                	<div class="input-group">
		                	<input type="text" id="detailAddress" name="detailAddress" class="form-control form-control-lg me-4" 
		                		placeholder="상세주소"/>
		                	<input type="text" id="extraAddress" name="extraAddress" class="form-control form-control-lg" 
		                		readonly="readonly"/>
	                	</div>
	                </div>
	                <div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
	              </div>
	            </div>

            <hr class="mx-n3">

            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">
                <h6 class="mb-0">가게 정보</h6>
              </div>
              <div class="col-md-9 pe-5">
                <input type="text" class="form-control form-control-lg" name="introduction"/>
              </div>
            </div>
 <!--
            <hr class="mx-n3">
            
            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">
                <h6 class="mb-0">가게 사진</h6>
              </div>
             
              <div class="col-md-9 pe-5">
                <input class="form-control form-control-lg" id="RestPhoto" name="photo" type="file" />
                <div class="small text-muted mt-2">10MB 이하 파일을 업로드해주세요</div>
              </div>
            </div>
 -->
            <hr class="mx-n3">
            
            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">
                <h6 class="mb-0">카테고리</h6>
              </div>
              
              <div class="col-md-9 pe-5">
              	<div>
	                <input class="form-check-input" type="checkbox" name="categoryNum" value="100">
	                <label class="form-check-label me-5" for="eCheckbox1">한식</label>
	                <input class="form-check-input" type="checkbox" name="categoryNum" value="101">
	                <label class="form-check-label me-5" for="Checkbox2">양식</label>
	                <input class="form-check-input" type="checkbox" name="categoryNum" value="102">
	                <label class="form-check-label me-5" for="Checkbox3">중식</label>
	                <input class="form-check-input" type="checkbox" name="categoryNum" value="103">
	                <label class="form-check-label me-5" for="Checkbox4">일식</label>
	                <input class="form-check-input" type="checkbox" name="categoryNum" value="104">
	                <label class="form-check-label me-5" for="Checkbox5">치킨</label>
                </div>
                <div class="mt-3">
	                <input class="form-check-input" type="checkbox" name="categoryNum" value="105">
	                <label class="form-check-label me-5" for="Checkbox6">피자</label>
	                <input class="form-check-input" type="checkbox" name="categoryNum" value="106">
	                <label class="form-check-label me-5" for="Checkbox7">햄버거</label>
	                <input class="form-check-input" type="checkbox" name="categoryNum" value="107">
	                <label class="form-check-label me-5" for="Checkbox8">파스타</label>
	                <input class="form-check-input" type="checkbox" name="categoryNum" value="108">
	                <label class="form-check-label me-5" for="Checkbox9">돈가스</label>
	                <input class="form-check-input" type="checkbox" name="categoryNum" value="109">
	                <label class="form-check-label" for="Checkbox10">족발</label>
                </div>
               </div>
            </div>
                
                <hr class="mx-n3">
      
            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">
                <h6 class="mb-0">주차 가능 여부</h6>
              </div>
              <div class="col-md-9 pe-5">
                <input class="form-check-input" type="radio" id="parkingCheckYes" name="parkingCheck" value="0">
                <label class="form-check-label me-5" for="eCheckbox1">네</label>
                <input class="form-check-input" type="radio" id="parkingCheckNo" name="parkingCheck" value="1">
                <label class="form-check-label" for="Checkbox2">아니요</label>
              </div>
            </div>

            <hr class="mx-n3">
            
            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">
                <h6 class="mb-0">키즈존 여부</h6>
              </div>
              <div class="col-md-9 pe-5">
                <input class="form-check-input" type="radio" id="Checkbox1" name="kidCheck" value="0">
                <label class="form-check-label me-5" for="eCheckbox1">네</label>
                <input class="form-check-input" type="radio" id="Checkbox2" name="kidCheck" value="1">
                <label class="form-check-label" for="Checkbox2">아니요</label>
              </div>
            </div>
            
            <hr class="mx-n3">
            
            <div class="row align-items-center py-3">
              <div class="col-md-3 ps-5">
                <h6 class="mb-0">사업등록증</h6>
              </div>
              
              <div class="col-md-9 pe-5">
                <input class="form-control form-control-lg" id="formFileLg" name="file" type="file" />
                <div class="small text-muted mt-2">10MB 이하 파일을 업로드해주세요</div>
              </div>
            </div>

            <hr class="mx-n3">

            <div class="px-5 py-4 text-center">
              <button type="submit" class="btn btn-primary btn-lg">사업자 신청</button>
            </div>
          </div>
        </div>
        </form>
      </div>
    </div>
  </div>

	
<c:import url="../template/cdn_script.jsp"></c:import>
<!-- KaKaoMap -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f927ec8d2f1aa0fb9dcced47b0904408&libraries=services"></script>
</body>
<script type="text/javascript" src="../resources/js/map_search.js"></script>
<script type="text/javascript" src="../resources/js/categoryCheck.js"></script>
</html>