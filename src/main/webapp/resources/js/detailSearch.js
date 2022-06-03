var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.56646, 126.98121), // 지도의 중심좌표
        level: 5, // 지도의 확대 레벨
        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
    };

// 지도를 생성한다
var map = new kakao.maps.Map(mapContainer, mapOption);
/*var loca;*/

function locationLoadSuccess(pos){
    // 현재 위치 받아오기
    var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);

    // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
    map.panTo(currentPos);

    // 마커 생성
    var marker = new kakao.maps.Marker({
        position: currentPos
    });

    // 기존에 마커가 있다면 제거
    marker.setMap(null);
    marker.setMap(map);
    
    
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    
    function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    // getLng()는 경도, getLat()는 위도를 반환
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);       
	}
	
	// 콜백 함수를 실행합니다
	var callback = function(result, status){
		if(status === kakao.maps.services.Status.OK){
			$(".city").val(result[0].address.region_1depth_name + ' ' + result[0].address.region_2depth_name);
		}
	}
	
	// 법정동 상세 주소 정보를 요청하는 함수를 실행합니다
	searchDetailAddrFromCoords(currentPos, callback);
    
/*    loca = currentPos;
    console.log(loca);*/
};

function locationLoadError(pos){
    alert('위치 정보를 가져오는데 실패했습니다.');
};

// 위치 가져오기 버튼 클릭시
function getCurrentPosBtn(){
    navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
};


/*// 검색 버튼 클릭시
function search(){
	var distance = $("input[name='distance']:checked").val();
	
	// 장소 검색 객체를 생성합니다
    var places = new kakao.maps.services.Places();
    
    // 콜백 함수 실행
    var callback = function(result, status){
		if (status === kakao.maps.services.Status.OK) {
        console.log(result);
		}
	}
	
	// 옵션
		var searchOption = {
			location: loca,
			radius: distance
		}
		
	places.keywordSearch($("#menu"), callback, searchOption);

}*/
