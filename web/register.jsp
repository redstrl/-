<%--
  Created by IntelliJ IDEA.
  User: lgy
  Date: 2022/12/16
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>esweb 账户注册</title>
    <!-- 导入css、js -->
      <link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css" type="text/css" />
      <link rel="stylesheet" href="${pageContext.request.contextPath }/css/autoplay.css" type="text/css" />
      <script type="text/javascript" src="${pageContext.request.contextPath }/js/autoplay.js"></script>
  </head>
  <body class="main">
    <!-- 顶部 -->
    <jsp:include page="head.jsp" />

    <!-- 菜单 -->
    <jsp:include page="menu.jsp" />

  <!-- 注册界面 -->
  <div id="divcontent" align="center">
    <form action="${pageContext.request.contextPath}/register" method="post" onsubmit="return checkForm();">
      <table width="850px" border="0" cellspacing="0">
        <tr>
          <td style="padding: 30px"><h1>账户注册</h1>
            <table width="70%" border="0" cellspacing="2" class="upline">
              <tr>
                <td style="text-align: right; width: 20%">邮箱：</td>
                <td style="width: 40%">
                  <input type="text" class="textinput"  id="email" name="email" onkeyup="checkEmail();"/>
                </td>
                <td colspan="2"><span id="emailMsg"></span><span
                        style="color: #999999; ">请输入有效的邮箱地址</span></td>
              </tr>
              <tr>
                <td style="text-align: right">账户名：</td>
                <td><input type="text" class="textinput"  id="username" name="username" onkeyup="checkUsername();"/>
                </td>
                <td colspan="2"><span id="usernameMsg"></span><font color="#999999">字母数字下划线1到10位, 不能是数字开头</font></td>
              </tr>
              <tr>
                <td style="text-align: right">密码：</td>
                <td><input type="password" class="textinput"  id="password" name="password" onkeyup="checkPassword();"/></td>
                <td><span id="passwordMsg"></span><font color="#999999">密码请设置6-16位字符</font></td>
              </tr>
              <tr>
                <td style="text-align: right">重复密码：</td>
                <td>
                  <input type="password" class="textinput"  id="repassword" name="repassword" onkeyup="checkConfirm();"/>
                </td>
                <td><span id="confirmMsg"></span>&nbsp;</td>
              </tr>
              <tr>
                <td style="text-align: right">联系电话：</td>
                <td colspan="2">
                  <input type="text" class="textinput"
                         style="width: 350px" name="telephone" />
                </td>
                <td>&nbsp;</td>
              </tr>
            </table>

            <table width="70%" border="0" cellspacing="0">
              <tr>
                <td style="padding-top: 20px; text-align: center">
                  <input type="image" src="images/signup.gif" name="submit" border="0"/>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </form>
  </div>

    <!-- 尾部 -->
    <jsp:include page="foot.jsp" />

  </body>
</html>
