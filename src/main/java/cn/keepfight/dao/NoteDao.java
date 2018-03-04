package cn.keepfight.dao;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 学习笔记数据访问对象
 * Created by tom on 2018/2/9.
 */
public class NoteDao {

    private Integer id;

    /**
     * 文章标题
     */
    private String title;

    /**
     * 文件路径
     */
    private String filePath;

    /**
     * 标签列表
     */
    private String tags = "";

    /**
     * 分类路径
     */
    private String categoryPath;

    /**
     * 摘要文本
     */
    private String abs;

    /**
     * 编写日期
     */
    private Timestamp pubTime;

    /**
     * 更新日期
     */
    private Timestamp update_time = new Timestamp(System.currentTimeMillis());

    /**
     * 最后修改时间
     */
    private Timestamp lastModified;

    /**
     * 使用了 mathjax 的标志位
     */
    private Boolean mathjax;

    /**
     * 译文标志位
     */
    private Boolean trans;

    /**
     * 转发标志位
     */
    private Boolean forward;

    /**
     * TOC 需要列出序号标志位
     */
    private Boolean list_num;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public List<String> getTagsAsList() {
        if (tags == null || tags.trim().length() == 0) {
            return new ArrayList<>(1);
        }
        return Arrays.stream(tags.split("/"))
                .map(s -> {
                    try {
                        return URLDecoder.decode(s, "UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                    return null;
                })
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public void setTagsAsList(List<String> tags) {
        if (tags == null || tags.isEmpty()) {
            this.tags = "";
        } else {
            this.tags = tags.stream()
                    .filter(Objects::nonNull)
                    .map(s -> {
                        try {
                            return URLEncoder.encode(s, "UTF-8");
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }
                        return null;
                    })
                    .filter(Objects::nonNull)
                    .collect(Collectors.joining("/"));
        }
    }

    public String getCategoryPath() {
        return categoryPath;
    }

    public void setCategoryPath(String categoryPath) {
        this.categoryPath = categoryPath;
    }

    public String getAbs() {
        return abs;
    }

    public void setAbs(String abs) {
        this.abs = abs;
    }

    public Timestamp getPubTime() {
        return pubTime;
    }
//
//    public Date getPubTimeAsDate(){
//
//    }

    public void setPubTime(Timestamp pubTime) {
        if (pubTime == null) {
            pubTime = new Timestamp(System.currentTimeMillis());
        }
        this.pubTime = pubTime;
    }

    public Timestamp getLastModified() {
        return lastModified;
    }

    public void setLastModified(Timestamp lastModified) {
        this.lastModified = lastModified;
    }

    public Boolean getMathjax() {
        return mathjax;
    }

    public void setMathjax(Boolean mathjax) {
        this.mathjax = mathjax;
    }

    public Boolean getTrans() {
        return trans;
    }

    public void setTrans(Boolean trans) {
        this.trans = trans;
    }

    public Boolean getForward() {
        return forward;
    }

    public void setForward(Boolean forward) {
        this.forward = forward;
    }

    public Boolean getList_num() {
        return list_num;
    }

    public void setList_num(Boolean list_num) {
        this.list_num = list_num;
    }

    public Timestamp getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Timestamp update_time) {
        this.update_time = update_time;
    }

    @Override
    public String toString() {
        return "NoteDao{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", filePath='" + filePath + '\'' +
                ", tags=" + tags +
                ", categoryPath='" + categoryPath + '\'' +
                ", abs='" + abs + '\'' +
                ", pubTime=" + pubTime +
                ", lastModified=" + lastModified +
                ", mathjax=" + mathjax +
                ", trans=" + trans +
                ", forward=" + forward +
                ", list_num=" + list_num +
                '}';
    }

    public void setMeta(Map<String, List<String>> metaList) {
        System.out.println("metaList:" + metaList);
        if (metaList == null || metaList.isEmpty()) {
            return;
        }
        metaList.forEach((key, value) -> {
            switch (key.toLowerCase()) {
                case "title":
                    setTitle(singleLine(value));
                    break;
                case "tags":
                case "tag":
                    setTagsAsList(value);
                    break;
                case "categoryPath":
                case "categories":
                    setCategoryPath(joinStr(value, "/"));
                    break;
                case "mathjax":
                    setMathjax(boolValue(value, true));
                    break;
                case "trans":
                    setTrans(boolValue(value, false));
                    break;
                case "forward":
                    setForward(boolValue(value, false));
                    break;
                case "list_num":
                    setList_num(boolValue(value, false));
                    break;
                case "date":
                    System.out.println("value:" + value);
                    setPubTime(singleLineTime(value));
                    System.out.println("PubTime:" + getPubTime());
            }
        });
    }

    private String singleLine(List<String> value) {
        if (value != null && !value.isEmpty()) {
            return value.get(0);
        }
        return "";
    }

    private static SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy/MM/dd");
    private static SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy/MM/dd hh:mm");
    private static SimpleDateFormat dateFormat3 = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");

    private Timestamp singleLineTime(List<String> value) {
        if (value != null && !value.isEmpty()) {
            try {
                String time = value.get(0);
                time = time.replace('-', '/')
                        .replace('\\', '/');
                Date date = dateFormat1.parse(time);
                if (date != null) {
                    return new Timestamp(date.getTime());
                }
            } catch (ParseException e1) {
                try {
                    Date date = dateFormat2.parse(value.get(0));
                    if (date != null) {
                        return new Timestamp(date.getTime());
                    }
                } catch (Exception e2) {
                    // to do nothing
                    try {
                        Date date = dateFormat3.parse(value.get(0));
                        if (date != null) {
                            return new Timestamp(date.getTime());
                        }
                    } catch (Exception e3) {
                        // to do nothing
                        e3.printStackTrace();
                    }
                }
            }
        }
        return null;
    }


    private String joinStr(List<String> value, String deli) {
        String join = "";
        if (value != null && !value.isEmpty()) {
            join = value.stream()
                    .filter(Objects::nonNull)
                    .filter(s -> !s.trim().equals(""))
                    .collect(Collectors.joining(deli));
        }
        return join;
    }

    private boolean boolValue(List<String> value, boolean defaultValue) {
        boolean val = defaultValue;
        if (value != null && !value.isEmpty()) {
            try {
                val = Boolean.valueOf(value.get(0));
            } catch (Exception e) {
                // to do nothing
            }
        }
        return val;
    }

    public static NoteDao newInstance() {
        NoteDao dao = new NoteDao();
        dao.setTags("");
        dao.setCategoryPath("");
        dao.setForward(false);
        dao.setList_num(true);
        dao.setMathjax(false);
        dao.setTrans(false);
        dao.setPubTime(new Timestamp(System.currentTimeMillis()));
        dao.setAbs("");
        return dao;
    }


}
