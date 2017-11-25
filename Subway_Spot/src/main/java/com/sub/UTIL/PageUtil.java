package com.sub.UTIL;
/*
 * �� Ŭ������ ������ �̵� ����� �����ϱ� ���ؼ� �ʿ��� 7���� ������ ����ϰ� 
 * ������� Ŭ�����̴�. 
 */
public class PageUtil {
	public int nowPage; //���� �������� ����� ����
	public int totalCount;	//�� ������ ���� 
	//���� �ΰ��� ������ �ݵ�� �������� �˷��־�� �Ѵ�. 
	
	public int listCount;	//�� ȭ�鿡 ������ ����� ����  
	public int pageGroup;	//�� ȭ�鿡 ������ ������ ��� ����
	//���� �ΰ��� ������ �����ڰ� ���ؾ� �Ѵ�. 
	
	public int totalPage;	//�� ������ �� 
	public int startPage;	//���� ������
	public int lastPage;	//������ ������ 
	
	// �������� �� Ŭ������ new ��Ű�鼭 �ʼ� ������ �˷��ֱ�� ����. 
	public PageUtil(int nowPage, int totalCount){
		this(nowPage, totalCount, 3);
	}
	//������ �Լ��� �����ε� �Ͽ� �ٸ� ����� �ʿ��ϸ� �޵��� ����. 
	public PageUtil(int nowPage, int totalCount, int listCount){

		/**
		 * ����
		 * PageUtil page = new PageUtil(nowPage, total); //������ ���������� 3���� �����ش�. 
		 * PageUtil page = new PageUtil(nowPage, total, ����); //���ϴ� ������� ��� 
		 */
		
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		// �̵��� �� �κ��� �����ؼ� ����� Ȯ���ϵ��� ����. 
		this.listCount = listCount; 
		pageGroup = 3; 
		//�Ʒ��ʿ� ���� �Լ��� �ϳ��� ȣ���ؼ� ������ 3���� ������ ����� ����.
		calcTotalPage();
		calcStartPage();
		calcLastPage();
	}
	
	
	//�� ���������� ����� �Լ� 
	private void calcTotalPage(){
		//�� ȭ�鿡 10���� ����ϱ�� �����Ƿ� 
		//�� ������ 100���̸� 10�������� �ʿ��ϰ� 
		//�� ������ 101���̸� 11�������� �ʿ��ϴ�.
		
		totalPage = (totalCount % listCount) == 0 ? (totalCount / listCount) : (totalCount/listCount)+1;
	}
	//���� �������� ����� �Լ�
	private void calcStartPage(){
		//����
		//���� �������� ���° �׷����� �˾Ƴ���
		int tempGroup = (nowPage - 1) / pageGroup +1;
		//�� �׷��� ������������ ���Ѵ�.
		startPage = (tempGroup -1)* pageGroup+1;
		
	}
	//�������������� ����� �Լ�
	private void calcLastPage(){
		//���� ������ +5 -1�� �ϸ�ȴ�. 
		lastPage = startPage + pageGroup - 1;
		
		//�ٸ� ������ �������� �� ����� �ƴ� ���� �ִ�.
		if(lastPage > totalPage){
			lastPage = totalPage; 
			
		}
		
	}
	
	
	//�� 7���� ������ view���� JSTL�� �̿��ؼ� ����ؾ� �ϹǷ� 
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getPageGroup() {
		return pageGroup;
	}
	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	
	
}
