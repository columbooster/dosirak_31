package com.dosirak31.common.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	private int startPage;//화면에서 보여지는 페이지의 시작 번호
	private int endPage;//화면에서 보여지는 페이지의 끝번호
	private boolean prev,next;//이전과 다음으로 이동한 링크의 표시 여부
	
	private int total;
	private CommonVO cvo;
	
	public PageDTO(CommonVO cvo, int total) {
		this.cvo=cvo;
		this.total=total;
		
		/*페이징의 끈번호 (endPage)구하기
		 * this.endPage=(int) (Math.ceil(페이지번소/10.0))*10; */
		 this.endPage=(int) (Math.ceil(cvo.getPageNum()/10.0))*10;
		 /*1페이지의 경우 :Math.ceil(0.1)*10=10
		  *2페이지의 경우: Math.ceil(0.2)*10=10
		  *10페이지의 경우: Math.ceil(1)*10=10
		  *11페이지의 경우:Math.ceil(1.1)*10=20
		  * */
		 
		 
		 /*페이징의 시작번호(startPage)구하기*/
		 this.startPage=this.endPage-9;
		 
		 /*끝 페이지 구하기*/
		 int realEnd=(int)(Math.ceil((total*1.0)/cvo.getAmount()));
		 
		 if(realEnd<=this.endPage) {
			 this.endPage=realEnd;
		 }
		 
		 //이전 구하기
		 this.prev=this.startPage>1;
		 
		 //다음구하기
		 this.next=this.endPage<realEnd;
	}
}
