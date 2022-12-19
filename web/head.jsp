<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lgy
  Date: 2022/12/16
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div id="divhead">
  <table cellspacing="0" class="headtable">
    <tr>
      <td>
        <a href="#">
          <img src="${pageContext.request.contextPath}/images/logo.png" alt="shoplogo" width="200" height="60" border="0" />
        </a>
      </td>
      <td style="text-align:right; padding-right: 20px">

        <c:choose>
          <c:when test="${sessionScope.user==null}">
              <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
            | <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
          </c:when>
          <c:otherwise>
            欢迎您，${sessionScope.user.username}!
            | <img src="${pageContext.request.contextPath}/images/cart.gif" width="26" height="23" style="margin-bottom:-4px" alt=""/>&nbsp;
            <a href="#">购物车</a>
            | <a href="${pageContext.request.contextPath}/myAccount.jsp">我的账户</a>
          </c:otherwise>
        </c:choose>

      </td>
    </tr>
  </table>
</div>
