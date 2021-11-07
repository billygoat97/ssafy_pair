<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%-- <!-- 로그인 시작 -->
	<div align="center">
      	<c:if test="${empty userinfo}">
			<a href="${root}/user/register">회원가입</a><br />
	      	<a href="${root}/user/login">로그인</a><br />
      	</c:if>
      	<c:if test="${!empty userinfo}">
			<strong>${userinfo.userName}</strong> (${userinfo.userId})님 안녕하세요.<br />
	      	<a href="${root}/user/logout">로그아웃</a><br />
	      	<c:if test="${userinfo.userId eq 'admin'}">
	      		<a href="${root}/user/list">회원목록</a><br />
	      	</c:if>
      	</c:if>
	</div>

<!-- 로그인 끝 --> --%>

<header id="header"
	class="fixed-top d-flex align-items-center header-transparent">
	<div
		class="container d-flex align-items-center justify-content-between">
		<div class="logo">
			<h1>
				<a href="index.html">HappyHouse</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
		</div>

		<nav id="navbar" class="navbar">
			<ul>
				<li><a class="nav-link scrollto" href="#cta">조회</a></li>
				<li><a class="nav-link scrollto" href="#services">공지사항</a></li>
				<li><a class="nav-link scrollto" href="#testimonials">새소식</a></li>
				<li><a class="nav-link scrollto" href="#team">팀</a></li>
				<li><a class="nav-link scrollto" href="#contact">연락처</a></li>
			</ul>
			<ul>
			</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
		<!-- .navbar -->
		<nav id="navbar" class="navbar">
			<ul>
		      	<c:if test="${empty userinfo}">
					<a href="${root}/user/register">회원가입</a><br />
			      	<a href="${root}/user/login">로그인</a><br />
	  	    	</c:if>
	    	  	<c:if test="${!empty userinfo}">
					<a href="#"><strong>${userinfo.userName}</strong> (${userinfo.userId})님 안녕하세요.</a> <br />
					<a href="${root}/user/modify">회원정보수정</a>
					<br />
					<a href="${root}/user/logout">로그아웃</a><br />
					<br />
					<a href="${root}/user/deletemember?id=${userinfo.userId}">회원탈퇴</a>
					<br />
		   		   	<c:if test="${userinfo.userId eq 'admin'}">
		    	  		<a href="${root}/user/list">회원목록</a><br />
			      	</c:if>
	     		</c:if>
			</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
		<!-- .navbar -->

	</div>
