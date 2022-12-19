<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>esweb</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css" type="text/css" />
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu.jsp" />
	<div id="divcontent">
		<form action="${pageContext.request.contextPath}/login" method="post">
			<table width="1000px" border="0" cellspacing="0">
				<tr>
					<td style="padding:30px"><div style="height:470px">
							<b>&nbsp;&nbsp;首页&nbsp;&raquo;&nbsp;个人用户登录</b>
							<div>
								<table width="100%" border="0" cellspacing="0" style="padding-left: 250px">
									<tr>
										<td>
											<div id="logindiv">
												<table width="100%" border="0" cellspacing="0" style="padding-top: 50px">
													<tr>
														<td style="text-align:center; padding-top:20px">
															<img src="${pageContext.request.contextPath }/images/logintitle.gif" width="150" height="30" />
														</td>
													</tr>
													<tr>
														<td style="text-align:center;padding-top:20px;"><font
															color="#ff0000">${requestScope["register_message"]}</font>
														</td>
													</tr>
													<tr>
														<td style="text-align:center">
															<table width="80%" border="0" cellspacing="0"
																style="margin-top:15px ;margin-left:auto; margin-right:auto;">
																	<tr>
																	<td
																	style="text-align:right; padding-top:5px; width:25%">用户名：</td>
																	<td style="text-align:left"><input name="username"
																	type="text" class="textinput" />
																	</td>
																	</tr>
																<tr>
																	<td style="text-align:right; padding-top:5px">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
																	<td style="text-align:left"><input name="password"
																		type="password" class="textinput" />
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="text-align:center">
																		&nbsp;&nbsp;
																		<input type="checkbox" name="autologin" value="${60*60*24*31}" /> 自动登录
																	</td>
																</tr>
																<tr>
																	<td colspan="2"
																		style="padding-top:10px; text-align:center">
																		<input name="image" type="image" onclick="return formcheck()"
																		src="${pageContext.request.contextPath }/images/loginbutton.gif" width="90" height="30" />
																	</td>
																</tr>

																<tr>
																	<td colspan="2" style="padding-top:10px">
																		<img src="${pageContext.request.contextPath }/images/loginline.gif" width="241" height="10" />
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</div></td>
									</tr>
								</table>
								<table style="padding-left: 600px">
									<td style="text-align:center; padding-top:30px; width:60%"><h1>您还没有注册？</h1>
										<p style="text-align:center">
											<a href="${pageContext.request.contextPath }/register.jsp">
												<img src="${pageContext.request.contextPath }/images/signupbutton.gif" width="135" height="33" />
											</a>
										</p>
									</td>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
