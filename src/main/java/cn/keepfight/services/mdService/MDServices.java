package cn.keepfight.services.mdService;

import cn.keepfight.dao.NoteDao;
import cn.keepfight.jdbc.NoteServices;
import cn.keepfight.utils.PropertiesServices;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringEscapeUtils;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * MD 文件高级接口
 * Created by tom on 2018/2/11.
 */
public class MDServices {
    private static MDServices instance = new MDServices();

    public static MDServices getInstance() {
        return instance;
    }

    private List<NoteDao> noteDaos;

    private boolean compileAll = false;

    private MDServices() {
    }

    private MDServices(boolean compileAll) {
        this.compileAll = compileAll;
    }

    public void updateDB() throws IOException {
        try {
            noteDaos = NoteServices.selectAll();
        } catch (Exception e) {
            throw new IOException(e);
        }
    }

    public List<String> xx(boolean compileAll) throws Exception {
        this.compileAll = compileAll;
        return xx();
    }


    public List<String> xx() throws Exception {
        Path sourcePath = Paths.get(Objects.requireNonNull(PropertiesServices.get("md.dir.source")));
        Path targetPath = Paths.get(Objects.requireNonNull(PropertiesServices.get("files.dir")) + File.separator + "mdfile");
        Path resourceRoot = Paths.get(Objects.requireNonNull(PropertiesServices.get("resource.root")));

        List<String> errorList = new ArrayList<>();

        // 更新
        updateDB();

        new MDFileVisitor(sourcePath,
                mdFile -> {
//                    System.out.println("mdFile:" + mdFile);
                    Path relativePath = sourcePath.relativize(mdFile);
                    Path resolvePath = targetPath.resolve(relativePath);

                    if (compileAll || checkExpiredMD(mdFile, relativePath)) {
                        MDProcessor.MDRes res;
                        try {
                            res = MDProcessor.getInstance().toHtml(mdFile, resourceRoot.relativize(resolvePath).getParent());
                        } catch (IOException e) {
                            e.printStackTrace();
                            throw new RuntimeException(e);
                        }

                        try {
                            FileUtils.write(
                                    Paths.get(resolvePath.toString() + ".jsp").toFile(),
                                    "<%@ page contentType=\"text/html; charset=UTF-8\" %>" + res.getHtmlStr());
                        } catch (IOException e) {
                            errorList.add(relativePath.toString());
                        }

                        try {
                            NoteDao dao = NoteDao.newInstance();
                            dao.setTitle(mdFile.getFileName().toString());
                            dao.setFilePath(relativePath.toString());
                            dao.setLastModified(new Timestamp(Files.getLastModifiedTime(mdFile).toMillis()));
                            dao.setMeta(res.metaList);
                            dao.setAbs(StringEscapeUtils.escapeHtml(res.getHtmlStr().substring(0, Math.min(res.getHtmlStr().length(), 200))));
                            System.out.println("insert " + dao.getFilePath());
                            NoteServices.insert(dao);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                },
                resFile -> {
//                    System.out.println("resFile:" + resFile);
                    Path relativePath = sourcePath.relativize(resFile);
                    Path resolvePath = targetPath.resolve(relativePath);
                    try {
                        if (!resolvePath.toFile().exists() ||
                                Files.getLastModifiedTime(resolvePath).compareTo(Files.getLastModifiedTime(resFile)) > 0) {
                            FileUtils.copyFile(resFile.toFile(), resolvePath.toFile());
                            System.out.println("File copy : " + relativePath.toString());
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                        errorList.add(relativePath.toString());
                    }
                }).walkStart();

        noteDaos = NoteServices.selectAll();

        if (noteDaos != null && !noteDaos.isEmpty()) {
            noteDaos.stream()
                    .filter(dao -> !sourcePath.resolve(dao.getFilePath()).toFile().exists())
                    .forEach(dao -> {
                        try {
                            System.out.println("delete : " + dao.getFilePath());
                            NoteServices.deleteByID(dao.getId());
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    });
        }

        noteDaos = NoteServices.selectAll();

        try {
            System.out.println("write note_archive_list");
            FileUtils.write(
                    resourceRoot.resolve("resources/files/generatedPage/note_archive_list.jsp").normalize().toFile(),
                    noteDaos.stream()
                            .collect(Collectors.groupingBy(dao -> {
                                LocalDateTime time = dao.getPubTime().toLocalDateTime();
                                return time.getYear() + "/" + time.getMonthValue();
                            }, Collectors.counting()))
                            .entrySet()
                            .stream()
                            .sorted((o1, o2) -> o2.getKey().compareTo(o1.getKey()))
                            .map(s -> "<li class=\"archive-list-item\">" +
                                    "<a class=\"archive-list-link\" href=\"<c:url value=\"/note/archive/" + s.getKey().split("/")[0] + "\"/>\">" +
                                    s.getKey().split("/")[0] + "年" + s.getKey().split("/")[1] + "月" +
                                    "</a>" +
                                    "<span class=\"archive-list-count\" >" + s.getValue() + "</span>" +
                                    "</li >"
                            ).collect(Collectors.joining("\n",
                            "<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\" %>\n" +
                                    "<%@page contentType=\"text/html; charset=utf-8\" pageEncoding=\"utf-8\" %>\n",
                            ""))
            );
            System.out.println("end of write note_archive_list");
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            System.out.println("write note_tag_list");

            Map<String, Long> tagsMap = noteDaos.stream()
                    .flatMap(dao -> Arrays.stream(dao.getTags().split("/")))
                    .map(tag -> {
                        try {
                            return URLDecoder.decode(tag, "UTF-8");
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }
                        return null;
                    })
                    .filter(Objects::nonNull)
                    .filter(s->!s.trim().equals(""))
                    .collect(Collectors.groupingBy(s -> s, Collectors.counting()));

            long max = tagsMap.entrySet().stream().mapToLong(Map.Entry::getValue).max().orElse(0);

            FileUtils.write(
                    resourceRoot.resolve("resources/files/generatedPage/note_tag_list.jsp").normalize().toFile(),
                    tagsMap.entrySet()
                            .stream()
                            .map(s -> "<a href=\"<c:url value=\"/note/tag/" + s.getKey() + "\"/> \" style=\"font-size: " + ((s.getValue() * 10 / (float) max) + 10) + "px;\">" + s.getKey() + "</a>"
                            ).collect(Collectors.joining("\n",
                            "<%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\" %>\n" +
                                    "<%@page contentType=\"text/html; charset=utf-8\" pageEncoding=\"utf-8\" %>\n",
                            ""))
            );
            System.out.println("end of write note_tag_list");
        } catch (Exception e) {
            e.printStackTrace();
        }


        return errorList;
    }


    public boolean checkExpiredMD(Path mdFile, Path relativeFile) {
        if (relativeFile == null) {
            return true;
        }
        Timestamp ts;
        try {
            ts = new Timestamp(Files.getLastModifiedTime(mdFile).toMillis());
        } catch (IOException e) {
            e.printStackTrace();
            return true;
        }
        if (noteDaos != null && !noteDaos.isEmpty()) {
            String fileStr = relativeFile.toString();
            for (NoteDao dao : noteDaos) {
                if (dao.getFilePath().trim().equals(fileStr.trim())) {
                    return dao.getLastModified().before(ts);
                }
            }
        }

        return true;
    }

    //<li class="archive-list-item">
//    <a class="archive-list-link" href="/archives/2017/02/">二月 2017</a>
//    <span class="archive-list-count">4</span>
//</li>
    public void generatePage() throws Exception {
    }


    public static void main(String[] args) throws Exception {
        System.out.println(MDServices.getInstance().xx());
//        System.out.println(MDServices.getInstance().xx(true));
//        Path p = Paths.get("C:\\Users\\tom\\IdeaProjects\\home\\md.md");
//        MDProcessor.MDRes res = MDProcessor.getInstance().toHtml(p,p);
//        System.out.println(res.getMetaList());
    }
}
