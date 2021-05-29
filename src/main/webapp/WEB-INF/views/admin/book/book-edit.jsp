<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="uploadUrl" value="/api/home" />
<c:url var="listBookUrl" value="/admin/book/list" />
<c:url var="ApiUrl" value="/api/book" />
<section id="main-content">
	<section class="wrapper">
		<h3 style="font-weight: bolder;">
	<c:if test="${book.id != null }">
	<i class="fa fa-angle-right"></i> Chỉnh sửa sản phẩm
	</c:if>
	
	<c:if test="${book.id == null }">
	<i class="fa fa-angle-right"></i> Thêm mới sản phẩm
	</c:if>
			
		</h3>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<div class=" form">
						<form class="cmxform form-horizontal style-form" id="formEdit">
							<div class="form-group ">
								<label for="name" class="control-label col-lg-2">Tên Sản
									Phẩm</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="name" name="name" value="${book.name}"/>
								</div>
							</div>
							<div class="form-group ">
								<label for="price" class="control-label col-lg-2"> Giá</label>
								<div class="col-lg-10">
									<input class="form-control" type="number" id="price" name="price" min=0 value="${book.price }"/>
								</div>
							</div>
							<div class="form-group ">
								<label for="productionDay" class="control-label col-lg-2">Ngày Xuất Bản</label>
								<div class="col-lg-10">
									<input class="form-control" type="date" id="productionDay" name="productionDay" value="${book.productionDay}"/>
								</div>
							</div>
							<div class="form-group ">
								<label for="issuingCompany" class="control-label col-lg-2">Công Ty Sản Xuất </label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="issuingCompany" name="issuingCompany" value="${book.issuingCompany}"/>
								</div>
							</div>
							<div class="form-group ">
								<label for="size" class="control-label col-lg-2">Size</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="size" name="size" value="${book.size}" />
								</div>
							</div>
							<div class="form-group ">
								<label for="coverType" class="control-label col-lg-2">Loại Bìa</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="coverType" name="coverType" value="${book.coverType}" />
								</div>
							</div>
							<div class="form-group ">
								<label for="numberOfPages" class="control-label col-lg-2">Số Trang</label>
								<div class="col-lg-10">
									<input class="form-control" type="number" min=0 id="numberOfPages" name="numberOfPages" value="${book.numberOfPages}"/>
								</div>
							</div>
							<div class="form-group ">
								<label for="sku" class="control-label col-lg-2">SKU</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="sku" name="sku" value="${book.sku}"/>
								</div>
							</div>
							<div class="form-group ">
								<label for="productDescription" class="control-label col-lg-2">Mô Tả Sản Phẩm</label>
								<div class="col-lg-10">
									<textarea class="form-control" id="productDescription" name="productDescription">${book.productDescription}</textarea>
								</div>
							</div>
							<div class="form-group col-md-4">
								<label for="inputState">Chọn trạng thái</label> <select
									id="inputState" class="form-control" name="status">
									<option selected>Choose...</option>
									<c:forEach var="item" items="${status}">
										<option value="${item.value }"
											${item.value == book.status  ? 'selected' : '' }>${item.key }</option>
									</c:forEach>

								</select>
							</div>
							<c:if test="${book.id != null}">
								<input type="hidden" name="id" value="${book.id}">
							</c:if>
							<div class="form-group col-md-4" style="    margin-left: 75px;">
								<label for="inputState">Chọn Loại Sách</label> 
								<select id="inputState" class="form-control" name="categoryId">
									<option selected value="">Choose...</option>
									<c:forEach var="item" items="${categoryId}">
										<option value="${item.id }"${item.id == book.categoryId  ? 'selected' : '' }>${item.name }</option>
									</c:forEach>

								</select>
							</div>
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10" style="margin-left: 39%;">
									<button class="btn btn-theme" type="submit" id="editBook">Save</button>
									<c:if test="${book.id > 0}">
										<button class="btn btn-theme04">
											<a href="${listBookUrl}" style="color: white">Quay
												Lại</a>
										</button>
									</c:if>
									<c:if test="${book.id == null}">
										<button class="btn btn-theme04" type="reset">Làm mới
										</button>
									</c:if>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<script>
	/*$(document).ready(function () {
		
	})
	$('#uploadImage').change(function () {
		var files  =$(this)[0].files[0];
		var dataArray ={};
		if (files != undefined){
			var reader = new FileReader();
			reader.onload = function (e) {
				dataArray["base64"] = e.target.result;
				dataArray["name"] = files.name;
				upload(dataArray);
			};
			reader.readAsDataURL(files);
		}
	});
	function upload(data){
		$.ajax({
			url:'${uploadUrl}',
			type:'POST',
			data : JSON.stringify(data),
			contentType :'application/json',
			success : function (res) {
				console.log(res);
			},
			error: function (res){
				console.log(res);
			}
		});
	}
	 */
	 $('#editBook').click(function (e) {
		 e.preventDefault();
		  var data={};
		  var formData = $('#formEdit').serializeArray();  
		  $.each(formData, function (index, v) {
		        data["" + v.name + ""] = v.value;
		    });
		  var id = $('#id').val();
		  var name = $('#name').val();
		  var price = $('#price').val();
		  var issuingCompany = $('#issuingCompany').val();
		  var coverType = $('#coverType').val();
		  var sku = $('#sku').val();
		  var categoryName  =$('#categoryName').val();
		  var status = $('#status').val();
		  if(name != "" && price != "0,0" && issuingCompany !="" && coverType != "" && sku !="" && status !="" && categoryName != "" ){
			  if (data["id"] != null) {
				  editBook(data);
				} else {
					addingBook(data);
				}
		  }else {
			  swal(" Thêm sản phẩm thất bại", " :)", "error");
			}
		});
		function addingBook(data) {
				   $.ajax({
		            type: "POST",
		  		    url: "${ApiUrl}",
		            data: JSON.stringify(data),
		            dataType: "json",
		            contentType: "application/json",
		            success: function (response) {  
		            	swal("Thành công", "Sản phẩm đã được lưa", "success");
		            },
		            error: function (response) {
		            	swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
		            }
		         });
		}
		function editBook(data) {
			   $.ajax({
	            type: "PUT",
	  		    url: "${ApiUrl}",
	            data: JSON.stringify(data),
	            dataType: "json",
	            contentType: "application/json",
	            success: function (response) {  
	            	swal("Thành công", "Sản phẩm đã được lưa", "success");
	            },
	            error: function (response) {
	            	swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
	            }
	         });
	}
</script>
