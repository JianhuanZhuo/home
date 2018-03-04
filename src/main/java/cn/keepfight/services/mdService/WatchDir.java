package cn.keepfight.services.mdService;

import cn.keepfight.utils.PropertiesServices;

import java.nio.file.*;
import java.util.Objects;

import static java.nio.file.StandardWatchEventKinds.*;

/**
 * Created by tom on 2018/2/19.
 */
public class WatchDir {

    public static void main(String[] args) throws Exception {
        WatchService watcher = FileSystems.getDefault().newWatchService();

        Path sourcePath = Paths.get(Objects.requireNonNull(PropertiesServices.get("md.dir.source")));

        sourcePath.register(watcher,
                ENTRY_CREATE,
                ENTRY_MODIFY);

        for (;;) {
            // 等待键置号
            WatchKey key;
            try {
                key = watcher.take();
            } catch (InterruptedException x) {
                return;
            }

            for (WatchEvent<?> event: key.pollEvents()) {
                WatchEvent.Kind<?> kind = event.kind();

                // 虽然这个键仅注册了 ENTRY_CREATE 事件，但是丢失或者被弃用，OVERFLOW 事件也会发生。
                if (kind == OVERFLOW) {
                    continue;
                }

                System.out.println("something happen!");

                // 检查新文件是否为文本文件
                MDServices.getInstance().xx();
                break;
            }

            // 重置该键，如果你想继续接收监听消息，这一步十分关键。
            // 如果键无效，目录无法访问，那么应该退出这个循环。
            boolean valid = key.reset();
            if (!valid) {
                break;
            }
        }
    }
}