</header>

	<div class="container">
		<header id="index_header" class="jumbotron text-center mb-1">
			<h4>행복한 우리 집</h4> 
		</header>
		<!-- nav start -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark rounded">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="#">Home</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						동네 정보
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">APT 매매</a>
						<a class="dropdown-item" href="#">APT 전월세</a>
						<a class="dropdown-item" href="#">주택 매매</a>
						<a class="dropdown-item" href="#">주택 전월세</a>
						<a class="dropdown-item" href="#">상권 정보</a>
						<a class="dropdown-item" href="#">환경 정보</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="Notice">Notice</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">News</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Contact</a>
				</li>
			</ul>
		</nav>
		
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<input type = "text" id = "aptN" placeholder = "아파트명"/>
				<button type = "button" id = "aptBtn">아파트 검색</button>
				<div class="card-body">
					시도 : 
					<select id="sido">
						<option value="0">선택</option>
					</select>
					구군 : 
					<select id="gugun">
						<option value="0">선택</option>
					</select>
					읍면동 : 
					<select id="dong">
						<option value="0">선택</option>
					</select>
					<button type="button" id="aptSearchBtn">검색</button>
					<table class="table mt-2">
						<colgroup>
							<col width="100">
							<col width="150">
							<col width="*">
							<col width="120">
							<col width="120">
						</colgroup>	
						<thead>
							<tr>
								<th>번호</th>
								<th>아파트이름</th>
								<th class="text-center">주소</th>
								<th>건축연도</th>
								<th>최근거래금액</th>
							</tr>
						</thead>
						<tbody id="searchResult"></tbody>
					</table>
				<div id="map" style="width:100%;height:500px;"></div>
				<br><br><br><br><br><br><br><br><br><br><br><br>
				<h1 align = "center">웹사이트 소개</h1>
				<br><br><br><br>
				최근 아파트 거래 내역을 검색하는 웹사이트입니다.
				<br><br>
				<img alt="" src="img/apt_search.png">
				<br>
				아파트 검색창으로 검색할 수 있으며
				<br><br><br>
				<img alt="" src="img/apt_result.png">
				<br>
				검색된 결과를 리스트 형식으로 볼 수 있으며
				<br><br><br>
				<img alt="" src="img/apt_map.png">
				<br>
				지도 마커를 통해서 검색 할 수 있습니다.
				<br><br><br>
				<img alt="" src="img/apt_specific.png">
				<br>
				특정 아파트를 클릭하면 해당 아파트의 정보를 조회 할 수 있습니다.
				<br><br><br>
				<img alt="" src="img/apt_dong.png">
				<br>
				그 외에도 지역별로 검색이 가능합니다.
				
				<h1 align = "center">공지사항</h1>
				
				
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1dee2dbdc57135952ad9dcf48f314b7&libraries=services"></script>
				<script type="text/javascript" src="js/map.js"></script>
				<script type="text/javascript">
				let colorArr = ['table-primary','table-success','table-danger'];
				$(document).ready(function(){					
					$.get(root + "/map/sido"
						,function(data, status){
							$.each(data, function(index, vo) {
								$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
							});
						}
						, "json"
					);
				});
				$(document).on("change", "#sido", function() {
					$.get(root + "/map/gugun"
							,{sido: $("#sido").val()}
							,function(data, status){
								$("#gugun").empty();
								$("#gugun").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#gugun", function() {
					$.get(root + "/map/dong"
							,{gugun: $("#gugun").val()}
							,function(data, status){
								$("#dong").empty();
								$("#dong").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#dong", function() {
					$.get(root + "/map/apt"
							,{dong: $("#dong").val()}
							,function(data, status){
								console.log(data);
								$("tbody").empty();
								$.each(data, function(index, vo) {
									console.log(data);
									let str = `
										<tr class="${colorArr[index%3]}">
											<td>${vo.aptCode}</td>
											<td>${vo.aptName}</td>
											<td>${vo.sidoName} ${vo.gugunName} ${vo.dongName} ${vo.jibun}</td>
											<td>${vo.buildYear}</td>
											<td>${vo.recentPrice}</td>
										</tr>
									`;
									$("tbody").append(str);
								});
								displayMarkers(data);
							}
							, "json"
					);
				});
				$(document).on("click", "#aptBtn", function() {
					$.get(root + "/map/aptN"
							,{aptN: $("#aptN").val()}
							,function(data, status){
								console.log(data);
								$("tbody").empty();
								$.each(data, function(index, vo) {
									console.log(data);
									let str = `
										<tr class="${colorArr[index%3]}">
											<td>${vo.aptCode}</td>
											<td>${vo.aptName}</td>
											<td>${vo.sidoName} ${vo.gugunName} ${vo.dongName} ${vo.jibun}</td>
											<td>${vo.buildYear}</td>
											<td>${vo.recentPrice}</td>
										</tr>
									`;
									$("tbody").append(str);
								});
								displayMarkers(data);
							}
							, "json"
					);
				});
				
				$(document).on("click", "#aptBtn", function() {
					var param = {
							serviceKey:'dcHON0LxZwydhNdi7AwRg3raKjMBnmbGwSgMcpjJaGa7IElYQ3jMyUExnW7/4rcsYRI/h5hLl9GIVD7wAcm1Og==',
							pageNo:encodeURIComponent('1'),
							numOfRows:encodeURIComponent('100'),
							LAWD_CD:encodeURIComponent($("#gugun").val()),
							DEAL_YMD:encodeURIComponent('202110')
					};
					$.get('http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev'
							,param
							,function(data, status){
								console.log(data);
								var items = $(data).find('item');
								var jsonArray = new Array();
								items.each(function() {
									var jsonObj	= new Object();
									jsonObj.aptCode = $(this).find('일련번호').text();
									jsonObj.aptName = $(this).find('아파트').text();
									jsonObj.dongCode = $(this).find('법정동읍면동코드').text();
									//jsonObj.dongName = ;
									//jsonObj.sidoName = ;
									//jsonObj.gugunName = ;
									jsonObj.buildYear = $(this).find('건축년도').text();
									jsonObj.jibun = $(this).find('지번').text();
									jsonObj.recentPirce = $(this).find('거래금액').text();
										
									jsonObj = JSON.stringify(jsonObj);
									//String 형태로 파싱한 객체를 다시 json으로 변환
									jsonArray.push(JSON.parse(jsonObj));
								});
								console.log(jsonArray);
								//displayMarkers(jsonArray);
							}
							, "xml"
					);
					/* var xhr = new XMLHttpRequest();
					var url = 'http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev';
					var queryParams = '?' + encodeURIComponent('serviceKey') + '='+encodeURIComponent(' API KEY ');
					queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
					queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
					queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent($("#gugun").val()); 
					queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent('202110'); 
					xhr.open('GET', url + queryParams);
					xhr.onreadystatechange = function () {
					    if (this.readyState == 4) {
					    	console.log(this.responseXML);
					        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
					    }
					};

					xhr.send(''); */
				});
				</script>
				</div>
			</div>
		</section>
	</div>
</body>
</html>