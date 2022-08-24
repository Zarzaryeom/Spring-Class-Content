<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약국 매출 현황</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css?v=3.2.0">
<style>
#body2 {
	margin: 100px;
	padding: 0;
	width: 1200px;
	height: 850px;
	border: 1px solid black;
}
label{
	width: 90px;
	margin-left: 10px;
}
input{
	text-align: right;
}
input:read-only{
	background-color: #E5E5E5;
}

table.dataTable>thead>tr>th:not(.sorting_disabled), table.dataTable>thead>tr>td:not(.sorting_disabled){
	padding-right: 0px;
}
table{
	text-align:center;
}
th{
	background-color: #E5E5E5;
}
.number{
	text-align:right;
}
.scrolltbody {
    display: block;
}
.scrolltbody tbody {
    display: block;
    height: 100px;
    overflow: auto;
}
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 402px; }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 152px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 80px; }
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { width: 80px; }
.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { width: 80px; }
.scrolltbody th:nth-of-type(6), .scrolltbody td:nth-of-type(6) { width: 80px; }
.scrolltbody th:nth-of-type(7), .scrolltbody td:nth-of-type(7) { width: 80px; }
.scrolltbody th:nth-of-type(8), .scrolltbody td:nth-of-type(8) { width: 80px; }
.scrolltbody th:nth-of-type(9), .scrolltbody td:nth-of-type(9) { width: 60px; }

.cardTitle{
	background-color:rgb(0, 83, 194); 
	color:white;
	border-radius: 3px;
	padding : 3px;
	
}
</style>

