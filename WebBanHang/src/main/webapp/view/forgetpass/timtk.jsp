<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="https://static.xx.fbcdn.net/rsrc.php/v3/yn/l/0,cross/JT8ZJT0WWqH.css?_nc_x=Ij3Wp8lg5Kz" data-bootloader-hash="uUdC1OG" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="https://static.xx.fbcdn.net/rsrc.php/v3/yq/l/0,cross/L0VTH1UsUXD.css?_nc_x=Ij3Wp8lg5Kz" data-bootloader-hash="0QQt+vI" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/passmabaomat.css">

</head>
<body>
	<div class="_4-u5 _30ny" id="login_help" style="margin-top: 196px;">
		<form rel="async" id="identify_yourself_flow" action="/account/forgetmail" method="post" onsubmit = "return validateForm()">
			<div class="mvl ptm uiInterstitial _9np_ uiInterstitialLarge uiBoxWhite">
				<div class="uiHeader uiHeaderBottomBorder mhl mts uiHeaderPage interstitialHeader">
					<div class="clearfix uiHeaderTop">
						<div>
							<h2 class="uiHeaderTitle" aria-hidden="true">Tìm tài khoản của bạn</h2>
						</div>
					</div>
				</div>
				<div class="phl ptm uiInterstitialContent">
					<div class="identify_yourself_block">
						<table class="_9nq3">
							<tbody>
								<tr>
									<td>
										<div class="_9nq2 marginBottom16px">Vui lòng nhập email hoặc số di động để tìm kiếm tài khoản của bạn.</div>
									</td>
								</tr>
								<tr>
									<td>
										<input type="email" class="inputtext _9o1w" id="identify_email" name="email" placeholder="Email đăng ký tài khoản" autofocus="1" aria-label="Email hoặc số di động">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<em style="margin-left: 21px;color: red;">${message}</em>
				<div class="hu uiInterstitialBar uiBoxGray topborder" style="margin-bottom: 11px;">
					
					<div class="clearfix">
						<div class="rfloat _ohf" style="margin-left: 289px">
							<a role="button" class="_42ft _4jy0 _9nq1 textPadding20px _4jy3 _517h _51sy" href="/product/index">Hủy</a>
							<button value="1" class="_42ft _4jy0 _9nq0 textPadding20px _4jy3 _4jy1 selected _51sy" type="submit" name="did_submit" id="did_submit">Tìm kiếm</button>
						</div>
						<div class="pts"></div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>