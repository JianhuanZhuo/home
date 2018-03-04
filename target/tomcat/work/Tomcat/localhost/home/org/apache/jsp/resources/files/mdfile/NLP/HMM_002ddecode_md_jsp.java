/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.37
 * Generated at: 2018-02-19 13:14:19 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.resources.files.mdfile.NLP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class HMM_002ddecode_md_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<p>给定一个观察序列 $O=O_1O_2O_3 \\cdots O_T$ 和模型 $\\mu = (A,B,\\pi)$，计算观察序列 $O$ 的概率 $P(O|\\mu)$。</p>\n");
      out.write("<h2>朴素产生式解法</h2>\n");
      out.write("<p>对任意隐状态序列 $Q=q_1q_2 \\cdots q_T$，有：</p>\n");
      out.write("<div>\n");
      out.write("$$\r\n");
      out.write("\\begin{aligned}\r\n");
      out.write("P(O|Q,\\mu) &= \\prod^{T-1}_{t=1}{P(O_t | q_t, q_{t+1}, \\mu)} \\\\\r\n");
      out.write("&= b_{q1}(O_1) \\times b_{q2}(O_2) \\times b_{qT}(O_T)\r\n");
      out.write("\\end{aligned}\r\n");
      out.write("\\tag{6-8}\r\n");
      out.write("$$\r\n");
      out.write("</div>\n");
      out.write("<p>并且</p>\n");
      out.write("<div>\n");
      out.write("$$\r\n");
      out.write("\\begin{aligned}\r\n");
      out.write("P(Q | \\mu) &= \\pi_{q1}a_{q1q2}a_{q2q3} \\cdots a_{q_{T-1}qT}\r\n");
      out.write("\\end{aligned}\r\n");
      out.write("\\tag{6-9}\r\n");
      out.write("$$\r\n");
      out.write("</div>\n");
      out.write("<p>由于</p>\n");
      out.write("<div>\n");
      out.write("$$\r\n");
      out.write("\\begin{aligned}\r\n");
      out.write("P(O, Q|\\mu) &= P(O|Q, \\mu) P(Q|\\mu)\r\n");
      out.write("\\end{aligned}\r\n");
      out.write("\\tag{6-10}\r\n");
      out.write("$$     \r\n");
      out.write("</div>\n");
      out.write("<p>于是</p>\n");
      out.write("<div>\n");
      out.write("$$\r\n");
      out.write("\\begin{aligned}\r\n");
      out.write("P(O|\\mu) &= \\sum_Q{P(O,Q|\\mu)} \\\\\r\n");
      out.write("&= \\sum_Q{P(O|Q,\\mu) P(Q|\\mu))} \\\\\r\n");
      out.write("&= \\sum_Q{\\pi_{q_1}b_{q_1}(O_1) \\prod^{T-1}_{t=1}{a_{q_tq_{t+1}} b_{q_{t+1}}(O_{t+1}) } }\r\n");
      out.write("\\end{aligned}\r\n");
      out.write("\\tag{6-11}\r\n");
      out.write("$$\n");
      out.write("</div>\n");
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
