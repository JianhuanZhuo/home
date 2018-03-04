package cn.keepfight.utils;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.FileTime;

import static java.nio.file.StandardWatchEventKinds.OVERFLOW;

//2018-01-31T14:39:30.446996Z
//        2018-02-07T09:28:38.573096Z

//2018-01-31T14:39:30.446996Z
//        2018-02-07T09:30:13.812849Z

/**
 * sd
 * Created by tom on 2018/2/7.
 */
public class FileInfoUtils {
    public static void main(String[] args) throws IOException, InterruptedException {
        FileTime x = Files.getLastModifiedTime(new File("md.html").toPath());
        System.out.println(x);
        FileTime md_f = Files.getLastModifiedTime(new File("md").toPath());
        System.out.println(md_f);
        System.out.println(md_f.toMillis());

        Path pa = new File("md").toPath();

        WatchService watcher = FileSystems.getDefault().newWatchService();

        WatchKey key = pa.register(watcher,
                StandardWatchEventKinds.ENTRY_MODIFY,
                StandardWatchEventKinds.ENTRY_CREATE,
                StandardWatchEventKinds.ENTRY_DELETE);

        while (true) {
            WatchKey k = watcher.take();

            System.out.println("take!");

            for (WatchEvent<?> event : k.pollEvents()) {
                WatchEvent.Kind<?> kind = event.kind();

                // 虽然这个键仅注册了 ENTRY_CREATE 事件，但是丢失或者被弃用，OVERFLOW 事件也会发生。
                if (kind == OVERFLOW) {
                    continue;
                }

                System.out.println(kind);

                // 事件内容是文件路径
                WatchEvent<Path> ev = cast(event);
                Path filename = ev.context();
                final Path changed = pa.resolve( filename );

                System.out.format("Emailing file %s%n", filename);
                System.out.format("changed file %s%n", changed);
            }

            // 重置该键，如果你想继续接收监听消息，这一步十分关键。
            // 如果键无效，目录无法访问，那么应该退出这个循环。
            boolean valid = key.reset();
            if (!valid) {
                break;
            }
        }
    }

    @SuppressWarnings("unchecked")
    static <T> WatchEvent<T> cast(WatchEvent<?> event) {
        return (WatchEvent<T>) event;
    }
}
