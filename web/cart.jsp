<%--
  Created by IntelliJ IDEA.
  User: lgy
  Date: 2023/4/25
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>购物车</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css" type="text/css" />
    <script>
        //当商品数量发生变化时触发该方法
        function changeProductNum(count, totalCount, id) {
            count = parseInt(count);
            totalCount = parseInt(totalCount);
            //如果数量为0，判断是否要删除商品
            if (count == 0) {
                var flag = window.confirm("确认删除商品吗?");

                if (!flag) {
                    count = 1;
                }
            }
            if (count > totalCount) {
                alert("已达到商品最大购买量");
                count = totalCount;
            }
            location.href = "${pageContext.request.contextPath}/changeCart?id="
                + id + "&count=" + count;
        }
        //删除购物车中的商品
        function cart_del() {
            var msg = "您确定要删除该商品吗？";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>

<body class="main">
    <jsp:include page="head.jsp" />
    <jsp:include page="menu.jsp" />

    <div id="divpagecontent">
        <table width="100%">
            <tr>
                <td>
                    <div style="text-align:right; margin:5px 10px 5px 0px">
                        <a href="${pageContext.request.contextPath}/index.jsp">首页</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;购物车
                    </div>
                    <table class="infocontent" width="100%">
                        <tr>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <table class="carttable" width="100%">
                                                <tr>
                                                    <td width="10%">商品序号</td>
                                                    <td width="30%">商品名称</td>
                                                    <td width="10%">单价</td>
                                                    <td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>
                                                    <td width="10%">库存</td>
                                                    <td width="10%">小计</td>
                                                    <td width="10%">取消</td>
                                                </tr>
                                            </table>
                                            <c:set var="total" value="0" />
                                            <!--遍历商品-->
                                            <c:forEach items="${cart}" var="entry" varStatus="vs">
                                                <table width="100%">
                                                    <tr>
                                                        <td>${vs.count}</td>
                                                        <td>${entry.key.name}</td>
                                                        <td>${entry.key.price}</td>
                                                        <td>
                                                            <!--减少数量-->
                                                            <input type="button" value="-" style="width: 20px"
                                                                   onclick="changeProductNum('${entry.value-1}', '${entry.key.pnum}', '${entry.key.id}')">
                                                            <!--商品数量-->
                                                            <input name="text" type="text" value="${entry.value}" style="width: 40px;
                                                                   text-align: center;">
                                                            <!--增加数量-->
                                                            <input type="button" value="+" style="width: 20px"
                                                                   onclick="changeProductNum('${entry.value+1}', '${entry.key.pnum}', '${entry.key.id}')">
                                                        </td>
                                                        <td>${entry.key.pnum}</td>
                                                        <td>${entry.key.price*entry.value}</td>
                                                        <td>
                                                            <!--删除商品-->
                                                            <a href="${pageContext.request.contextPath}/changeCart?id=${entry.key.id}&count=0"
                                                               style="color: black; font-weight: bold" onclick="javascript:return cart_del()">X</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <c:set value="${total+entry.key.price*entry.value}" var="total" />
                                            </c:forEach>
                                            <table class="carttable">
                                                <tr>
                                                    <td style="text-align:right; padding-right:40px;">
                                                        <font style="color:#000000; font-weight:bold">合计：&nbsp;&nbsp;￥${total}</font>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div style="text-align:right; margin-top:10px">
                                                <!--继续购物 -->
                                                <a href="${pageContext.request.contextPath}/showProductByPage">返回</a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <!--结账 -->
                                                <a href="${pageContext.request.contextPath}/order.jsp">结算</a>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <jsp:include page="foot.jsp" />
</body>

</html>
