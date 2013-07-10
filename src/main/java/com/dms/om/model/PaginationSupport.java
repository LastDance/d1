package com.dms.om.model;

import java.util.List;

//public class PaginationSupport<E> implements IPaginationSupport<E> {
public class PaginationSupport<E> {
	public final static int PAGESIZE = 30;

	private int pageSize = PAGESIZE;

	private int totalCount;

	private int currentPage;

	private int startIndex;

	private int[] indexes = new int[0];

	private int pageCount;

	private List<E> items;

	private int firstPage;

	private int previousPage;

	private int page1;

	private int page2;

	private int page3;

	private int page4;

	private int page5;

	private int nextPage;

	private int lastPage;

	public PaginationSupport(int pageSize, int startIndex) {
		setPageSize(pageSize);
		setStartIndex(startIndex);

	}

	public PaginationSupport(List<E> items, int totalCount) {
		setPageSize(PAGESIZE);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(0);

	}

	public PaginationSupport(List<E> items, int totalCount, int startIndex) {
		setPageSize(PAGESIZE);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(startIndex);

	}

	public PaginationSupport(List<E> items, int totalCount, int pageSize,
			int startIndex) {

		setPageSize(pageSize);
		setTotalCount(totalCount);
		setItems(items);
		setStartIndex(startIndex);
		setCurrentPage(startIndex);
		setPageCount();

		setPageNavigations();

	}

	public void setTotalCount(int totalCount) {
		if (totalCount > 0) {
			this.totalCount = totalCount;
			int count = totalCount / pageSize;
			if (totalCount % pageSize > 0)
				count++;
			indexes = new int[count];
			for (int i = 0; i < count; i++) {
				indexes[i] = pageSize * i;
			}
		} else {
			this.totalCount = 0;
		}
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setIndexes(int[] indexes) {
		this.indexes = indexes;
	}

	public int[] getIndexes() {
		return indexes;
	}

	public void setStartIndex(int startIndex) {
		if (totalCount <= 0)
			this.startIndex = 0;
		else if (startIndex >= totalCount)
			this.startIndex = indexes[indexes.length - 1];
		else if (startIndex < 0)
			this.startIndex = 0;
		else {
			this.startIndex = indexes[startIndex / pageSize];
		}
	}

	public int getStartIndex() {
		return startIndex;
	}

	public int getNextIndex() {
		int nextIndex = getStartIndex() + pageSize;
		if (nextIndex >= totalCount)
			return getStartIndex();
		else
			return nextIndex;
	}

	public int getPreviousIndex() {
		int previousIndex = getStartIndex() - pageSize;
		if (previousIndex < 0)
			return 0;
		else
			return previousIndex;
	}

	public void setPageCount() {
		int count = totalCount / pageSize;
		if (totalCount % pageSize > 0)
			count++;
		this.pageCount = count;
	}

	public int getPageCount() {
		return pageCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int startIndex) {
		this.currentPage = startIndex / pageSize + 1;
	}

	public int getLastIndex() {
		return indexes[indexes.length - 1];
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<E> getItems() {
		return items;
	}

	public void setItems(List<E> items) {
		this.items = items;
	}

	public void setPageNavigations() {
		firstPage = setFirstPage();
		previousPage = setPreviousPage();
		page1 = setPage1();
		page2 = setPage2();
		page3 = setPage3();
		page4 = setPage4();
		page5 = setPage5();
		nextPage = setNextPage();
		lastPage = setLastPage();
	}

	private int setFirstPage() {
		if (currentPage == 1)
			return 0;
		else
			return 1;
	}

	private int setPreviousPage() {
		if (currentPage == 1)
			return 0;
		else
			return (currentPage - 1);
	}

	private int setNextPage() {
		if (currentPage == pageCount)
			return 0;
		else
			return (currentPage + 1);
	}

	private int setLastPage() {
		if (currentPage == pageCount)
			return 0;
		else
			return pageCount;
	}

	private int setPage1() {
		if (pageCount < 6)
			return 1;
		else if (currentPage < 3)
			return 1;
		else if (currentPage == pageCount)
			return (currentPage - 4);
		else if (currentPage == pageCount - 1)
			return (currentPage - 3);
		else
			return (currentPage - 2);
	}

	private int setPage2() {
		if (pageCount < 2)
			return 0;
		else if (pageCount < 6)
			return 2;
		else if (currentPage < 3)
			return 2;
		else if (currentPage == pageCount)
			return (currentPage - 3);
		else if (currentPage == pageCount - 1)
			return (currentPage - 2);
		else
			return (currentPage - 1);
	}

	private int setPage3() {
		if (pageCount < 3)
			return 0;
		else if (pageCount < 6)
			return 3;
		else if (currentPage < 4)
			return 3;
		else if (currentPage == pageCount)
			return (currentPage - 2);
		else if (currentPage == pageCount - 1)
			return (currentPage - 1);
		else
			return (currentPage);
	}

	private int setPage4() {
		if (pageCount < 4)
			return 0;
		else if (pageCount < 6)
			return 4;
		else if (currentPage < 5)
			return 4;
		else if (currentPage == pageCount)
			return (currentPage - 1);
		else if (currentPage == pageCount - 1)
			return (currentPage);
		else
			return (currentPage + 1);
	}

	private int setPage5() {
		if (pageCount < 5)
			return 0;
		else if (pageCount < 6)
			return 5;
		else if (currentPage < 6)
			return 5;
		else if (currentPage == pageCount)
			return (currentPage);
		else if (currentPage == pageCount - 1)
			return (currentPage + 1);
		else
			return (currentPage + 2);
	}

	public int getFirstPage() {
		return firstPage;
	}

	public int getPreviousPage() {
		return previousPage;
	}

	public int getPage1() {
		return page1;
	}

	public int getPage2() {
		return page2;
	}

	public int getPage3() {
		return page3;
	}

	public int getPage4() {
		return page4;
	}

	public int getPage5() {
		return page5;
	}

	public int getNextPage() {
		return nextPage;
	}

	public int getLastPage() {
		return lastPage;
	}

}