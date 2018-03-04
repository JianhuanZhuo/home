package cn.keepfight.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登陆拦截器
 * Created by LiuZongRui on 17/2/20.
 */
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 该方法将在Controller处理之前进行调用，return false则请求中止
     */
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        // 访谈者 URL、IP 记录
//        new Thread(() -> {
//            VisitDao dao = new VisitDao();
//            dao.setIp(httpServletRequest.getRemoteAddr());
//            dao.setTarget(httpServletRequest.getRequestURI());
//            dao.setVisit_time(new Timestamp(System.currentTimeMillis()));
//            dao.setAgent(httpServletRequest.getHeader("User-Agent"));
////            System.out.println("VisitInterceptor : "+dao);
//            try {
//                VisitServices.insert(dao);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }).start();
//
//        // 获取请求的url
//        String url = httpServletRequest.getRequestURI();
//        if (!StringUtils.contains(url, "backend")) {
//            // 登陆接口，放行
//            return true;
//        } else {
//            HttpSession session = httpServletRequest.getSession();
//            UserDao user = (UserDao) session.getAttribute("user");
//            if (user != null) {
//                return true;
//            }
//        }
//        // 不符合条件的跳转到登录界面
//        httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/login");
//        return false;
        return true;
    }

    /**
     * Controller处理之后，ModelAndView返回之前调用这个方法
     */
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    /**
     * 在ModelAndView视图渲染之后调用这个方法，一般此方法用于清理资源
     */
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}