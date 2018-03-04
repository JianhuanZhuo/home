package cn.keepfight.dao;

import java.util.List;

/**
 * 页查询结果集合
 * Created by tom on 2018/2/12.
 */
public class SelectPageResWithQ<T, Q> {

    /**
     * 结果集合
     */
    private List<T> resList;

    /**
     * 查询条件
     */
    private Q queryCondition;

    /**
     * 当前页，应该以 1 开始算起
     */
    private int pageCurr;

    /**
     * 总页数
     */
    private int pageTotal;

    /**
     * 每页项目数
     */
    private int itemsEachPage;

    public List<T> getResList() {
        return resList;
    }

    public void setResList(List<T> resList) {
        this.resList = resList;
    }

    public Q getQueryCondition() {
        return queryCondition;
    }

    public void setQueryCondition(Q queryCondition) {
        this.queryCondition = queryCondition;
    }

    public int getPageCurr() {
        return pageCurr;
    }

    public void setPageCurr(int pageCurr) {
        this.pageCurr = pageCurr;
    }

    public int getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(int pageTotal) {
        this.pageTotal = pageTotal;
    }

    public int getItemsEachPage() {
        return itemsEachPage;
    }

    public void setItemsEachPage(int itemsEachPage) {
        this.itemsEachPage = itemsEachPage;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SelectPageResWithQ<?, ?> that = (SelectPageResWithQ<?, ?>) o;

        if (pageCurr != that.pageCurr) return false;
        if (pageTotal != that.pageTotal) return false;
        if (itemsEachPage != that.itemsEachPage) return false;
        if (resList != null ? !resList.equals(that.resList) : that.resList != null) return false;
        return queryCondition != null ? queryCondition.equals(that.queryCondition) : that.queryCondition == null;
    }

    @Override
    public int hashCode() {
        int result = resList != null ? resList.hashCode() : 0;
        result = 31 * result + (queryCondition != null ? queryCondition.hashCode() : 0);
        result = 31 * result + pageCurr;
        result = 31 * result + pageTotal;
        result = 31 * result + itemsEachPage;
        return result;
    }

    @Override
    public String toString() {
        return "SelectPageRes{" +
                "resList=" + resList +
                ", queryCondition=" + queryCondition +
                ", pageCurr=" + pageCurr +
                ", pageTotal=" + pageTotal +
                ", itemsEachPage=" + itemsEachPage +
                '}';
    }
}
