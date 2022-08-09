package com.dosirak31.mypage.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.mypage.review.dao.MypageReviewDao;
import com.dosirak31.mypage.review.vo.MypageReviewVO;

import lombok.Setter;

@Service
public class MypageReviewServiceImpl implements MypageReviewService {

	@Setter(onMethod_ = @Autowired)
	private MypageReviewDao mypageReviewDao;

	// 마이페이지 회원정보 구현
	@Override
	public List<MypageReviewVO> mypageList(MypageReviewVO mrvo) {
		List<MypageReviewVO> list = null;
		list = mypageReviewDao.mypageList(mrvo);
		return list;
	}
	
	// 마이페이지 리뷰 목록 구현
	@Override
	public List<MypageReviewVO> mypageReviewList(MypageReviewVO mrvo) {
		List<MypageReviewVO> reviewlist = null;
		reviewlist = mypageReviewDao.mypageReviewList(mrvo);	
		return reviewlist;
	}

	// 마이페이지 리뷰 삭제 
	@Override
	public int mypageReviewDelete(MypageReviewVO mrvo) {
		int result = 0;
		result = mypageReviewDao.mypageReviewDelete(mrvo.getReview_no());
		return result;
	}
	
	// 마이페이지 리뷰 상세페이지
	@Override
	public MypageReviewVO mypageReviewDetail(MypageReviewVO mrvo) {
		MypageReviewVO detail = null;
		
		detail = mypageReviewDao.mypageReviewDetail(mrvo);
		if(detail != null) {
			detail.setReview_contents(detail.getReview_contents().toString().replaceAll("\n", "<br />"));
		}
		
		return detail;
	}
	
	// 마이페이지 업데이트 폼
	@Override
	public MypageReviewVO updateForm(MypageReviewVO mrvo) {
		MypageReviewVO detail = null;
		detail = mypageReviewDao.mypageReviewDetail(mrvo);
		return detail;
	}
	
	// 마이페이지 리뷰 수정
	@Override
	public int mypageReviewUpdate(MypageReviewVO mrvo) {
		int result = 0;
		result = mypageReviewDao.mypageReviewUpdate(mrvo);
		return result;
	}

	// 전체 레코드수 구현
	@Override
	public int mypageReviewListCnt(MypageReviewVO mrvo) {
		return mypageReviewDao.mypageReviewListCnt(mrvo);
	}

	
	
	//마이페이지 리뷰 수정
	/*@Override
	public int mypagefoodReviewUpdate(MypageReviewVO mrvo) {
		int result = 0;
		result = mypageReviewDao.mypagefoodReviewUpdate(mrvo);
		return result;
	}
	
	// 리뷰 수정 폼
	@Override
	public MypageReviewVO updateForm(MypageReviewVO mrvo) {
		MypageReviewVO detail = null;
		detail = mypageReviewDao.mypagefoodReviewDetail(mrvo);
		return detail;
	}
	
	//마이페이지 리뷰 삭제
	@Override
	public int mypagefoodReviewDelete(int review_no) {
		int result = 0;
		result = mypageReviewDao.foodReviewDelete(mrvo.getReview_no());
		return result;
	}
	
	//마이페이지 리뷰 전체 레코드 수
	@Override
	public int mypagefoodReviewListCnt(MypageReviewVO mrvo) {
		return mypageReviewDao.mypagefoodReviewListCnt(mrvo);
	}
	
	//마이페이지 리뷰 삭제
	@Override
	public int mypagefoodReviewDelete(MypageReviewVO mrvo) {
		int result =0;
		result = mypageReviewDao.mypagefoodReviewDelete(mrvo.getReview_no());
		return result;
	}*/

}
