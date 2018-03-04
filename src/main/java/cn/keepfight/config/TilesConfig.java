package cn.keepfight.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

/**
 * Tile 模板引擎配置
 * Created by tom on 2017/9/20.
 */
@Configuration
public class TilesConfig {
    /**
     * 页面渲染器配置
     */
    @Bean
    public UrlBasedViewResolver viewResolver() {
        UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
        viewResolver.setViewClass(TilesView.class);
        viewResolver.setOrder(-2);
        return viewResolver;
    }

    /**
     * TilesConfigurer 配置器配置
     */
    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions("/WEB-INF/layouts/definitions/*tiles.xml");
        tilesConfigurer.setCheckRefresh(true);
        return tilesConfigurer;
    }
}
