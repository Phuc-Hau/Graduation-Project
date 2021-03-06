<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
    <li class="nav-item nav-profile">
      <a href="#" class="nav-link">
        <div class="nav-profile-image">
          <img src="/file/user/${sessionScope.user.img}" style="object-fit: cover;" alt="profile">
          <span class="login-status online"></span>
          <!--change to offline or busy as needed-->
        </div>
        <div class="nav-profile-text d-flex flex-column">
          <span class="font-weight-bold mb-2">${sessionScope.user.cutomer.name}</span>
          <span class="text-secondary text-small">Project Manager</span>
        </div>
        <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/admin/index">
        <span class="menu-title">Dashboard</span>
        <i class="mdi mdi-home menu-icon"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link"  href="/admin/userlist">
        <span class="menu-title">User</span>
         <i class="mdi mdi-account-card-details menu-icon"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="collapse" href="#ui-cart" aria-expanded="false" aria-controls="ui-basic">
        <span class="menu-title">Hàng hóa</span>
        <i class="menu-arrow"></i>
        <i class="mdi mdi-cart"></i>
      </a>
      <div class="collapse" id="ui-cart">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item"> <a class="nav-link" href="/admin/productlist">Danh sách sản phẩm</a></li>
          <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">Danh mục sản phẩm</a></li>
        </ul>
      </div>

    </li>
    <li class="nav-item">
      <a class="nav-link" href="pages/forms/basic_elements.html">
        <span class="menu-title">Hóa đơn</span>
        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="pages/charts/chartjs.html">
        <span class="menu-title">Charts</span>
        <i class="mdi mdi-chart-bar menu-icon"></i>
      </a>
    </li>
   
    
  </ul>
</nav>