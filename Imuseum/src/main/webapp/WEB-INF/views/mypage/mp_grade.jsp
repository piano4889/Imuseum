<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>νμλ±κΈ</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {accent-color: black;}
	.bt {
		width:180px;
		height:40px;
		border: 1px solid black;
		background-color: white;
	}
	.dateBtn {
		width:100px;
		height:40px;
		border: 1px solid black;
		background-color: white;
	}
	.boldBorder:after {
		content: "";
		display: block;
		width: 100%;
		border-bottom: 3px solid black;
		margin-top : 15px;
	}
	li a {
		font-size: 0.9em;
		color : gray;
	}
	li a:hover { color : black; list-style : none; }
	#mp_grade {color: black;}
	.myGrade {
		background-color: black;
		color:white;
		width:250px;
		height:35px;
		padding:5px;
		margin:10px 5px 0px 0px;
		text-align:center;
	}
	.bar > ul {
		margin-left: 0px;
		padding-left:0px;
	}
	.exStartBar::before {
	    display: block;
	    bottom: 0;
	    left: 0;
	    width: 50px;
	    height: 1rem;
	    background: #111;
	    content: '';
	}
	.artStartBar::before {
	    display: block;
	    bottom: 0;
	    left: 0;
	    width: 3px;
	    height: 1rem;
	    background: #111;
	    content: '';
	}
	.bar > ul > li {
		width : 100%;
		height : 0.2px;
		background-color: lightgray;
		list-style: none;
		float:left;
		margin-left: 0px;
		padding-left:0px;
	}
	.treeGoal {
		font-weight: bold;
		padding-left:200px;
	}
	.forestGoal {
		font-weight: bold;
		float:right;
	}
	.equilateral-triangle {
		width: 0px;
        height: 0px;
        border-right: 5px solid transparent;
        border-left: 5px solid transparent;
        border-top: 10px solid black;
        margin-top:0px;
        padding:0px;
	}
	.mpName {
		font-size:1.2em;
		font-weight: bold;
	}
	li a {
		font-size: 0.9em;
		color : gray;
	}
	li a:hover { color : black; list-style : none; }
	#mp_grade {color: black;}
