package com.dms.om.model;

import java.util.List;

public interface IPaginationSupport<E> {

	public abstract void setTotalCount(int count);

	public abstract int getTotalCount();

	public abstract void setIndexes(int[] indexes);

	public abstract int[] getIndexes();

	public abstract void setStartIndex(int index);

	public abstract int getStartIndex();

	public abstract int getNextIndex();

	public abstract int getPreviousIndex();

	public abstract void setPageCount();

	public abstract int getPageCount();

	public abstract int getCurrentPage();

	public abstract void setCurrentPage(int currentPage);

	public abstract int getLastIndex();

	public abstract int getPageSize();

	public abstract void setPageSize(int pageSize);

	public abstract List<E> getItems();

	public abstract void setItems(List<E> items);

	public abstract void setPageNavigations();

	public abstract int getFirstPage();

	public abstract int getPreviousPage();

	public abstract int getPage1();

	public abstract int getPage2();

	public abstract int getPage3();

	public abstract int getPage4();

	public abstract int getPage5();

	public abstract int getNextPage();

	public abstract int getLastPage();

}
