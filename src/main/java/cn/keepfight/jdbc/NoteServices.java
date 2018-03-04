package cn.keepfight.jdbc;

import cn.keepfight.Mapper.NoteMapper;
import cn.keepfight.dao.NoteDao;
import cn.keepfight.dao.SelectPageRes;
import cn.keepfight.utils.FXUtils;
import cn.keepfight.utils.PropertiesServices;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

/**
 * Created by 卓建欢 on 2017/11/19.
 */
public abstract class NoteServices {

    private static SqlSessionFactory factory = SqlSessionServices.getFactory();
    private static int NUM_PAGE_EACH = PropertiesServices.getInt("num.page.each", 10);

    /**
     * 添加一条新的记录
     */
    public static void insert(NoteDao dao) throws Exception {
        FXUtils.getMapper(factory, NoteMapper.class, NoteMapper::insert, dao);
    }

    /**
     * 添加一条新的记录
     */
    public static void deleteByID(int id) throws Exception {
        FXUtils.getMapper(factory, NoteMapper.class, NoteMapper::deleteByID, id);
    }

    public static List<NoteDao> selectAll() throws Exception {
        return FXUtils.getMapper(factory, NoteMapper.class, NoteMapper::selectAll);
    }

    public static NoteDao selectByID(int id) throws Exception {
        return FXUtils.getMapper(factory, NoteMapper.class, NoteMapper::selectByID, id);
    }

    public static List<NoteDao> selectByYear(int year) throws Exception {
        return FXUtils.getMapper(factory, NoteMapper.class, NoteMapper::selectByYear, year);
    }

    public static List<NoteDao> selectByTag(String tag) throws Exception {
        return FXUtils.getMapper(factory, NoteMapper.class, NoteMapper::selectByTag, "%" + tag + "%");
    }

    public static NoteDao selectByPath(String filePath) throws Exception {
        return FXUtils.getMapper(factory, NoteMapper.class, NoteMapper::selectByPath, filePath);
    }

    /**
     * 指定页查询 page 从 1 开始计数
     */
    public static List<NoteDao> selectAllByPage(int page) throws Exception {
        try (SqlSession session = factory.openSession(true)) {
            return session.getMapper(NoteMapper.class).selectAllByPage(NUM_PAGE_EACH * (page - 1), NUM_PAGE_EACH);
        }
    }

    /**
     * 指定页查询 page 从 1 开始计数
     */
    public static SelectPageRes<NoteDao> selectPage(int page) throws Exception {
        SelectPageRes<NoteDao> res = new SelectPageRes<>();
        try (SqlSession session = factory.openSession(true)) {
            res.setResList(session.getMapper(NoteMapper.class).selectAllByPage(NUM_PAGE_EACH * (page - 1), NUM_PAGE_EACH));
            res.setItemTotal(session.getMapper(NoteMapper.class).countNum());
            res.setItemsEachPage(NUM_PAGE_EACH);
            res.setPageCurr(page);
            res.computePageTotal();
        }
        return res;
    }
}
