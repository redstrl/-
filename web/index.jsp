<%--
  Created by IntelliJ IDEA.
  User: lgy
  Date: 2022/12/16
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 导入css、js -->
    <title>esweb</title>
      <link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css" type="text/css" />
      <link rel="stylesheet" href="${pageContext.request.contextPath }/css/autoplay.css" type="text/css" />
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/autoplay.js"></script>
  </head>
  <body class="main">
    <jsp:include page="head.jsp" />
    <jsp:include page="menu.jsp" />
    <!-- 轮播图 -->
    <div id="box_autoplay">
      <div class="list">
        <ul>
          <li><img src="cover/test.png" width="900" height="335" alt=""/></li>
          <li><img src="cover/test.png" width="900" height="335" alt=""/></li>
          <li><img src="cover/test.png" width="900" height="335" alt=""/></li>
        </ul>
      </div>
    </div>
    <!-- 公告 -->
    <div id="divcontent">
      <table width=100% border="0" cellspacing="0">
        <tr>
          <td width="497">
  
            <img src="images/billboard.gif" width="497" height="38" alt=""/>
            <table cellspacing="0" class="ctl">
              <tr>
                <td width="485" height="29">
                  test
                </td>
              </tr>
            </table>
          </td>
          <td style="padding:5px 15px 10px 40px">
            <table width="100%" border="0" cellspacing="0">
              <tr>
                <td>
                  <img src="images/hottitle.gif" width="126" height="29" alt=""/>
                </td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0">
              <tr>
                <td style="width:80px; text-align:center">
                  <a href="#">
                    <img src="cover/test.png" width="102" height="130" border="0" />
                  </a>
                  <br />
                </td>
                <td style="width:80px; text-align:center">
                  <a href="#">
                    <img src="cover/test.png" width="102" height="130" border="0" alt=""/>
                  </a>
                  <br />
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </div>
    <!-- 尾部 -->
    <jsp:include page="foot.jsp" />
  </body>
</html>
