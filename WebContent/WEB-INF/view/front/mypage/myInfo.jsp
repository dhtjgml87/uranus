<%
/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.challengefarm
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			:
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240626130000][dhtjgml87@himedia.co.kr][CREATE: Initial Release][TODO: 정보수정 클릭시 비밀번호 확인 후 정보 변경 가능하도록]
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page info="/WEB-INF/view/front/mypage/myInfo.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<!-- bootstrap.min.css를 최상단에 놓지 않으면 화면 배율 문제 발생 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<%@ include file="/include/front/header.jsp"%>
	<link rel="stylesheet" href="/css/mypage/main.css" type="text/css">
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/mypage/modal.css" />
	<link rel="stylesheet" type="text/css" title="common stylesheet" href="/css/mypage/myInfo.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="/js/uranus/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="/js/uranus/mypage/modify_modal.js"></script>
	<script type="text/javascript" src="/js/uranus/mypage/delete_modal.js"></script>
	
	
	<style>
		.shop.spad .container > div {display: flex; align-items: flex-start;}
		
		
		@media only screen and (max-width: 991px) {
			.shop.spad .container > div {display: block;}
			article {margin-left:0px; margin-top:0px;}
		}
	</style>
</head>

<body>
	<header class="header">
		<%@ include file="/include/front/top.jsp"%>
	</header>
	
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>내 정보</h4>
						<div class="breadcrumb__links">
							<a href="/front/mypage/">마이페이지</a><span>내 기본 정보</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<%@ include file="/include/front/lnbMyPage.jsp"%>
				<article class="join">
					<form id="frmMain" name="frmMain" method="POST">
						<input type="hidden" name="_flg_sms" id="_flg_sms" value="${myInfoDto.flg_sms}" />
						<input type="hidden" name="_flg_email" id="_flg_email" value="${myInfoDto.flg_email}" />
						<div class="joinArea mt-4">
							<h4>필수 정보</h4>
							<ul class="list-group list-group-flush">
								<li class="list-group-item d-flex align-items-center" style="border: none; padding: 10px;">
									
									<label class="mb-0 me-3" style="flex: 0 0 150px;"><b>성명</b></label>
									<span>
										<i class="fas fa-user" style="margin-right: 5px;"></i>
										${myInfoDto.mbr_nm} / 
										<c:choose>
										<c:when test="${myInfoDto.gender == 'M'}">
											<span class="gender" style="color: lightblue; font-weight: bold;">
												<i class="fas fa-mars"></i> 남성
											</span>
										</c:when>
										<c:otherwise>
											<span class="gender" style="color: lightpink; font-weight: bold;">
												<i class="fas fa-venus"></i> 여성
											</span>
										</c:otherwise>
										</c:choose>
									</span>
								</li>
								
								<li class="list-group-item d-flex align-items-center" style="border: none; padding: 10px;">
									<label class="mb-0 me-3" style="flex: 0 0 150px;"><b>이메일</b></label>
									<span>
										<i class="fas fa-envelope" style="margin-right: 5px;"></i>
										${myInfoDto.email}
									</span>
								</li>
								
								<li class="list-group-item d-flex align-items-center" style="border: none; padding: 10px;">
									<label class="mb-0 me-3" style="flex: 0 0 150px;"><b>연락처</b></label>
										<span>
										<i class="fas fa-phone" style="margin-right: 5px;"></i>
										${myInfoDto.phone}
									</span>
								</li>
								
								<li class="list-group-item d-flex align-items-center" style="border: none; padding: 10px;">
									<label class="mb-0 me-3" style="flex: 0 0 150px;"><b>우편번호</b></label>
									<span>
										<i class="fas fa-map-marker-alt" style="margin-right: 5px;"></i>
										${myInfoDto.post} <br> ${myInfoDto.addr1}&nbsp;${myInfoDto.addr2}
									</span>
								</li>
							</ul>
								
							<br>
							<h4 class="mt-4">선택 정보</h4>
							<ul class="list-group list-group-flush">
								<li class="list-group-item d-flex align-items-center">
									<label class="mb-0 me-3" style="flex: 0 0 150px;"><b>마케팅 수신 동의</b></label>
									<div>
										<div class="form-check form-check-inline">
											<i class="fas fa-sms" style="margin-right: 5px;"></i>
											<label class="form-check-label" for="flg_sms">SMS</label>
											<input class="form-check-input" type="checkbox" name="flg_sms" id="flg_sms" value="Y" 
											<c:if test="${myInfoDto.flg_sms == 'Y'}"> checked="checked"</c:if> disabled style="margin-left: 10px;" />
										</div>
										<div class="form-check form-check-inline">
											<i class="fas fa-envelope" style="margin-right: 5px;"></i>
											<label class="form-check-label" for="flg_email">Email</label>
											<input class="form-check-input" type="checkbox" name="flg_email" id="flg_email" value="Y" 
											<c:if test="${myInfoDto.flg_email == 'Y'}"> checked="checked"</c:if> disabled style="margin-left: 10px;" />
										</div>
									</div>
								</li>
							</ul>
						</div>
					</form>
	
					<!-- 버튼 -->
					<div style="text-align:center;">
						<!-- 버튼: 수정하기 -->
						<button id="modifyAccountBtn" class="styled-button" style="margin-top: 50px; width: 100px; height: 50px;" data-bs-toggle="modal" data-bs-target="#modifyModal" onclick="resetModify()">수정하기</button>
						<!-- 버튼: 탈퇴하기 -->
						<button id="deleteAccountBtn" class="styled-button" style="width: 100px; height: 50px;" data-bs-toggle="modal" data-bs-target="#withdrawModal" onclick="resetDelete()">탈퇴하기</button>
					</div>
					
					<!-- 첫 번째 모달: 비밀번호 입력 -->
					<div class="modal fade" id="withdrawModal" tabindex="-1" aria-labelledby="withdrawModalLabel" aria-hidden="true">
						<div class="modal-dialog custom-modal">
							<div class="modal-content shadow-lg">
								<div class="modal-header bg-danger text-white">
									<h5 class="modal-title" id="withdrawModalLabel">
										<i class="bi bi-person-x"></i> 회원 탈퇴
									</h5>
									<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
							
								<form id="frmWithdraw" onsubmit="validatePassword_(event)">
									<div class="modal-body">
										
										<p class="text-danger">회원탈퇴시 유의사항</p>
										<p class="text">판매 또는 구매가 진행중인 상품이 없어야 합니다.<br>
										<p class="text">회원탈퇴 시 보유하고 계신 쿠폰과 포인트는 즉시 소멸되며, 동일한 아이디로 재가입 하더라도 복원되지 않습니다.
										</p>
										<p class="text-danger">탈퇴회원 회원정보 보존기간</p>
										<p class="text">회원탈퇴가 완료되더라도 판/구매자의 권익을 보호하기 위해 다음과 같이 회원정보가 일정기간 보존됨을 알려드립니다. <br>
										<p class="text">탈퇴회원의 개인정보 보관여부는 가래내역의 유무에 따라 달라집니다. <br>	
														- 거래내역 없음 : 임의해지를 방지하기 위하여 이용 계약 종료 후 6개월간 보관후 삭제 <br>
														- 거래내역 있음 : 상법에 따라 경매 낙찰내역 보존 필요에 따라 아이디와 함께 기본정보는 5~10년간 보관
										</p>
									
										<label for="withdrawPassword" class="form-label"></label>
											<input type="password" id="withdrawPassword" name="withdrawPassword" class="form-control" required placeholder="비밀번호를 입력하세요" />
											<input type="hidden" id="seq_mbr" name="seq_mbr" value="${myInfoDto.seq_mbr}" />
										<div id="error-message" class="text-danger mt-2" style="display: none;"></div> <!-- 오류 메시지 표시할 영역 -->
									</div>
									
									<div class="modal-footer justify-content-center">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-danger">확인</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				
					<!-- 두 번째 모달: 탈퇴 확인 -->
					<div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
						<div class="modal-dialog custom-modal" style="max-width: 300px;">
							<div class="modal-content border-0 shadow-lg">
								<form id="frmWithdrawal_" onsubmit="confirmDeletion(event)">
									<input type="hidden" id="confirmSeq_mbr" name="confirmSeq_mbr" value="" />
									<input type="hidden" id="confirmWithdrawPassword" name="withdrawPassword" value="" />
										<div class="modal-body text-center">
											<i class="bi bi-exclamation-triangle" style="font-size: 50px; margin-bottom: 15px; color: #e57373;"></i> <!-- 경고 아이콘 -->
											<p class="text-black" style="font-size: 1.3rem;">정말로 탈퇴하시겠어요?</p>
											<p class="text-black">탈퇴 버튼 선택 시, 계정은 <br> 삭제되며 복구되지 않습니다.</p>
										</div>
									<div class="modal-footer flex-column align-items-center" style="width: 100%;">
										<button type="submit" class="btn w-100" style="background-color: #e57373; color: white; border: none; border-radius: 0.5rem; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">탈퇴</button>
										<button type="button" class="btn w-100 mb-2" data-bs-dismiss="modal" style="background-color: #f0f0f0; color: black; border: none;">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					
					<!-- 모달 -->
					<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modifyModalLabel" aria-hidden="true">
						<div class="modal-dialog custom-modal">
							<div class="modal-content border-0 shadow-lg">
								<div class="modal-header custom-bg text-white" style="border-bottom: 2px solid #C0C0C0;">
									<h5 class="modal-title" id="modifyModalLabel">
										<i class="bi bi-pencil-fill"></i> 회원정보 수정
									</h5>
										<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								
								<form id="frmWithdrawal" action="/front/front/modifyProc.web" method="POST" onsubmit="validatePassword(event)">
									<input type="hidden" name="seq_mbr" value="${myInfoDto.seq_mbr}" />
										<div class="modal-body">
											<p>회원님의 소중한 정보를 지키기 위해 <br> 비밀번호 확인 후 수정 페이지로 이동합니다.</p>
											<div class="mb-3">
												<input type="password" id="password" name="confirmPasswd" class="form-control" placeholder="비밀번호를 입력하세요" required />
												<div id="passwordError" class="text-danger mt-2" style="display:none;">비밀번호가 올바르지 않습니다. 다시 입력해 주세요.</div>
											</div>
										</div>
									<div class="modal-footer justify-content-center">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn" id="confirmModify">확인</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</article>
			</div>
		</div>
	</section>

	<footer>
		<%@ include file="/include/common/footer.jsp"%>
	</footer>
</body>
</html>