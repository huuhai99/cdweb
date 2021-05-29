<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="uploadUrl" value="/api/home" />
<c:url var="listUserUrl" value="/admin/user/list" />
<c:url var="ApiUrl" value="/api/user" />
<section id="main-content">
	<section class="wrapper">
		<h3 style="font-weight: bolder;">
	<c:if test="${user.id != null }">
	<i class="fa fa-angle-right"></i> Chỉnh Sửa Thông Tin Người Dùng
	</c:if>
	
	<c:if test="${user.id == null }">
	<i class="fa fa-angle-right"></i> Thêm Mới Người Dùng
	</c:if>
			
		</h3>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel">
					<div class=" form">
						<form class="cmxform form-horizontal style-form" id="formEdit">
							<div class="form-group ">
								<label for="fullName" class="control-label col-lg-2">Họ Và Tên </label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="fullName" name="fullName" value="${user.fullName }"/>
								</div>
							</div>
							
							<div class="form-group ">
								<label for="userName" class="control-label col-lg-2">Tên Đăng nhập</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="userName" name="userName" value="${user.userName }"/>
								</div>
								<p class="status" style="margin-left: 180px;color: red;"></p>
							</div>
							
							<div class="form-group ">
								<label for="password" class="control-label col-lg-2">Mật Khẩu</label>
								<div class="col-lg-10">
									<input class="form-control" type="password" id="password" name="password" value="${user.password }"/>
								</div>
								<p class="statusPassword" style="margin-left: 180px;color: red;"></p>
							</div>
							
							
							<div class="form-group ">
								<label for="email" class="control-label col-lg-2"> Email</label>
								<div class="col-lg-10">
									<input class="form-control" type="email" id="email" name="email" min=0 value="${user.email }"/>
								</div>
								<p class="statusEmail" style="margin-left: 180px;color: red;"></p>
							</div>
							<div class="form-group ">
								<label for="phoneNumber" class="control-label col-lg-2">Số Điện Thoại</label>
								<div class="col-lg-10">
									<input class="form-control" type="number" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber }" required="required"/>
								</div>
								<p class="statusphoneNumber" style="margin-left: 180px;color: red;"></p>
							</div>
							<div class="form-group ">
								<label for="address" class="control-label col-lg-2">Địa Chỉ</label>
								<div class="col-lg-10">
									<input class="form-control" type="text" id="address" name="address" value="${user.address }"/>
								</div>
								<p class="statusaddress" style="margin-left: 180px;color: red;"></p>
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
							<c:if test="${user.id != null}">
								<input type="hidden" name="id" value="${user.id}">
							</c:if>
							 <div class="form-group col-md-4" style="    margin-left: 75px;">
								<label for="inputState">Chọn Quyền</label> <select
									id="Role" class="form-control" name="roleId">
									<option selected value="">Choose...</option>
									<c:forEach var="item" items="${role}">
										<option value="${item.id }"${item.id == book.role  ? 'selected' : '' }>${item.name }</option>
									</c:forEach>

								</select>
							</div> 
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10" style="margin-left: 39%;">
									<button class="btn btn-theme" type="submit" id="editUser">Save</button>
									<c:if test="${user.id > 0}">
										<button class="btn btn-theme04">
											<a href="${listUserUrl}" style="color: white">Quay
												Lại</a>
										</button>
									</c:if>
									<c:if test="${user.id == null}">
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
	 $('#editUser').click(function (e) {
		 e.preventDefault();
		  var data={};
		  var formData = $('#formEdit').serializeArray();  
		  $.each(formData, function (index, v) {
		        data["" + v.name + ""] = v.value;
		    });
		  var fullName = $('#fullName').val();
		  var userName = $('#userName').val();
		  var password = $('#password').val();
		  var email = $('#email').val();
		  var phoneNumber = $('#phoneNumber').val();
		  var address = $('#address').val();
		  var Role  =$('#Role').val();
		  var inputState = $('#inputState').val();
		  if(fullName != "" && userName != "" && password !="" && email != "" && phoneNumber !="" && address != "" && Role !="" &&  inputState !="" ){
			  if (data["id"] != null) {
					updateUser(data);
				} else {
					addingUser(data);
				}
		  }else {
			  swal(" Thêm người dùng thất bại", " :)", "error");
			} 
			
			
			
		});
		
		function addingUser(data) {
				   $.ajax({
		            type: "POST",
		  		    url: "${ApiUrl}",
		            data: JSON.stringify(data),
		            dataType: "json",
		            contentType: "application/json",
		            success: function (response) {  
		            	swal("Thành Công!", "Hãy nhấn vào nút!", "success");
		            },
		            error: function (response) {
		            	swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
		            }
		         });
		}
		function updateUser(data) {
			   $.ajax({
	            type: "PUT",
	  		    url: "${ApiUrl}",
	            data: JSON.stringify(data),
	            dataType: "json",
	            contentType: "application/json",
	            success: function (response) {  
	            	swal("Thành Công!", "Hãy nhấn vào nút!", "success");
	            },
	            error: function (response) {
	            	swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
	            }
	         });
	}
		$(document).ready(function() {		
 			$("#userName").blur(function userNameExists() {
				var userName = $("#userName").val();
				if (userName.length > 6 && userName.length < 32) {
					var data = {};
					data["userName"] = userName;
					$.ajax({
						type : "POST",
						url : "/bookstore/admin/user/check",
						contentType : "application/json",
						data : JSON.stringify(data),
						success : function(result) {
							if (result.code == 1) {
								$(".status").html(result.msg);
								
								return false;
							} else {
								$(".status").html(result.msg);
								return true;
								
							}
						},
						error : function(error) {
							swal("Thất bại", "Sản phẩm vẫn an toàn :)", "error");
						}
					});
				} else {
					$(".status").html("<font>Tên đăng nhập phải dài hơn 6 ký tự và nhỏ hơn 32 ký tự.</font>");
					return false;
				}
			});
		
			$("#email").blur(function emailExists() {
				var email = $("#email").val();
					var data = {};
					data["email"] = email;
					$.ajax({
						type : "POST",
						url : "/bookstore/admin/user/checkEmail",
						contentType : "application/json",
						data : JSON.stringify(data),
						success : function(result) {
							if (result.code == 1) {
								$(".statusEmail").html(result.msg);								
								return false;
							} else {
								$(".statusEmail").html(result.msg);
								return true;
							}
						},
						error : function(error) {
							console.log(error);
							alert("error");
						}
					});
			});
			
			$("#password").blur(function password() {
				var password = $("#password").val();
				if (password.length > 6) {
					$(".statusPassword").html("<font>Mật Khẩu hợp lệ</font>");
					return true;
				} else {
					$(".statusPassword").html("<font>Mật khẩu phải dài hơn 6 ký tự.</font>");
					return false;
				}
			});
			$("#phoneNumber").blur(function phoneNumber() {
				var phoneNumber = $("#phoneNumber").val();
				if (phoneNumber.length > 0) {
					$(".statusphoneNumber").html("<font>Mật Khẩu hợp lệ</font>");
					return true;
				} else {
					$(".statusphoneNumber").html("<font>Vui lòng nhập số điện thoại</font>");
					return false;
				}
			});
			$("#address").blur(function address() {
				var address = $("#address").val();
				if (address.length > 0) {
					$(".statusaddress").html("<font>Mật Khẩu hợp lệ</font>");
					return true;
				} else {
					$(".statusaddress").html("<font>Vui lòng nhập địa chỉ</font>");
					return false;
				}
			});
			
		});
		
</script>
