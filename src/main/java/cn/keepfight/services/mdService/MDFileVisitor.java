package cn.keepfight.services.mdService;

import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.DosFileAttributes;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import java.util.function.Consumer;

import static java.nio.file.FileVisitResult.*;

/**
 * MD 文件夹游走
 * <p>
 * Created by tom on 2018/2/11.
 */
public class MDFileVisitor extends SimpleFileVisitor<Path> {

    private Path rootDir;
    private Consumer<Path> mdTranslater;
    private Consumer<Path> resourceTranslater;

    /**
     * 后缀过滤集
     */
    private Set<String> backFilterSet = new HashSet<>();
    private Set<String> whiteFilterSet = new HashSet<>();

    public MDFileVisitor(Path rootDir,
                         Consumer<Path> mdTranslater,
                         Consumer<Path> resourceTranslater) {
        this.rootDir = rootDir;
        this.mdTranslater = mdTranslater;
        this.resourceTranslater = resourceTranslater;
    }

    @Override
    public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
        Objects.requireNonNull(dir);
        Objects.requireNonNull(attrs);
        DosFileAttributes dfa = Files.readAttributes(dir, DosFileAttributes.class);
        if (dfa.isHidden() || attrs.isSymbolicLink() || dir.getFileName().toString().startsWith(".")) {
            return SKIP_SUBTREE;
        }
        return FileVisitResult.CONTINUE;
    }

    @Override
    public FileVisitResult visitFile(Path file, BasicFileAttributes attr) {
        String fileName = file.getFileName().toString();
        if (fileName.startsWith(".")) {
            return CONTINUE;
        }
        if (!backFilterSet.isEmpty() || !whiteFilterSet.isEmpty()) {
            int index = fileName.lastIndexOf('.');
            if (index != -1 && backFilterSet.contains(fileName.substring(index + 1))) {
                return CONTINUE;
            }

            if (!whiteFilterSet.isEmpty() &&
                    (index == -1 || !whiteFilterSet.contains(fileName.substring(index + 1)))) {
                return CONTINUE;
            }
        }

        if (file.getFileName().toString().endsWith(".md")) {
            mdTranslater.accept(file);
        } else {
            resourceTranslater.accept(file);
        }
        return CONTINUE;
    }

    /**
     * 开始游走
     */
    public void walkStart() throws IOException {
        Files.walkFileTree(rootDir, this);
    }

    public Set<String> getBackFilterSet() {
        return backFilterSet;
    }

    public void setBackFilterSet(Set<String> backFilterSet) {
        this.backFilterSet = backFilterSet;
    }

    public Set<String> getWhiteFilterSet() {
        return whiteFilterSet;
    }

    public void setWhiteFilterSet(Set<String> whiteFilterSet) {
        this.whiteFilterSet = whiteFilterSet;
    }


    public static void main(String[] args) throws IOException {

//        new MDFileVisitor(
//                Paths.get("C:\\Users\\tom\\IdeaProjects\\home\\BlogMarkdownSource"),
//                p -> System.out.println("md:" + p.getFileName()),
//                p -> System.out.println("res:" + p.getFileName())
//        ).walkStart();
        Path x = Paths.get("C:\\Users\\tom\\IdeaProjects\\home\\BlogMD\\weixin-app.md");
        System.out.println(x.resolve(Paths.get("../xx.html")));
        System.out.println(x.resolve(Paths.get("../xx.html")).toAbsolutePath());
        System.out.println(x.resolve(Paths.get("../xx.html")).toAbsolutePath().normalize());
        System.out.println(x.resolve(Paths.get("../xx.html")).normalize());
        System.out.println(x.resolve(Paths.get("/xx.html")));
        System.out.println(x.resolve(Paths.get("./xx.html")));
        System.out.println(x.resolve(Paths.get("xx.html")));
        System.out.println(x.resolve(Paths.get("img/xx.html")));
        System.out.println(x.resolve(Paths.get("img/xx.html")).normalize());
        System.out.println(x.resolve(Paths.get("./img/xx.html")).normalize());
        System.out.println(x.resolve(Paths.get("../img/xx.html")).normalize());
        System.out.println(x.getParent().resolve(Paths.get("../img/xx.html")).normalize());
        System.out.println(x.getParent().resolve(Paths.get("img/xx.html")).normalize());
        System.out.println(x.resolve(Paths.get("C:\\Users\\tom\\IdeaProjects")));
    }
}
