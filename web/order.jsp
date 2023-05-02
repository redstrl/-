<%--
  Created by IntelliJ IDEA.
  User: lgy
  Date: 2023/4/30
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>order</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
</head>
<body class="main">
    <jsp:include page="head.jsp" />
    <jsp:include page="menu.jsp" />

    <div id="divpagecontent">
        <table width="100%">
            <tr>
                <td>
                    <div style="text-align: right; margin: 5px 10px 5px 0px">
                        <a href="${pageContext.request.contextPath }/index.jsp">首页</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/cart.jsp">&nbsp;购物车</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单
                    </div>
                    <form id="orderForm" action="${pageContext.request.contextPath}/creatOrder" method="post">
                        <table class="infocontent">
                            <tr>
                                <td>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <table class="carttable">
                                                    <tr>
                                                        <td width="10%">序号</td>
                                                        <td width="40%">商品名称</td>
                                                        <td width="10%">价格</td>
                                                        <td width="10%">类别</td>
                                                        <td width="10%">数量</td>
                                                        <td width="10%">小计</td>
                                                    </tr>
                                                </table>
                                                <c:set value="0" var="totalPrice"/>
                                                <c:forEach items="${cart}" var="entry" varStatus="vs">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>${vs.count}</td>
                                                            <td>${entry.key.name }</td>
                                                            <td>${entry.key.price }</td>
                                                            <td>${entry.key.category}</td>
                                                            <td>
                                                                <input name="text" type="text" value="${entry.value}" style="width:20px" readonly="readonly"/>
                                                            </td>
                                                            <td width="10%">${entry.key.price*entry.value}</td>
                                                        </tr>
                                                    </table>
                                                    <c:set var="totalPrice" value="${totalPrice+entry.key.price*entry.value}"/>
                                                </c:forEach>
                                                <table class="carttable">
                                                    <tr>
                                                        <td style="text-align:right; padding-right:40px;"><font
                                                                style="color:black">合计：&nbsp;&nbsp;￥${totalPrice}</font>
                                                            <input type="hidden" name="money" value="${totalPrice}">
                                                        </td>
                                                    </tr>
                                                </table>
                                                <p>
                                                    收货地址：<input id="receiverAddress" name="receiverAddress" type="text" value=""style="width:350px" onkeyup="checkReceiverAddress();" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span id="receiverAddressMsg"></span>
                                                    <br/>
                                                    收货人：&nbsp;&nbsp;&nbsp;&nbsp;<input id="receiverName" name="receiverName" type="text" value="${user.username}" style="width:150px" onkeyup="checkReceiverName();" />
                                                    <span id="receiverNameMsg"></span>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <br/>
                                                    联系方式：<input type="text" id="receiverPhone" name="receiverPhone" value="${user.telephone}" style="width:150px" onkeyup="checkReceiverPhone();" />
                                                    <span id="receiverPhoneMsg"></span>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                </p>
                                                <hr />
                                                <p style="text-align:right">
                                                    <img src="images/gif53_029.gif" width="204" height="51" border="0" onclick="checkOnSubmit();"/>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </div>

    <jsp:include page="foot.jsp" />
</body>
</html>
