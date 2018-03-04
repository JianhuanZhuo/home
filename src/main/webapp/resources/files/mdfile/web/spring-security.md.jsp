<%@ page contentType="text/html; charset=UTF-8" %><p>一般使用如下这个组件做安全方面的工作</p>
<pre><code class="language-xml">&lt;dependency&gt;
    &lt;groupId&gt;org.springframework.security&lt;/groupId&gt;
    &lt;artifactId&gt;spring-security-config&lt;/artifactId&gt;
    &lt;version&gt;4.1.1.RELEASE&lt;/version&gt;
&lt;/dependency&gt;
&lt;dependency&gt;
    &lt;groupId&gt;org.springframework.security&lt;/groupId&gt;
    &lt;artifactId&gt;spring-security-web&lt;/artifactId&gt;
    &lt;version&gt;4.1.1.RELEASE&lt;/version&gt;
&lt;/dependency&gt;
</code></pre>
<p>创建内存里的认证用户，用于超级管理者</p>
<pre><code class="language-java">@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser(&quot;john&quot;)
                .password(&quot;pa55word&quot;)
                .roles(&quot;USER&quot;);
        auth.inMemoryAuthentication()
                .withUser(&quot;admin&quot;)
                .password(&quot;root123&quot;)
                .roles(&quot;USER&quot;, &quot;ADMIN&quot;);
    }

    
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        // loginPage 指明登录表单所在的 URL 地址
        // 这里需要注意的是，这个地址应该和 LoginController 中的 login() 地址相同
        httpSecurity.formLogin().loginPage(&quot;/login&quot;)
                // 这里设置用户名和密码的参数名，与 login.jsp 的参数名相同
                .usernameParameter(&quot;userId&quot;)
                .passwordParameter(&quot;password&quot;);

        // 这里配置登录成功后的页面
        httpSecurity.formLogin().defaultSuccessUrl(&quot;/market/products/add&quot;)
                // 这里配置失败后的页面，并使用 error 表示页面状态以便渲染失败的提示
                .failureUrl(&quot;/login?error&quot;);

        // 这里配置登出的页面
        httpSecurity.logout().logoutSuccessUrl(&quot;/login?logout&quot;);

        // 这里配置权限限制错误页面
        httpSecurity.exceptionHandling().accessDeniedPage(&quot;/login?accessDenied&quot;);

        // 这里配置页面的访问权限
        httpSecurity.authorizeRequests()
                .antMatchers(&quot;/&quot;).permitAll()
                .antMatchers(&quot;/**/add&quot;).access(&quot;hasRole('ADMIN')&quot;)
                .antMatchers(&quot;/**/market/**&quot;).access(&quot;hasRole('USER')&quot;);

        httpSecurity.csrf().disable();
    }
}
</code></pre>
<p>使用如下这个做初始化，它会自动加载上述的配置类</p>
<pre><code class="language-java">public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer {
}
</code></pre>
