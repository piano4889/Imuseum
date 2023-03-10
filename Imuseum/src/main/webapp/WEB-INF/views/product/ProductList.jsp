<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/common/style.jspf"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="google-site-verification"
	content="IE2hToDnQFmj0qovhKUWmqnaQyMPi7QndNEDR6uoVpI">
<link rel="icon" href="/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
<link rel="stylesheet" href="common/css/ProductList.css">

<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvnLt4QUXB59ZsNU2mzaeLmPhniiV0QnE&amp;language=en"></script>
<title>Product List</title>
</head>
<body>
<c:choose>
	<c:when test="${empty member}">
		<%@include file = "/common/guestMenu.jspf" %>	
	</c:when>	
	<c:when test="${not empty member }">
		<c:if test="${member.admin eq 'ADMIN' }">
			<%@include file = "/common/adminMenu.jspf" %>
		</c:if>
		<c:if test="${member.admin eq 'NORMAL' }">
			<%@include file = "/common/MemberMenu.jspf" %>
		</c:if>
	</c:when>
</c:choose>
			<%@include file="/common/store.jspf"%>
	<noscript>
		<strong>We're sorry but D MUSEUM | DAELIM MUSEUM | ?????????????????????
			doesn't work properly without JavaScript enabled. Please enable it to
			continue.</strong>
	</noscript>
	<div id="app">
		<div id="contents">			
			<main>
				<div class="root-container">
					<div class="content-wrapper">
						<section data-v-2e8259b0="" class="sub-contents-wrap">
							<div data-v-2e8259b0="" class="sub-contents-area">
								<div data-v-2e8259b0="" class="visual-swiper-area">
									<div data-v-29410dbc="" data-v-2e8259b0="" class="swiper-area">
										<div data-v-29410dbc="" class="visual-area">
											<div data-v-29410dbc=""
												class="swiper-container swiper-container-initialized swiper-container-horizontal">
												<div class="swiper-wrapper"
													style="transition-duration: 0ms; transform: translate3d(-1589px, 0px, 0px);">
													<div data-v-29410dbc=""
														class="visual-swiper swiper-slide isDoubleBannner swiper-slide-duplicate swiper-slide-duplicate-active swiper-slide-prev"
														data-swiper-slide-index="0">
														<a data-v-29410dbc=""
															href="getProduct.do?productnum=16"><span
															data-v-29410dbc="" class="img-area"><img
																data-v-29410dbc=""
																src="imgs/20221122185052648001.jpg"
																alt="EXHIBITION</br>GOODS" class="pc"><img
																data-v-29410dbc=""
																src="imgs/20221122185052648001.jpg"
																alt="EXHIBITION</br>GOODS" class="mo"></span><strong
															data-v-29410dbc="">EXHIBITION<br>GOODS
														</strong></a>
													</div>
													<div data-v-29410dbc=""
														class="visual-swiper swiper-slide isDoubleBannner swiper-slide-active swiper-slide-duplicate-next swiper-slide-duplicate-prev"
														data-swiper-slide-index="0">
														<a data-v-29410dbc=""
															href="getProduct.do?productnum=16"><span
															data-v-29410dbc="" class="img-area"><img
																data-v-29410dbc=""
																src="imgs/20221122185052648001.jpg"
																alt="EXHIBITION</br>GOODS" class="pc"><img
																data-v-29410dbc=""
																src="imgs/20221122185052648001.jpg"
																alt="EXHIBITION</br>GOODS" class="mo"></span><strong
															data-v-29410dbc="">EXHIBITION<br>GOODS
														</strong></a>
													</div>
													<div data-v-29410dbc=""
														class="visual-swiper swiper-slide isDoubleBannner swiper-slide-duplicate swiper-slide-duplicate-active swiper-slide-next"
														data-swiper-slide-index="0">
														<a data-v-29410dbc=""
															href="getProduct.do?productnum=16"><span
															data-v-29410dbc="" class="img-area"><img
																data-v-29410dbc=""
																src="imgs/20221122185052648001.jpg"
																alt="EXHIBITION</br>GOODS" class="pc"><img
																data-v-29410dbc=""
																src="imgs/20221122185052648001.jpg"
																alt="EXHIBITION</br>GOODS" class="mo"></span><strong
															data-v-29410dbc="">EXHIBITION<br>GOODS
														</strong></a>
													</div>
												</div>
												<span class="swiper-notification" aria-live="assertive"
													aria-atomic="true"></span>
											</div>
											<!-- <div data-v-26e42198="" data-v-29410dbc=""
												class="btn-area play">
												<button data-v-26e42198="" id="btn69" type="button" class="">
													??????/?????????</button>
											</div> -->
										</div>
									</div>
									<!-- <div data-v-ea82c312="" data-v-2e8259b0=""
										class="slide-pagination-area">
										<button data-v-ea82c312="" type="button"
											class="btn-prev btn-visual-prev" tabindex="0" role="button"
											aria-label="Previous slide">prev</button>
										<div data-v-ea82c312=""
											class="visual-page-list swiper-pagination-clickable">
											<span
												class="swiper-pagination-bullet swiper-pagination-bullet-active"
												tabindex="0" role="button" aria-label="Go to slide 1"></span>
										</div>
										<button data-v-ea82c312="" type="button"
											class="btn-next btn-visual-next" tabindex="0" role="button"
											aria-label="Next slide">next</button>
									</div> -->
								</div>
								<div data-v-2e8259b0="" class="container">
									<div data-v-2e8259b0="" class="category-list">
										<ul data-v-2e8259b0="">
											<li data-v-2e8259b0=""><div data-v-2e8259b0="">
													<div data-v-2e8259b0="" class="main-prd-area">
														<a data-v-2e8259b0="" href="GoodsList.do"
															class="main-prd"><div data-v-2e8259b0=""
																class="main-img">
																<img data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="https://cdn.daelimmuseum.org/Store/StoreHome/Banner/Pc/202204/20220408115128362001.jpg"
																	alt="????????? ????????? ?????????" style="">
															</div></a>
														<!---->
													</div>
													<strong data-v-2e8259b0="" class="category-title">
														????????? ????????? ????????? </strong>
													<p data-v-2e8259b0="" class="main-txt">???????????? &amp; ???????????????
														&amp; ????????????????????? ???????????? ?????? ??? ??????, ?????? ?????? ???????????????.</p>
													<ul data-v-2e8259b0="" class="prd-list">
													<c:forEach var="list" items="${productList }" varStatus="status" begin="10" end="12">
														<li data-v-2e8259b0=""><div data-v-2e8259b0=""
																class="img-area">
																<a data-v-2e8259b0=""
																	href="getProduct.do?productnum=${list.productnum }" class=""><img
																	data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="${pageContext.request.contextPath}/imgs/${list.photo1 }"
																	alt="${list.productname }" style=""></a>
															</div>
															<div data-v-2e8259b0="" class="info-area">
																<p data-v-2e8259b0="" class="txt">${list.productname }</p>
																<span data-v-2e8259b0="" class="amount">${list.price }???</span>
															</div></li>
													</c:forEach>
													</ul>
												</div>
												<div data-v-2e8259b0="" style="display: none;">
													<!---->
												</div>
												<div data-v-2e8259b0="" style="display: none;">
													<!---->
												</div>
												<div data-v-2e8259b0="">
													<div data-v-2e8259b0="" class="main-prd-area">
														<a data-v-2e8259b0=""
															href="getProduct.do?productnum=7" class="main-prd"><div
																data-v-2e8259b0="" class="main-img">
																<img data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="https://cdn.daelimmuseum.org/Store/StoreHome/Banner/Pc/202203/20220313232116286001.jpg"
																	alt="????????? ????????? ????????? ????????????" style="">
															</div></a>
														<!---->
													</div>
													<strong data-v-2e8259b0="" class="category-title">
														????????? ????????? ????????? ???????????? </strong>
													<p data-v-2e8259b0="" class="main-txt">???????????? ????????????
														??????&amp;?????? ????????? ???????????? ?????????????????? ?????? ?????? ????????? ????????? ???????????? ???????????? ??????????????????.
													</p>
													<ul data-v-2e8259b0="" class="prd-list">
													<c:forEach var="list" items="${productList }" varStatus="status" begin="8" end="8">
														<li data-v-2e8259b0=""><div data-v-2e8259b0=""
																class="img-area">
																<a data-v-2e8259b0=""
																	href="getProduct.do?productnum=${list.productnum }" class=""><img
																	data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="${pageContext.request.contextPath}/imgs/${list.photo1 }"
																	alt="${list.productname }" style=""></a>
															</div>
															<div data-v-2e8259b0="" class="info-area">
																<p data-v-2e8259b0="" class="txt">${list.productname }</p>
																<span data-v-2e8259b0="" class="amount">${list.price }???</span>
															</div></li>
													</c:forEach>
													</ul>
												</div>
												<div data-v-2e8259b0="" style="display: none;">
													<!---->
												</div>
												<div data-v-2e8259b0="" style="display: none;">
													<!---->
												</div></li>
											<li data-v-2e8259b0=""><div data-v-2e8259b0=""
													style="display: none;">
													<!---->
												</div>
												<div data-v-2e8259b0="">
													<div data-v-2e8259b0="" class="main-prd-area">
														<a data-v-2e8259b0=""
															href="getProduct.do?productnum=8" class="main-prd"><div
																data-v-2e8259b0="" class="main-img">
																<img data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="https://cdn.daelimmuseum.org/Store/StoreHome/Banner/Pc/202210/20221020131858321001.jpg"
																	alt="??????????????? ????????? ???????????????!" style="">
															</div></a>
														<!---->
													</div>
													<strong data-v-2e8259b0="" class="category-title">
														??????????????? ????????? ???????????????! </strong>
													<p data-v-2e8259b0="" class="main-txt">??? ????????? ??????????????? ??????
														?????? ??????! ??????????????? ?????? ???????????? ???????????? ???????????? ???????????????.</p>
													<ul data-v-2e8259b0="" class="prd-list">
													<c:forEach var="list" items="${productList }" varStatus="status" begin="5" end="7">
														<li data-v-2e8259b0=""><div data-v-2e8259b0=""
																class="img-area">
																<a data-v-2e8259b0=""
																	href="getProduct.do?productnum=${list.productnum }" class=""><img
																	data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="${pageContext.request.contextPath}/imgs/${list.photo1 }"
																	alt="${list.productname }" style=""></a>
															</div>
															<div data-v-2e8259b0="" class="info-area">
																<p data-v-2e8259b0="" class="txt">${list.productname }</p>
																<span data-v-2e8259b0="" class="amount">${list.price }???</span>
															</div></li>
													</c:forEach>
													</ul>
												</div>
												<div data-v-2e8259b0="" style="display: none;">
													<!---->
												</div>
												<div data-v-2e8259b0="" style="display: none;">
													<!---->
												</div>
												<div data-v-2e8259b0="">
													<div data-v-2e8259b0="" class="main-prd-area">
														<a data-v-2e8259b0=""
															href="getProduct.do?productnum=11" class="main-prd"><div
																data-v-2e8259b0="" class="main-img">
																<img data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="https://cdn.daelimmuseum.org/Store/StoreHome/Banner/Pc/202203/20220313231423190001.jpg"
																	alt="????????? ???????????? ??? ?????? ??????" style="">
															</div></a>
														<!---->
													</div>
													<strong data-v-2e8259b0="" class="category-title">
														????????? ???????????? ??? ?????? ?????? </strong>
													<p data-v-2e8259b0="" class="main-txt">????????? ???????????? ????????? ??????
														????????? ????????? ?????? ????????? ??????. ???, ??????, ?????? ??? ????????? ??? ????????????. ????????? ?????? ??? ???????????????
														?????? ??????!</p>
													<ul data-v-2e8259b0="" class="prd-list">
													<c:forEach var="list" items="${productList }" varStatus="status" begin="4" end="4">
														<li data-v-2e8259b0=""><div data-v-2e8259b0=""
																class="img-area">
																<a data-v-2e8259b0=""
																	href="getProduct.do?productnum=${list.productnum }" class=""><img
																	data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="${pageContext.request.contextPath}/imgs/${list.photo1 }"
																	alt="${list.productname }" style=""></a>
															</div>
															<div data-v-2e8259b0="" class="info-area">
																<p data-v-2e8259b0="" class="txt">${list.productname }</p>
																<span data-v-2e8259b0="" class="amount">${list.price }???</span>
															</div></li>
													</c:forEach>
													</ul>
												</div>
												<div data-v-2e8259b0="" style="display: none;">
													<!---->
												</div></li>
											<li data-v-2e8259b0=""><div data-v-2e8259b0=""
													style="display: none;">
													<!---->
												</div>
												<div data-v-2e8259b0="" style="display: none;">
													<!---->
												</div>
												<div data-v-2e8259b0="">
													<div data-v-2e8259b0="" class="main-prd-area">
														<a data-v-2e8259b0="" href="EditionsList.do"
															class="main-prd"><div data-v-2e8259b0="" class="main-img">
																<img data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="https://cdn.daelimmuseum.org/Store/StoreHome/Banner/Pc/202203/20220313231024381001.jpg"
																	alt="????????? ????????? ????????? ????????????" style="">
															</div></a>
														<!---->
													</div>
													<strong data-v-2e8259b0="" class="category-title">
														????????? ????????? ????????? ???????????? </strong>
													<p data-v-2e8259b0="" class="main-txt">???????????? &amp;
														???????????????????????? ????????? ??? ?????? ??????????????? ????????? ????????? ???????????? ????????? ????????? ???????????????!</p>
													<ul data-v-2e8259b0="" class="prd-list">
													<c:forEach var="list" items="${productList }" varStatus="status" begin="2" end="3">
														<li data-v-2e8259b0=""><div data-v-2e8259b0=""
																class="img-area">
																<a data-v-2e8259b0=""
																	href="getProduct.do?productnum=${list.productnum }" class=""><img
																	data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="${pageContext.request.contextPath}/imgs/${list.photo1 }"
																	alt="${list.productname }" style=""></a>
															</div>
															<div data-v-2e8259b0="" class="info-area">
																<p data-v-2e8259b0="" class="txt">${list.productname }</p>
																<span data-v-2e8259b0="" class="amount">${list.price }???</span>
															</div></li>
													</c:forEach>
													</ul>
												</div>
												<div data-v-2e8259b0="" style="display: none;">
													<!---->
												</div>
												<div data-v-2e8259b0="" style="display: none;">
													<!---->
												</div>
												<div data-v-2e8259b0="">
													<div data-v-2e8259b0="" class="main-prd-area">
														<a data-v-2e8259b0=""
															href="getProduct.do?productnum=14" class="main-prd"><div data-v-2e8259b0="" class="main-img">
																<img data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="https://cdn.daelimmuseum.org/Store/StoreHome/Banner/Pc/202203/20220313231740663001.jpg"
																	alt="????????? ????????? ?????? ?????? ?????? ???" style="">
															</div></a>
														<!---->
													</div>
													<strong data-v-2e8259b0="" class="category-title">
														????????? ????????? ?????? ?????? ?????? ??? </strong>
													<p data-v-2e8259b0="" class="main-txt">??????????????? ????????? ?????????,
														????????? ??? ?????????. ????????????&amp;????????????????????? ????????? ???????????????????????? ??? ?????? ?????? ???????????? ?????????
														???????????? ???????????? ??????????????????.</p>
													<ul data-v-2e8259b0="" class="prd-list">
													<c:forEach var="list" items="${productList }" varStatus="status" begin="0" end="1">
														<li data-v-2e8259b0=""><div data-v-2e8259b0=""
																class="img-area">
																<a data-v-2e8259b0=""
																	href="getProduct.do?productnum=${list.productnum }" class=""><img
																	data-v-2fed1a9a="" data-v-2e8259b0=""
																	src="${pageContext.request.contextPath}/imgs/${list.photo1 }"
																	alt="${list.productname }" style=""></a>
															</div>
															<div data-v-2e8259b0="" class="info-area">
																<p data-v-2e8259b0="" class="txt">${list.productname }</p>
																<span data-v-2e8259b0="" class="amount">${list.price }???</span>
															</div></li>
													</c:forEach>
													</ul>
												</div></li>
										</ul>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</main>
		</div>
	</div>
	<!-- built files will be auto injected -->
</body>
<%@include file="/common/footer.jspf" %>
</html>