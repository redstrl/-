<%--
  Created by IntelliJ IDEA.
  User: lgy
  Date: 2022/12/16
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div id="divmenu">
  <a href="${pageContext.request.contextPath}/index.jsp">首页</a>
  <a href="${pageContext.request.contextPath}/showProductByPage?category=书籍">书籍</a>
  <a href="${pageContext.request.contextPath}/showProductByPage" style="color:#f6f5f5">全部商品目录</a>
  <form action="#" id="searchform">
    <table width="100%" border="0" cellspacing="0">
      <tr>
        <td style="text-align:right; padding-right:20px; color: #FFFFFF">
          Search
          <input type="text" name="textfield" class="inputtable" id="textfield" placeholder="请输入商品名"
                 onmouseover="this.focus();"
                 onclick="my_click(this, 'textfield');"
                 onBlur="my_blur(this, 'textfield');"/>
          <a href="#">
            <img src="${pageContext.request.contextPath}/images/serchbutton.gif" border="0" style="margin-bottom:-4px" onclick="search()" alt=""/>
          </a>
        </td>
      </tr>
    </table>
  </form>
</div>