</style>
</head>
<body>
	<%@include file = "/common/MemberMenu.jspf" %>
	<%@include file = "/common/main.jspf" %>
	<div class="container-fluid notosanskr">
		<div class="row"  style="padding: 0;">
			<!-- μ¬μ΄λ λ€λΉλ° -->
			<div class="col-2 offset-1">
			<%@include file ="/common/mypageNav.jspf" %>
			</div>
			
			<!-- μ»¨νμΈ  -->
			<div class="col-8">
				<!-- row div μμ -->
				<div class="row">
				
					<!-- body μμ -->
					<div class="container-fluid mt-5">
						<h5 style="font-weight:bold;" class="boldBorder">λμ νμλ±κΈ</h5>
						<div class="py-4 border-bottom">
							<div class="row">
								<div class="col-2 offset-1">
									<c:if test="${member.grade eq 'SEED'}">
										<span><img alt="seed" src="/Imuseum/common/img/seed.png" width="70px"></span>
									</c:if>
									<c:if test="${member.grade eq 'TREE'}">
										<span><img alt="seed" src="/Imuseum/common/img/tree.png" width="70px"></span>
									</c:if>
									<c:if test="${member.grade eq 'FOREST'}">
										<span><img alt="seed" src="/Imuseum/common/img/forest.png" width="70px"></span>
									</c:if>
								</div>
								<div class="col-4">
									<span style="font-size:22px;">${member.name }λμ νμ¬ λ±κΈμ <strong>${member.grade }</strong>μλλ€.<br></span>
									<span style="font-size:12px;">${member.name }λμ λ€μ λ±κΈμ TREEμλλ€.</span>
								</div>
							</div>
						</div>
						
						<!--  -->
						<div class="py-4">
							<h5 style="font-weight:bold;">λ€μ λ±κΈ λ―Έμ</h5>
							<strong>λ―Έμ μν κΈ°κ° 2022.01.01 ~ 2023.12.31</strong><br>
							<span>β» λ¬μ±νμ  λ―Έμμ λ―Έμ μν κΈ°κ° μ΄ν 1μ 2μΌ κΈ°μ€μΌλ‘ λ°μλ©λλ€.</span>
						</div>
						
						<!--  -->
						<div>
							<table class="row pb-3">
								<tbody class="col-6">
									<tr>
										<th>μ μ κ΄λ/κ΅μ‘/μ΄λ²€νΈ νλ‘κ·Έλ¨</th>
									</tr>
									<tr>
										<td>TREE : μ μ κ΄λ/κ΅μ‘/μ΄λ²€νΈ νλ‘κ·Έλ¨ μ°Έμ¬ 3ν μ΄μ<br>FOREST : μ μ κ΄λ/κ΅μ‘/μ΄λ²€νΈ νλ‘κ·Έλ¨ μ°Έμ¬ 5ν μ΄μ</td>
									</tr>
									<tr>
										<td>
											<div class="myGrade">
												<strong>TREE</strong>&nbsp;λ±κΈκΉμ§ <strong>2ν</strong>&nbsp;λ¨μμ΄μ!
											</div>
											<div class="equilateral-triangle">
												
											</div>
											<div class="bar">
												<ul>
													<li>
														<span class="barBottom"></span>
														<span class="exStartBar"></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span class="treeGoal">TREE</span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span class="forestGoal">FOREST</span>
													</li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
								<tbody class="col-6">
									<tr>
										<th>μνΈμν</th>
									</tr>
									<tr>
										<td>TREE : μ¨ μ€νλΌμΈ λ?€μ§μμ΅ μνΈ μν λμ  κ΅¬λ§€μ‘ 10λ§μ μ΄μ<br>FOREST : μ¨ μ€νλΌμΈ λ?€μ§μμ΅ μνΈ μν λμ  κ΅¬λ§€μ‘ 20λ§μ μ΄μ</td>
									</tr>
									<tr>
										<td>
											<div class="myGrade">
												<strong>TREE</strong>&nbsp;λ±κΈκΉμ§ <strong>3ν</strong>&nbsp;λ¨μμ΄μ!
											</div>
											<div class="equilateral-triangle">
												
											</div>
											<div class="bar">
												<ul>
													<li>
														<span class="barBottom"></span>
														<span class="artStartBar"></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span class="treeGoal">TREE</span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span class="forestGoal">FOREST</span>
													</li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<hr>
						
						<!--  -->
						<div class="py-4">
							<h5 style="font-weight:bold;">λ±κΈλ³ νν</h5>
							<div style="vertical-align:center;">
								<img alt="benefit" src="/Imuseum/common/img/gradeBenefit.JPG" width="100%">
							</div>
						</div>
						
						<!--  -->
						<div class="py-4">
							<h5 style="font-weight:bold;">λ±κΈ μ°μ  μ μ±</h5>
							<div>
								<p>
									- λ±κΈ νκ° κΈ°κ°μ λ§€λ 1μ 1μΌλΆν° λ€μ ν΄ 12μ 31μΌκΉμ§μλλ€. (1μ 1μΌ μνν λ―Έμμ λ€μ ν΄ λ±κΈ νκ° μ ν©μ°λ©λλ€.)<br>
									- 2022λ 3μ 1μΌ μ΄μ  κ°μν νμμ κ²½μ° TREE λ±κΈμΌλ‘ μμνμ¬ 2023λ 12μ 31μΌκΉμ§ μ μ©λ©λλ€.<br>
									- ν΄λ©΄κ³μ  μ ν μ νμ λ±κΈμ΄ μ΄κΈ°νλ©λλ€.<br>
									- νμ λ±κΈ μ‘°μ μ λ―Έμ μν μ΄λ ₯μ λ°λΌ κΈ°μ‘΄ λ±κΈ μΉκΈ μμ μΌλ‘λΆν° 2λ ν 1μ 2μΌλΆν° μ μ©λ©λλ€. (λ¨, SEED λ±κΈμ μ κ· νμ κ°μ μμ λΆν° μ μ©)<br>
									- νμ λ±κΈμ λ§€λ 1μ 2μΌ ~ λ€μ ν΄ 12μ 31μΌκΉμ§ μ μ§λ©λλ€. (μ κ· νμμ κ²½μ° κ°μν λ€μ ν΄ 12μ 31μΌκΉμ§)
								</p>
							</div>
						</div>
						
						<!--  -->
						<div class="py-4">
							<h5 style="font-weight:bold;">ννλ³ μμΈ μ λ³΄</h5>
							<div>
								<p>
									- μ μ λλ νλ‘κ·Έλ¨ κ΄λ νμ μΉ΄μ΄νμ μ λ£ μ μ λ° νλ‘κ·Έλ¨μ ννμ¬ μ μ©λ©λλ€.<br>
									- λμΌ μ μ μ¬κ΄λ νν μ΄μ© μ μ μ κ΄λ νμλ‘ μΉ΄μ΄νλμ§ μμ΅λλ€.<br>
									- μν λμ  κ΅¬λ§€μ‘μ μ€μ  κ²°μ κΈμ‘ κΈ°μ€μΌλ‘ μ§κ³λ©λλ€.<br>
									- μν μΏ ν° κ΅¬λΆ : 1) λ?€μ§μμ΅ (μ€νλΌμΈ μ μ©), 2) μ¨λΌμΈμ€ν μ΄ (μ¨λΌμΈ μ μ©)<br>
									- λ±κΈλ³ λ°νλ μΏ ν° λ° ν μΈ ννμ ν΄λΉ λ±κΈ μ μ§κΈ°κ° μ’λ£ μ μ¬μ© μ¬λΆμ κ΄κ³μμ΄ μλ©Έλ©λλ€.<br>
									- μμΌμΏ ν°μ νμμ λ³΄μ λ±λ‘λ μμΌ κΈ°μ€ 7μΌ μ  λ°κΈλλ©°, λ°κΈμΌλ‘λΆν° 1κ°μ κ° μ¬μ© κ°λ₯ν©λλ€.<br>
									- μΏ ν°κ³Ό ν μΈννμ μ€λ³΅ μ μ©μ΄ λΆκ°ν©λλ€.<br>
									- νν, λ±κΈμ μ κΈ°μ€, λ±κΈμ‘°μ  λ± νμ μ μ±μ λ―Έμ κ΄ μ¬μ μ λ°λΌ λ³κ²½λ  μ μμ΅λλ€.
								</p>
							</div>
						</div>
						
					</div>
					<!-- body λ -->
					
				</div>
				<!-- row div λ -->
			</div>
			<!-- μ»¨νμΈ  λ -->
		</div>
	</div>
 	<%@include file="/common/footer.jspf" %>
 </body>
</html>