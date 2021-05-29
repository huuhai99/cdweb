<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="addCategoryURL" value="/api/category" />
<c:url var="saveURL" value="/admin/category/save" />
<c:url var="listCategoryURL" value="/admin/category/list" />
<section id="main-content">
	<section class="wrapper">
		<h3 style="text-decoration: underline;font-weight: bolder;">
			<i class="fa fa-angle-right"></i> Thêm mới loại sách
		</h3>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<div class=" form">
						<form class="cmxform form-horizontal style-form"
							id="formEditCategory">
							<div class="form-group ">
								<label for="name" class="control-label col-lg-2">Tên
									Loại Sản Phẩm</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="name" name="name"
										value="${category.name }" required="required" />
								</div>
							</div>
							<div class="form-group col-md-4">
								<label for="inputState">Chọn trạng thái</label> <select
									id="inputState" class="inputState" name="status" style="margin-left: 62px;width: 110px;height: 36px;border-radius: 5px;"> 
									<option selected>--Chọn--</option>
									<c:forEach var="item" items="${status}">
										<option value="${item.value }"
											${item.value == category.status  ? 'selected' : '' }>${item.key }</option>
									</c:forEach>

								</select>
							</div>
							<c:if test="${category.id != null}">
								<input type="hidden" name="id" value="${category.id}">
							</c:if>
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10" style="margin-left: 39%;">
									<button class="btn btn-theme" type="submit" id="editCategory">Lưu</button>
									<c:if test="${category.id > 0}">
										<button class="btn btn-theme04">
											<a href="${listCategoryURL}" style="color: white">Quay
												Lại</a>
										</button>
									</c:if>
									<c:if test="${category.id == null}">
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
	$('#editCategory').click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formEditCategory').serializeArray();
		$.each(formData, function(index, v) {
			data["" + v.name + ""] = v.value;
		});
		if (data["id"] != null) {
			editCategory(data);
		}else{
			addCategory(data);
		}

	});
	function addCategory(data) {
		$.ajax({
			type : "POST",
			url : "${addCategoryURL}",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json",
			success : function(result) {
				swal("Thành Công!", "Hãy nhấn vào nút!", "success");
			},
			error : function(error) {
				swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
			}
		});
	}
	function editCategory(data) {
		$.ajax({
			type : "PUT",
			url : "${addCategoryURL}",
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json",
			success : function(result) {
				swal("Thành Công!", "Hãy nhấn vào nút!", "success");
			},
			error : function(error) {
				swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
			}
		});
	}
</script>
