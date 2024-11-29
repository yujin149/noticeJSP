/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.28
 * Generated at: 2024-11-29 07:06:53 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import bbs.BbsDAO;
import bbs.Bbs;
import java.util.ArrayList;
import java.io.PrintWriter;

public final class searchAction_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(6);
    _jspx_imports_classes.add("bbs.Bbs");
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("bbs.BbsDAO");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

request.setCharacterEncoding("UTF-8");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width\" initial-scale=\"1\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/reset.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/font.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/style.css\">\r\n");
      out.write("<title>JSP 프로그래밍 시험</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<div class=\"bbsWrap\">\r\n");
      out.write("		<nav class=\"navWrap\">\r\n");
      out.write("			<h1>\r\n");
      out.write("				<a href=\"bbs.jsp\">JSP 프로그래밍 시험</a>\r\n");
      out.write("			</h1>\r\n");
      out.write("			");

			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("			");

			if (userID == null) {
			
      out.write("\r\n");
      out.write("			<ul class=\"userMenu\">\r\n");
      out.write("				<li><a href=\"login.jsp\">로그인</a></li>\r\n");
      out.write("				<li><a href=\"join.jsp\">회원가입</a></li>\r\n");
      out.write("			</ul>\r\n");
      out.write("			");

			} else {
			
      out.write("\r\n");
      out.write("			<ul class=\"userMenu\">\r\n");
      out.write("				<li><a href=\"logoutAction.jsp\">로그아웃</a></li>\r\n");
      out.write("			</ul>\r\n");
      out.write("			");

			}
			
      out.write("\r\n");
      out.write("		</nav>\r\n");
      out.write("\r\n");
      out.write("		<div class=\"container\">\r\n");
      out.write("			<div class=\"searchWrap\">\r\n");
      out.write("				<form action=\"searchAction.jsp\" method=\"get\">\r\n");
      out.write("					<select name=\"searchField\">\r\n");
      out.write("						<option value=\"bbsTitle\">제목</option>\r\n");
      out.write("						<option value=\"userID\">작성자</option>\r\n");
      out.write("					</select>\r\n");
      out.write("					<div class=\"search\">\r\n");
      out.write("						<input type=\"text\" name=\"searchText\" placeholder=\"검색어를 입력해주세요.\">\r\n");
      out.write("						<button type=\"submit\" class=\"btn\">검색</button>\r\n");
      out.write("					</div>\r\n");
      out.write("				</form>\r\n");
      out.write("			</div>\r\n");
      out.write("\r\n");
      out.write("			<div class=\"tableWrap\">\r\n");
      out.write("				<table>\r\n");
      out.write("					<colgroup>\r\n");
      out.write("						<col style=\"width: 8%\">\r\n");
      out.write("						<col style=\"width: *\">\r\n");
      out.write("						<col style=\"width: 16%\">\r\n");
      out.write("						<col style=\"width: 16%\">\r\n");
      out.write("					</colgroup>\r\n");
      out.write("					<thead>\r\n");
      out.write("						<tr>\r\n");
      out.write("							<th>번호</th>\r\n");
      out.write("							<th>제목</th>\r\n");
      out.write("							<th>작성자</th>\r\n");
      out.write("							<th>작성일</th>\r\n");
      out.write("						</tr>\r\n");
      out.write("					</thead>\r\n");
      out.write("					<tbody>\r\n");
      out.write("						");

						String searchField = request.getParameter("searchField");
						String searchText = request.getParameter("searchText");

						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getSearch(searchField, searchText);

						if (list.size() == 0) {
							out.println("<tr><td colspan='4'>검색 결과가 없습니다.</td></tr>");
						} else {
							for (int i = 0; i < list.size(); i++) {
						
      out.write("\r\n");
      out.write("						<tr\r\n");
      out.write("							onclick=\"location.href='view.jsp?bbsID=");
      out.print(list.get(i).getBbsNum());
      out.write("';\">\r\n");
      out.write("							<td>");
      out.print(list.get(i).getBbsNum());
      out.write("</td>\r\n");
      out.write("							<td style=\"text-align: left;\">");
      out.print(list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>"));
      out.write("\r\n");
      out.write("							</td>\r\n");
      out.write("							<td>");
      out.print(list.get(i).getUserID());
      out.write("</td>\r\n");
      out.write("							<td>");
      out.print(list.get(i).getBbsDate().substring(0, 11));
      out.write("</td>\r\n");
      out.write("						</tr>\r\n");
      out.write("						");

						}
						}
						
      out.write("\r\n");
      out.write("					</tbody>\r\n");
      out.write("				</table>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"btnWrap\">\r\n");
      out.write("				<a href=\"bbs.jsp\" class=\"btn btn-primary\">목록</a>\r\n");
      out.write("				");

				if (userID != null) {
				
      out.write("\r\n");
      out.write("				<a href=\"write.jsp\" class=\"btn btn-primary green-btn\">글쓰기</a>\r\n");
      out.write("				");

				}
				
      out.write("\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("	<script src=\"http://code.jquery.com/jquery-3.1.1.min.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}