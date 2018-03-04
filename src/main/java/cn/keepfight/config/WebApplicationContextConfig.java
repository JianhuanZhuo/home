package cn.keepfight.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

@Configuration
@EnableWebMvc
@ComponentScan("cn.keepfight")
public class WebApplicationContextConfig extends WebMvcConfigurerAdapter {

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    @Bean
    public InternalResourceViewResolver getInternalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(1024 * 1024 * 24);// 24M
        return new CommonsMultipartResolver();
    }

    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource resource = new ResourceBundleMessageSource();
        resource.setBasename("messages");
        resource.setDefaultEncoding("utf-8");
        resource.setCacheMillis(0);
        return resource;
    }


//    @Bean
//    public HandlerExceptionResolver exceptionResolver() {
//        return (request, response, handler, ex) -> {
//            System.out.println("第二种异常捕获：");
//            ModelAndView mv = new ModelAndView();
//            mv.addObject("ex", ex);//将产生的异常对象添加到Model
//            mv.setViewName("error");
//            return mv;
//        };
//    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 图片资源
        registry.addResourceHandler("/img/**")
                .addResourceLocations("/resources/images/");
        // css 资源
        registry.addResourceHandler("/css/**")
                .addResourceLocations("/resources/css/");
        // js 资源
        registry.addResourceHandler("/js/**")
                .addResourceLocations("/resources/js/");
        // font 资源
        registry.addResourceHandler("/fonts/**")
                .addResourceLocations("/resources/fonts/");
        // fiel 文件资源
        registry.addResourceHandler("/files/**")
                .addResourceLocations("/resources/files/");
    }


    @Bean
    public LocaleResolver localeResolver() {
        SessionLocaleResolver resolver = new
                SessionLocaleResolver();
        resolver.setDefaultLocale(new Locale("zh"));
        return resolver;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("language");
        registry.addInterceptor(localeChangeInterceptor);

        // 添加来访者记录拦截器
//        registry.addInterceptor(new LoginInterceptor());
    }
}
