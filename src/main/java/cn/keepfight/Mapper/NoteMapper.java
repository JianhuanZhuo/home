package cn.keepfight.Mapper;

import cn.keepfight.dao.NoteDao;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 笔记数据库映射器
 * <p>
 * Created by tom on 2018/2/11.
 */
public interface NoteMapper {

    void insert(NoteDao dao) throws Exception;

    void deleteByID(int id) throws Exception;

    List<NoteDao> selectAll() throws Exception;

    NoteDao selectByID(int id) throws Exception;

    List<NoteDao> selectByYear(int year) throws Exception;

    List<NoteDao> selectByTag(String tag) throws Exception;

    NoteDao selectByPath(String path) throws Exception;

    /**
     * 选择首页的指定页
     */
    List<NoteDao> selectAllByPage(
            @Param("page") int page,
            @Param("eachPage") int eachPage) throws Exception;

    /**
     * 查询数量总数
     */
    int countNum() throws Exception;
}
