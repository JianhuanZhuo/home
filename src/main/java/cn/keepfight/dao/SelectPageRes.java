package cn.keepfight.dao;

import cn.keepfight.utils.Pair;

import java.util.List;

/**
 * 页查询结果集合
 * Created by tom on 2018/2/12.
 */
public class SelectPageRes<T> {

    /**
     * 结果集合
     */
    private List<T> resList;

    /**
     * 当前页，应该以 1 开始算起
     */
    private int pageCurr;

    /**
     * 总页数
     */
    private int pageTotal;

    /**
     * 总项目数
     */
    private int itemTotal;

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

    public int getItemTotal() {
        return itemTotal;
    }

    public void setItemTotal(int itemTotal) {
        this.itemTotal = itemTotal;
    }

    @Override
    public String toString() {
        return "SelectPageRes{" +
                "resList=" + resList +
                ", pageCurr=" + pageCurr +
                ", pageTotal=" + pageTotal +
                ", itemTotal=" + itemTotal +
                ", itemsEachPage=" + itemsEachPage +
                '}';
    }

    public boolean getLeftSpace() {
        return pageCurr - 1 > 2;
    }

    public boolean getRightSpace() {
        return pageTotal - pageCurr > 2;
    }

    public Pair<Boolean, Integer> getLeftShow1() {
        return (pageCurr - 1 > 1) ?
                new Pair<>(false, pageCurr - 1) : new Pair<>(true, 1);
    }

    public Pair<Boolean, Integer> getLeftShow2() {
        return (pageCurr - 1 > 2) ?
                new Pair<>(false, pageCurr - 2) : new Pair<>(true, 1);
    }

    public Pair<Boolean, Integer> getRightShow1() {
        return (pageTotal - pageCurr > 1) ?
                new Pair<>(false, pageCurr + 1) : new Pair<>(true, 1);
    }

    public Pair<Boolean, Integer> getRightShow2() {
        return (pageTotal - pageCurr > 2) ?
                new Pair<>(false, pageCurr + 2) : new Pair<>(true, 1);
    }

    public int getPrev() {
        return pageCurr < 2 ? 1 : pageCurr - 1;
    }

    public int getNext() {
        return pageCurr < pageTotal ? pageCurr + 1 : pageTotal;
    }

    /**
     * 计算总页数值，如果 ItemsEachPage 值未设置，则会设置 10
     */
    public void computePageTotal() {
        if (getItemTotal() < 1) {
            setPageTotal(1);
        } else {
            if (getItemsEachPage() < 1) {
                setItemsEachPage(10);
            }
            setPageTotal((getItemTotal() - 1) / getItemsEachPage() + 1);
        }
    }
}
