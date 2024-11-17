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
 * Program		: kr.co.himedia.ecommerce
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BasketSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241011165129][dhtjgml87#gmail.com][CREATE: Initial Release]
 */
package kr.co.challengefarm.front.basket.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.challengefarm.front.basket.dao.BasketDao;
import kr.co.challengefarm.front.basket.dto.BasketDto;
import kr.co.challengefarm.front.member.dto.MemberDto;

/**
 * @version 1.0.0
 * @author dhtjgml87#gmail.com
 * 
 * @since 2024-10-11
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.challengefarm.front.basket.service.BasketSrvc")
public class BasketSrvc {

	@Inject
	BasketDao basketDao;

	public MemberDto info(BasketDto basketDto) {
		return basketDao.info(basketDto);
	}
	
	public List<BasketDto> order(BasketDto basketDto) {
		return basketDao.order(basketDto);
	}
	
	public List<BasketDto> list(BasketDto basketDto) {
		return basketDao.list(basketDto);
	}
	
	@Transactional("txFront")
	public boolean update(BasketDto basketDto) {
		
		int result = basketDao.update(basketDto);
		
		if (result == 1) return true;
		else{
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}	
		//return basketDao.update(basketDto);
	}
	
	public int select(BasketDto basketDto) {
		return basketDao.select(basketDto);
	}
	
	@Transactional("txFront")
	public boolean insert(BasketDto basketDto) {
		
		int result = 0;
		
		basketDto.setSeq_bsk(basketDao.sequence());
		basketDto.setRegister(basketDto.getSeq_mbr());
		
		result += basketDao.insert(basketDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
}
