<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css?v=3.2.0">
</head>
<body>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Expandable Table</h3>
				</div>

				<div class="card-body">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>User</th>
								<th>Date</th>
								<th>Status</th>
								<th>Reason</th>
							</tr>
						</thead>
						<tbody>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>183</td>
								<td>John Doe</td>
								<td>11-7-2014</td>
								<td>Approved</td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank
									fatback doner.</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="5">
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book. It has survived not only five centuries, but
										also the leap into electronic typesetting, remaining
										essentially unchanged. It was popularised in the 1960s with
										the release of Letraset sheets containing Lorem Ipsum
										passages, and more recently with desktop publishing software
										like Aldus PageMaker including versions of Lorem Ipsum.</p>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="true">
								<td>219</td>
								<td>Alexander Pierce</td>
								<td>11-7-2014</td>
								<td>Pending</td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank
									fatback doner.</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="5">
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book. It has survived not only five centuries, but
										also the leap into electronic typesetting, remaining
										essentially unchanged. It was popularised in the 1960s with
										the release of Letraset sheets containing Lorem Ipsum
										passages, and more recently with desktop publishing software
										like Aldus PageMaker including versions of Lorem Ipsum.</p>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="true">
								<td>657</td>
								<td>Alexander Pierce</td>
								<td>11-7-2014</td>
								<td>Approved</td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank
									fatback doner.</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="5">
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book. It has survived not only five centuries, but
										also the leap into electronic typesetting, remaining
										essentially unchanged. It was popularised in the 1960s with
										the release of Letraset sheets containing Lorem Ipsum
										passages, and more recently with desktop publishing software
										like Aldus PageMaker including versions of Lorem Ipsum.</p>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>175</td>
								<td>Mike Doe</td>
								<td>11-7-2014</td>
								<td>Denied</td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank
									fatback doner.</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="5">
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book. It has survived not only five centuries, but
										also the leap into electronic typesetting, remaining
										essentially unchanged. It was popularised in the 1960s with
										the release of Letraset sheets containing Lorem Ipsum
										passages, and more recently with desktop publishing software
										like Aldus PageMaker including versions of Lorem Ipsum.</p>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>134</td>
								<td>Jim Doe</td>
								<td>11-7-2014</td>
								<td>Approved</td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank
									fatback doner.</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="5">
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book. It has survived not only five centuries, but
										also the leap into electronic typesetting, remaining
										essentially unchanged. It was popularised in the 1960s with
										the release of Letraset sheets containing Lorem Ipsum
										passages, and more recently with desktop publishing software
										like Aldus PageMaker including versions of Lorem Ipsum.</p>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>494</td>
								<td>Victoria Doe</td>
								<td>11-7-2014</td>
								<td>Pending</td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank
									fatback doner.</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="5">
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book. It has survived not only five centuries, but
										also the leap into electronic typesetting, remaining
										essentially unchanged. It was popularised in the 1960s with
										the release of Letraset sheets containing Lorem Ipsum
										passages, and more recently with desktop publishing software
										like Aldus PageMaker including versions of Lorem Ipsum.</p>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>832</td>
								<td>Michael Doe</td>
								<td>11-7-2014</td>
								<td>Approved</td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank
									fatback doner.</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="5">
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book. It has survived not only five centuries, but
										also the leap into electronic typesetting, remaining
										essentially unchanged. It was popularised in the 1960s with
										the release of Letraset sheets containing Lorem Ipsum
										passages, and more recently with desktop publishing software
										like Aldus PageMaker including versions of Lorem Ipsum.</p>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>982</td>
								<td>Rocky Doe</td>
								<td>11-7-2014</td>
								<td>Denied</td>
								<td>Bacon ipsum dolor sit amet salami venison chicken flank
									fatback doner.</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="5">
									<p>Lorem Ipsum is simply dummy text of the printing and
										typesetting industry. Lorem Ipsum has been the industry's
										standard dummy text ever since the 1500s, when an unknown
										printer took a galley of type and scrambled it to make a type
										specimen book. It has survived not only five centuries, but
										also the leap into electronic typesetting, remaining
										essentially unchanged. It was popularised in the 1960s with
										the release of Letraset sheets containing Lorem Ipsum
										passages, and more recently with desktop publishing software
										like Aldus PageMaker including versions of Lorem Ipsum.</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>

		</div>
	</div>
	
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>
</body>
</html>