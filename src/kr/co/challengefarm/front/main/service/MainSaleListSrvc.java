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
 * File			: SaleListSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20241002152009][hyebongssss@gmail.co.kr][CREATE: Initial Release]
 */
package kr.co.challengefarm.front.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.challengefarm.front.main.dao.MainSaleListDao;
import kr.co.challengefarm.front.main.dto.MainSaleDto;

/**
 * @version 1.0.0
 * @author hyebongssss@gmail.co.kr
 * 
 * @since 2024-10-02
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.challengefarm.front.main.service.SaleListSrvc")
public class MainSaleListSrvc {
	
	@Inject
	MainSaleListDao mainSaleListDao;
	
	public List<MainSaleDto> closingAuctionList() {
		return mainSaleListDao.closingAuctionList();
	}
	
	public MainSaleDto popularAuction() {
		return mainSaleListDao.popularAuction();
	}
	
	public List<MainSaleDto> mainSaleList(MainSaleDto mainSaleDto) {
		return mainSaleListDao.mainSaleList(mainSaleDto);
	}

}
