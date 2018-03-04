package cn.keepfight.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.Properties;

/**
 * 属性服务工具类
 * Created by 卓建欢 on 2017/12/13.
 */
public class PropertiesServices {

    private static PropertiesServices instance;
    private static final String TEST_CONFIG_STRING = "app-test.properties";
    private static final String DEPLOY_CONFIG_STRING = "app-deploy.properties";
    private static final String BLOG_CONFIG_STRING = "blog.properties";
    private Properties ps;

    private PropertiesServices() {
        String config_string = System.getProperty("os.name").toLowerCase().contains("win") ? TEST_CONFIG_STRING : DEPLOY_CONFIG_STRING;
        ps = new Properties();
        try {
            ps.load(new BufferedReader(new InputStreamReader(
                    PropertiesServices.class.getClassLoader().getResourceAsStream(config_string),
                    Charset.forName("utf-8"))));
            Properties blogPs = new Properties();
            blogPs.load(new BufferedReader(new InputStreamReader(
                    PropertiesServices.class.getClassLoader().getResourceAsStream(BLOG_CONFIG_STRING),
                    Charset.forName("utf-8"))));
            for (String s : blogPs.stringPropertyNames()) {
                ps.putIfAbsent(s, blogPs.getProperty(s));
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public Properties getPs() {
        return ps;
    }

    /**
     * 单例模式
     */
    public static PropertiesServices getInstance() {
        if (instance == null) {
            instance = new PropertiesServices();
        }
        return instance;
    }

    /**
     * 根据键值获取一个属性为字符串的配置属性
     */
    public static String get(String key) {
        return getInstance().getPs().getProperty(key);
    }

    /**
     * 根据键值获取一个属性为字符串的配置属性.
     * 重载方法，提供一个默认值
     */
    public static String get(String key, String defaultValue) {
        return getInstance().getPs().getProperty(key, defaultValue);
    }

    /**
     * 根据键值获取一个属性为字符串的配置属性.
     * 重载方法，提供一个默认值
     */
    public static int getInt(String key, int defaultValue) {
        try {
            return Integer.valueOf(getInstance().getPs().getProperty(key));
        } catch (Exception e) {
            // to do nothing
        }
        return defaultValue;
    }

    /**
     * 获得文件文件夹配置路径
     */
    public static String getFilesDir() {
        String res = get("files.dir");
        System.out.println("get properties : files.dir : " + res);
        if (res == null || res.trim().equals("")) {
            throw new RuntimeException("Property 'files.dir' in config file is not found!");
        }
        if (!new File(res).exists()) {
            throw new RuntimeException("Property 'files.dir' is not exsit!");
        }
        return res;
    }

}