</head>
<body>
<div id="body2">
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="card card-outline">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="card">
						<div class="card-header">
							<span class="cardTitle">검색조건</span>
						</div>
						<div class="card-body">
							<div>
								<label for="chemistName">조제약사</label>
								<select id="chemistName">
									<option>전체약사</option>
									<option>김동글 약사</option>
									<option>아나팜 약사</option>
								</select>
								<button type="button" class="btn btn-outline-dark btn-sm">조회</button>
								<input type="date"> &nbsp;~&nbsp;
								<input type="date">
							</div>
						</div>
					</div>
					<div class="card card-outline">
						<div class="card-header title">
							<span class="cardTitle">항목 합계</span>
							
						</div>
						<div class="card-body">
							<form action="">
								<label for="total_salesCount">총 매출건</label>
								<input type="text" id="total_salesCount" value="13,632" readonly><br/>
								<label for="total_salesFee">총 매출 금액</label>
								<input type="text" id="total_salesFee" value="380,115,886(￦)" readonly><br/>
								<label for="total_compoundingFee">조제료</label>
								<input type="text" id="total_compoundingFee" value="95,404,470(￦)" readonly><br/>
								<label for="total_carge">청구액</label>
								<input type="text" id="total_carge" value="245,927,870(￦)" readonly><br/>
								<label for="total_salesDrugFee">약품판매액</label>
								<input type="text" id="total_salesDrugFee" value="20,243,286(￦)" readonly><br/>
								<label for="total_copay">본인부담금</label>
								<input type="text" id="total_copay" value="91,935,410(￦)" readonly><br/>
								<label for="total_drugFee">약가</label>
								<input type="text" id="total_drugFee" value="532,586(￦)" readonly><br/>
								<label for="total_deposit">입금액</label>
								<input type="text" id="total_deposit" value="134,188,061(￦)" readonly><br/>
								<label for="total_cardPayment">카드 승인</label>
								<input type="text" id="total_cardPayment" value="100,752,120(￦)" readonly><br/>
							</form>
						</div>
					</div>
				</div>

				<div class="col-lg-8">
					<!-- 표가 들어갈 곳 -->
					<div class="card">
						<div class="card-body">
							<div id="example1_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12 col-md-6">
										<div class="dt-buttons btn-group flex-wrap">
											<button class="btn btn-secondary buttons-csv buttons-html5"
												tabindex="0" aria-controls="example1" type="button">
												<span>CSV</span>
											</button>
											<button class="btn btn-secondary buttons-excel buttons-html5"
												tabindex="0" aria-controls="example1" type="button">
												<span>Excel</span>
											</button>
											<button class="btn btn-secondary buttons-pdf buttons-html5"
												tabindex="0" aria-controls="example1" type="button">
												<span>PDF</span>
											</button>
										</div>
									</div>
									<div class="col-sm-12 col-md-6">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<table id="example1" class="table-bordered table-striped dataTable dtr-inline"
											role="grid" aria-describedby="example1_info">
											<thead>
												<tr role="row" style="text-align: center;">
													<th class="inquriy_list" style="width: 90px;">작업일자</th>
													<th class="inquriy_list" style="width: 150px;">구분</th>
													<th class="inquriy_list" style="width: 90px;">환자명</th>
													<th class="inquriy_list" style="width: 120px;">조제약사</th>
													<th class="inquriy_list" style="width: 90px;">약제비/판매액</th>
													<th class="inquriy_list" style="width: 90px;">청구액</th>
													<th class="inquriy_list" style="width: 130px;">본인부담금</th>
													<th class="inquriy_list" style="width: 90px;">입금액</th>
													<th class="inquriy_list" style="width: 90px;">조제료</th>
													<th class="inquriy_list" style="width: 90px;">약가</th>
												</tr>
											</thead>
											<tbody>
												<tr class="odd">
													<td class="dtr-control sorting_1" tabindex="0">20220630</td>
													<td>처방조제</td>
													<td>곽성상</td>
													<td>김동글</td>
													<td class="number">7,780</td>
													<td class="number">6,780</td>
													<td class="number">1,000</td>
													<td class="number">1,000</td>
													<td class="number">7,450</td>
													<td class="number">330</td>
												</tr>
												<tr class="even">
													<td class="dtr-control sorting_1" tabindex="0">20220630</td>
													<td>비처방조제</td>
													<td>김형민</td>
													<td>김동글</td>
													<td class="number">10,620</td>
													<td class="number">7,520</td>
													<td class="number">3,100</td>
													<td class="number">3,100</td>
													<td class="number">7,860</td>
													<td class="number">2,760</td>
												</tr>
												<tr class="odd">
													<td class="dtr-control sorting_1" tabindex="0">20220630</td>
													<td>처방조제</td>
													<td>이슬기</td>
													<td>김동글</td>
													<td class="number">24,200</td>
													<td class="number">17,000</td>
													<td class="number">7,200</td>
													<td class="number">7,200</td>
													<td class="number">6,380</td>
													<td class="number">17,820</td>
												</tr>
												<tr class="even">
													<td class="dtr-control sorting_1" tabindex="0">20220630</td>
													<td>처방조제</td>
													<td>김민지</td>
													<td>김동글</td>
													<td class="number">19,380</td>
													<td class="number">13,580</td>
													<td class="number">5,800</td>
													<td class="number">5,800</td>
													<td class="number">6,380</td>
													<td class="number">13,000</td>
												</tr>
												<tr class="odd">
													<td class="dtr-control sorting_1" tabindex="0">20220630</td>
													<td>비처방조제</td>
													<td>김기웅</td>
													<td>김동글</td>
													<td class="number">8,660</td>
													<td class="number">7,660</td>
													<td class="number">1,000</td>
													<td class="number">1,000</td>
													<td class="number">6,380</td>
													<td class="number">2,280</td>
												</tr>
												<tr class="even">
													<td class="dtr-control sorting_1" tabindex="0">20220629</td>
													<td>처방조제</td>
													<td>이병진</td>
													<td>김동글</td>
													<td class="number">10,480</td>
													<td class="number">8,480</td>
													<td class="number">2,000</td>
													<td class="number">2,000</td>
													<td class="number">6,380</td>
													<td class="number">4,100</td>
												</tr>
												<tr class="odd" style="background:#c4e2ff; background-color:#c4e2ff;">
													<td class="dtr-control sorting_1" tabindex="0">20220629</td>
													<td>처방조제</td>
													<td>오혜지</td>
													<td>아나팜</td>
													<td class="number">12,700</td>
													<td class="number">8,900</td>
													<td class="number">3,800</td>
													<td class="number">3,800</td>
													<td class="number">6,380</td>
													<td class="number">6,320</td>
												</tr>
												<tr class="even">
													<td class="dtr-control sorting_1" tabindex="0">20220629</td>
													<td>..</td>
													<td>..</td>
													<td>..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
												</tr>
												<tr class="odd">
													<td class="dtr-control sorting_1" tabindex="0">20220629</td>
													<td>..</td>
													<td>..</td>
													<td>..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
												</tr>
												<tr class="even">
													<td class="dtr-control sorting_1" tabindex="0">20220629</td>
													<td>..</td>
													<td>..</td>
													<td>..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
												</tr>
												<tr class="odd">
													<td class="dtr-control sorting_1" tabindex="0">20220629</td>
													<td>..</td>
													<td>..</td>
													<td>..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
												</tr>
												<tr class="even">
													<td class="dtr-control sorting_1" tabindex="0">20220629</td>
													<td>..</td>
													<td>..</td>
													<td>..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
												</tr>
												<tr class="odd">
													<td class="dtr-control sorting_1" tabindex="0">20220629</td>
													<td>..</td>
													<td>..</td>
													<td>..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
												</tr>
												<tr class="even">
													<td class="dtr-control sorting_1" tabindex="0">20220629</td>
													<td>..</td>
													<td>..</td>
													<td>..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
													<td class="number">..</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-5">
										<div class="dataTables_info" id="example1_info" role="status"
											aria-live="polite">총 75개 중 1 ~ 14</div>
									</div>
									<div class="col-sm-12 col-md-7">
										<div class="dataTables_paginate paging_simple_numbers"
											id="example1_paginate">
											<ul class="pagination">
												<li class="paginate_button page-item previous disabled"
													id="example1_previous"><a href="#"
													aria-controls="example1" data-dt-idx="0" tabindex="0"
													class="page-link">Previous</a></li>
												<li class="paginate_button page-item active"><a
													href="#" aria-controls="example1" data-dt-idx="1"
													tabindex="0" class="page-link">1</a></li>
												<li class="paginate_button page-item "><a href="#"
													aria-controls="example1" data-dt-idx="2" tabindex="0"
													class="page-link">2</a></li>
												<li class="paginate_button page-item "><a href="#"
													aria-controls="example1" data-dt-idx="3" tabindex="0"
													class="page-link">3</a></li>
												<li class="paginate_button page-item "><a href="#"
													aria-controls="example1" data-dt-idx="4" tabindex="0"
													class="page-link">4</a></li>
												<li class="paginate_button page-item "><a href="#"
													aria-controls="example1" data-dt-idx="5" tabindex="0"
													class="page-link">5</a></li>
												<li class="paginate_button page-item "><a href="#"
													aria-controls="example1" data-dt-idx="6" tabindex="0"
													class="page-link">6</a></li>
												<li class="paginate_button page-item next"
													id="example1_next"><a href="#"
													aria-controls="example1" data-dt-idx="7" tabindex="0"
													class="page-link">Next</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card card-primary card-outline">
						<div class="card-header" style="text-align:center;">
							<h3 class="card-title m-0" style="float: none; font-weight: bold;">(처 방 조 제) 내 역</h3>
						</div>
						<div class="card-body" style="padding: 5px;">
							<table id="example1" class="table-bordered table-striped dataTable dtr-inline scrolltbody"
											role="grid" aria-describedby="example1_info">
								<thead>
									<tr role="row" style="text-align: center;">
										<th class="inquriy_list" style="width: 400px;">약품명</th>
										<th class="inquriy_list" style="width: 150px;">제조회사</th>
										<th class="inquriy_list" style="width: 80px;">유형</th>
										<th class="inquriy_list" style="width: 80px;">급여</th>
										<th class="inquriy_list" style="width: 80px;">1투약</th>
										<th class="inquriy_list" style="width: 80px;">횟수</th>
										<th class="inquriy_list" style="width: 80px;">일수</th>
										<th class="inquriy_list" style="width: 80px;">단가</th>
										<th class="inquriy_list" style="width: 80px;">금액</th>
									</tr>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="dtr-control sorting_1" tabindex="0">
											튜란트캡슐200밀리그램(아세틸시스테인)_(0.2g/1캡)
										</td>
										<td>코오롱제약(주)</td>
										<td>내복</td>
										<td>보험</td>
										<td class="number">1</td>
										<td class="number">3</td>
										<td class="number">3</td>
										<td class="number">81</td>
										<td class="number">729</td>
									</tr>
									<tr class="even">
										<td class="dtr-control sorting_1" tabindex="0">
											에스트렌정(애엽95%에탄올연조엑스(20->1))_(60mg)
										</td>
										<td>삼진제역(주)</td>
										<td>내복</td>
										<td>보험</td>
										<td class="number">1</td>
										<td class="number">3</td>
										<td class="number">3</td>
										<td class="number">124</td>
										<td class="number">1,116</td>
									</tr>
									<tr class="odd">
										<td class="dtr-control sorting_1" tabindex="0">
											슈다페드정(슈도어페드린염산염)_(60mg/1정)
										</td>
										<td>삼일제약(주)</td>
										<td>내복</td>
										<td>보험</td>
										<td class="number">0.5</td>
										<td class="number">2</td>
										<td class="number">3</td>
										<td class="number">23</td>
										<td class="number">69</td>
									</tr>
									<tr class="even">
										<td class="dtr-control sorting_1" tabindex="0">
											세포톡심정(세프포톡심프록세틸)_(0.13g/1정)
										</td>
										<td>한미약품(주)</td>
										<td>내복</td>
										<td>보험</td>
										<td class="number">1</td>
										<td class="number">2</td>
										<td class="number">3</td>
										<td class="number">577</td>
										<td class="number">3,462</td>
									</tr>
									<tr class="odd">
										<td class="dtr-control sorting_1" tabindex="0">
											페미로살정5밀리그램(페미로라스칼륨)_(5mg/1정)
										</td>
										<td>한미약품(주)</td>
										<td>내복</td>
										<td>비보험</td>
										<td class="number">2</td>
										<td class="number">2</td>
										<td class="number">3</td>
										<td class="number">225</td>
										<td class="number">1,350</td>
									</tr>
								</tbody>
									<tfoot>
										<tr>
											<th rowspan="1" colspan="1" style="width: 400px;"></th>
											<th rowspan="1" colspan="1" style="width: 150px;"></th>
											<th rowspan="1" colspan="1" style="width: 80px;"></th>
											<th rowspan="1" colspan="1" style="width: 80px;"></th>
											<th rowspan="1" colspan="1" style="width: 80px;"></th>
											<th rowspan="1" colspan="1" style="width: 80px;"></th>
											<th rowspan="1" colspan="1" style="width: 80px;"></th>
											<th rowspan="1" colspan="1" style="width: 80px;"></th>
											<th rowspan="1" colspan="1" class="number" style="width: 78px;">6,320(￦)</th>
											
										</tr>
									</tfoot>
								</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>


<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jszip/jszip.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/pdfmake/pdfmake.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/pdfmake/vfs_fonts.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

</body>
</html>