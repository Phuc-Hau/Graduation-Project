<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link type="text/css" rel="stylesheet"
	href="https://static.xx.fbcdn.net/rsrc.php/v3/yn/l/0,cross/JT8ZJT0WWqH.css?_nc_x=Ij3Wp8lg5Kz"
	data-bootloader-hash="uUdC1OG" crossorigin="anonymous">
<link type="text/css" rel="stylesheet"
	href="https://static.xx.fbcdn.net/rsrc.php/v3/yq/l/0,cross/L0VTH1UsUXD.css?_nc_x=Ij3Wp8lg5Kz"
	data-bootloader-hash="0QQt+vI" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/assets/css/passmabaomat.css">

</head>
<body>
	<div class="_4-u5 _30ny">
		<form:form action="/account/login" class="_9vtf"
			data-testid="royal_login_form" modelAttribute="user" method="post"
			onsubmit="" id="u_0_k_Ft">

			<div
				class="mvl ptm uiInterstitial _9np_ uiInterstitialLarge uiBoxWhite">
				<div
					class="uiHeader uiHeaderBottomBorder mhl mts uiHeaderPage interstitialHeader">
					<div class="clearfix uiHeaderTop">
						<div>
							<h2 class="uiHeaderTitle" aria-hidden="true">Đăng Nhập</h2>
						</div>
					</div>
				</div>
				<div class="phl ptm uiInterstitialContent">
					<div>
						<div class="clearfix">
							<div class="_9okt olo">
								<form:input style="margin-top: 0px; border: none" type="text"
									class="yu inputtext _55r1 _9oku _9o1w" name="id" value=""
									path="username" placeholder="User Name"></form:input>

							</div>
							<div class="_9okt olo">
								<form:input style="margin-top: 0px; border: none"
									type="password" class="yu inputtext _55r1 _9oku _9o1w"
									name="passwordd" path="password" placeholder="Password"></form:input>

							</div>
							<div>
								<span class="checkmark">Remember Me</span>
								<input name="remember" value="true" type="checkbox" checked>
									
							</div>
							<span style="color: red"> ${mess} </span><br>
							<button
								class="sauo _42ft _42fu _9nq0 textPadding20px selected _42g-"
								id="btn_continue" type="submit">Đăng Nhập</button>

							<div class="_6ltj">
								<a href="/account/forgetpass">Quên mật khẩu?</a>
							</div>

						</div>

					</div>
				</div>
				<div class="hu uiInterstitialBar uiBoxGray topborder"
					style="margin-top: 28px; margin-bottom: 19px;">
					<div class="clearfix">
						<div class="rfloat _ohf" style="margin-left: 122px">
							<button formaction="/product/index"
								style="padding: 0px; width: 100px;"
								class="_42ft _42fu _9nq1 textPadding29px selected _42g-"
								type="submit" id="skip_button">Hủy</button>
							<button formaction="/account/signup" value="1"
								class="_42ft _42fu _9nq0 _9nq023 textPadding20px selected _42g-"
								id="btn_continue" name="btn_continue" type="submit">Tạo
								tài khoản mới</button>
						</div>
						<div class="pts"></div>
					</div>
				</div>
			</div>

		</form:form>
	</div>

</body>
</html>