<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="content-wrapper">
		<div class="page-header">
			<h3 class="page-title">
				<span class="page-title-icon bg-gradient-primary text-white me-2">
					<i class="mdi mdi-home"></i>
				</span> Dashboard
			</h3>
			<nav aria-label="breadcrumb">
				<ul class="breadcrumb">
					<li class="breadcrumb-item active" aria-current="page"><span></span>Overview
						<i
						class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
					</li>
				</ul>
			</nav>
		</div>
		<div class="row">
			<div class="col-md-4 stretch-card grid-margin">
				<div class="card bg-gradient-danger card-img-holder text-white">
					<div class="card-body">
						<img src="/assets/images/dashboard/circle.svg"
							class="card-img-absolute" alt="circle-image" />
						<h4 class="font-weight-normal mb-3">
							Month ${month} Sales <i class="mdi mdi-chart-line mdi-24px float-right"></i>
						</h4>
						<h2 class="mb-5">${sumpricemonth} VND</h2>
						<h6 class="card-text">Increased by 60%</h6>
					</div>
				</div>
			</div>
			<div class="col-md-4 stretch-card grid-margin">
				<div class="card bg-gradient-info card-img-holder text-white">
					<div class="card-body">
						<img src="/assets/images/dashboard/circle.svg"
							class="card-img-absolute" alt="circle-image" />
						<h4 class="font-weight-normal mb-3">
							Month Orders <i
								class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
						</h4>
						<h2 class="mb-5">${sumcount}</h2>
						<h6 class="card-text">Decreased by 10%</h6>
					</div>
				</div>
			</div>
			<div class="col-md-4 stretch-card grid-margin">
				<div class="card bg-gradient-success card-img-holder text-white">
					<div class="card-body">
						<img src="/assets/images/dashboard/circle.svg"
							class="card-img-absolute" alt="circle-image" />
						<h4 class="font-weight-normal mb-3">
							Year ${year} Sales <i class="mdi mdi-diamond mdi-24px float-right"></i>
						</h4>
						<h2 class="mb-5">${sumpriceyear} VND</h2>
						<h6 class="card-text">Increased by 5%</h6>
					</div>
				</div>
			</div>
		</div>
		<div class="row">

			<div class="col-lg-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <h4 class="card-title">Money Monthly Chart(VND)</h4>
                    <canvas id="barChart" style="height:230px"></canvas>
                  </div>
                </div>
              </div>
			<div class="col-md-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Traffic Sources</h4>
						<canvas id="doughnutChart" style="height:250px"></canvas>
						<div id="traffic-chart-legend"
							class="rounded-legend legend-vertical legend-bottom-left pt-4"></div>
					</div>
				</div>
			</div>
		</div>

	</div>
