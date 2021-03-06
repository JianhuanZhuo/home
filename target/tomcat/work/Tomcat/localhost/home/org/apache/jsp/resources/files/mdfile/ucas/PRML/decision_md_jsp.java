/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2018-02-16 10:54:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.resources.files.mdfile.ucas.PRML;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class decision_md_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<p>title: 线性判别函数\n");
      out.write("date : 2018/1/12</p>\n");
      out.write("<hr />\n");
      out.write("<h2>一般模式</h2>\n");
      out.write("<p>一般模式：</p>\n");
      out.write("<p>$$d(x)=w^Tx$$</p>\n");
      out.write("<p>其中：</p>\n");
      out.write("<ol>\n");
      out.write("<li>$x=(x_1, x_2 ... x_n, 1)$ 称为增广特征向量（增广模式向量）</li>\n");
      out.write("<li>$w=(w_1, w_2 ... w_n, w_{n+1})$ 称为增广权重向量</li>\n");
      out.write("<li>如上式子中得到的是一个判定值 <code>decision value</code>，它表示样本的特征向量 $x$ 以 $w$ 权重向量指定的方式（权重，可以理解为类型判别的计算标准）全加后得到的一个结果得分，以该得分确定类别（阈值通常以 0 为分界值，非阈值的则为软别见）。</li>\n");
      out.write("</ol>\n");
      out.write("<h2>两类问题</h2>\n");
      out.write("<p>使用 $d(x)$ 值应用于两类情况下类别判定为：</p>\n");
      out.write("<div>\n");
      out.write("$$\r\n");
      out.write("d(x)=w^Tx=\r\n");
      out.write("\\left\\{\r\n");
      out.write("\\begin{array}{ll}\r\n");
      out.write(">0, if x \\in \\omega_1 \r\n");
      out.write("\\\\\r\n");
      out.write("<0, if x \\in \\omega_2\r\n");
      out.write("\\end{array}\r\n");
      out.write("\\right.\r\n");
      out.write("$$\r\n");
      out.write("</div>\n");
      out.write("<h2>多类问题 1 ($\\omega_i/\\bar{\\omega_i}$)</h2>\n");
      out.write("<p>$M$ 类问题可以看成是 $M$ 个问题的组合，第 $i$ 问题判定单独判定样本 $x$ 是否属于该类别，即用线性判别函数将属于 $ω_i$ 类的模式与不属于 $ω_i$ 类的模式分开。</p>\n");
      out.write("<h2>多类问题 2 ($ω_i/ω_j$)</h2>\n");
      out.write("<p>一个判别界面仅进行对特定两类进行划分，而多类问题的判定则需要结合全部的判别界面进行判别。</p>\n");
      out.write("<p>$$d_{ij}(x)=w_{ij}^Tx$$</p>\n");
      out.write("<ol>\n");
      out.write("<li>一个判别界面仅能区分特定的两类中的样本，如果给定一个样本不是特定类中的，则会判定错误。</li>\n");
      out.write("<li>也就是给定某个样本，判定它是否只属于某个类别，则需要遍历其他全部类别：若 $d_{ij}(x) &gt; 0$， $\\forall j \\neq i$，则 $x \\in \\omega_i$。</li>\n");
      out.write("<li>比起 <code>多类问题 1</code> 而言，样本的预测会麻烦一点，但判别界面的设定比较简单，因为只考虑了两个类别之间的界限。</li>\n");
      out.write("</ol>\n");
      out.write("<h2></h2>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
