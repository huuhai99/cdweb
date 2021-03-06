<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
    <c:url var="APICartUrl" value="/api/carts" />
	<c:url var="LoginUrl" value="/login" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        <div class="page-content">
         <input type="hidden" value="${userId}" name="userId" id="userId">
        <form action="<c:url value='/web/product'/>" id="formSubmit" method="get">
                <div class="container">
                	<div class="row">
                		<div class="col-lg-9">
                			<div class="toolbox">
                				<div class="toolbox-left">
                					
                				</div><!-- End .toolbox-left -->

                				<div class="toolbox-right">
                					<div class="toolbox-sort">
                						
                					</div><!-- End .toolbox-sort -->
                				</div><!-- End .toolbox-right -->
                			</div><!-- End .toolbox -->

                            <div class="products mb-3">
                                <div class="row justify-content-center">
                            	<h3 class="message" >${message}</h3>
                                	<c:forEach var="item" items="${books}">
                                    <div class="col-6 col-md-4 col-lg-4">
                                        <div class="product product-7 text-center">
                                            <figure class="product-media">
                                                <span class="product-label label-new">New</span>
                                                <a href="<c:url value='/web/product/${item.id}' />">
                                                  <img src="<c:url value='/template/web/assets/images/products/product-4.jpg'/>" alt="Product image" class="product-image">
                                                    
                                                </a>

                                                <div class="product-action-vertical">
                                                    <a href="#" class="btn-product-icon btn-wishlist btn-expandable"><span>add to wishlist</span></a>
                                                    <a href="popup/quickView.html" class="btn-product-icon btn-quickview" title="Quick view"><span>Quick view</span></a>
                                                    <a href="#" class="btn-product-icon btn-compare" title="Compare"><span>Compare</span></a>
                                                </div><!-- End .product-action-vertical -->

                                                <div class="product-action">
                                                    <a  class="btn-product btn-cart" onclick="addCart(${item.id})"><span>add to cart</span></a>
                                                </div><!-- End .product-action -->
                                            </figure><!-- End .product-media -->

                                            <div class="product-body">
                                                <div class="product-cat">
                                                    <a href="<c:url value='/web/product/${item.id}' />">${item.issuingCompany}</a>
                                                </div><!-- End .product-cat -->
                                                <h3 class="product-title"><a href="<c:url value='/web/product/${item.id}' />">${item.name}</a></h3><!-- End .product-title -->
                                                <div class="product-price">
                                                    ${item.price}<span style="margin-left: 7px;"> VND</span>
                                                </div><!-- End .product-price -->
                                                <div class="ratings-container">
                                                    <div class="ratings">
                                                        <div class="ratings-val" style="width: 20%;"></div><!-- End .ratings-val -->
                                                    </div><!-- End .ratings -->
                                                    <span class="ratings-text">( 2 Reviews )</span>
                                                </div><!-- End .rating-container -->

                                                <div class="product-nav product-nav-thumbs">
                                                    <a href="#" class="active">
                                                     <img src="<c:url value='/template/web/assets/images/products/product-4-thumb.jpg'/>" alt="product desc">
                                                    </a>
                                                    <a href="#">
                                                          <img src="<c:url value='/template/web/assets/images/products/product-4-thumb.jpg'/>" alt="product desc">
                                                    </a>

                                                    <a href="#">
                                                         <img src="<c:url value='/template/web/assets/images/products/product-4-thumb.jpg'/>" alt="product desc">
                                                    </a>
                                                </div><!-- End .product-nav -->
                                            </div><!-- End .product-body -->
                                        </div><!-- End .product -->
                                    </div><!-- End .col-sm-6 col-lg-4 -->
                                    </c:forEach>
                                </div><!-- End .row -->
                            </div><!-- End .products -->

                			<nav aria-label="Page navigation" style="margin-left: 240px;">
       						 <ul class="pagination" id="pagination">
       						 
       						 <c:forEach var="i" begin="1" end="${totalPages-1}">
									<c:url var="paging" value="/web/search">
										<c:param name="name" value="${param.name}" />
										<c:param name="categoryId" value="${param.categoryId}" />
										<c:param name="limit" value="10" />
										<c:param name="page" value="${i}" />
									</c:url>
									<c:if test="${ i == currentPage}">
										<li class="page-item active"><a class="page-link"
											href="${paging}">${i}</a></li>
									</c:if>
									<c:if test="${i != currentPage}">
										<li class="page-item"><a class="page-link"
											href="${paging}">${i}</a></li>
									</c:if>
								</c:forEach>
								<li class="page-item-total">of ${totalPages - 1 }</li>
       						 
       						 
       						 </ul>
   						 	</nav>
                		</div><!-- End .col-lg-9 -->
                		<aside class="col-lg-3 order-lg-first">
                			<div class="sidebar sidebar-shop">
                				<div class="widget widget-clean">
                					
                				</div><!-- End .widget widget-clean -->

                				<%-- <div class="widget widget-collapsible">
    								<h3 class="widget-title">
									    <a data-toggle="collapse" href="#widget-1" role="button" aria-expanded="true" aria-controls="widget-1">
									        Danh M???c S???n Ph???m
									    </a>
									</h3><!-- End .widget-title -->

									<div class="collapse show" id="widget-1">
										<div class="widget-body">
											<div class="filter-items filter-items-count">
												<c:forEach var="item" items="${categorys}">
                                            <li class="item-lead" style="margin-left: 25px;"><a href="<c:url value='/web/category/${item.id}'/>" style="color: black;font-size: 19px;">${item.name}</a></li>
                                             </c:forEach>
											</div><!-- End .filter-items -->
										</div><!-- End .widget-body -->
									</div><!-- End .collapse -->
        						</div><!-- End .widget --> --%>

        						<div class="widget widget-collapsible">
    								<h3 class="widget-title">
									    <a data-toggle="collapse" href="#widget-2" role="button" aria-expanded="true" aria-controls="widget-2">
									        Size
									    </a>
									</h3><!-- End .widget-title -->

									<div class="collapse show" id="widget-2">
										<div class="widget-body">
											<div class="filter-items">
												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" name="UpdateButton"  class="custom-control-input" id="size-1">
														<label class="custom-control-label" for="size-1">XS</label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->

												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="size-2">
														<label class="custom-control-label" for="size-2">S</label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->

												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" checked id="size-3">
														<label class="custom-control-label" for="size-3">M</label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->

												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" checked id="size-4">
														<label class="custom-control-label" for="size-4">L</label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->

												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="size-5">
														<label class="custom-control-label" for="size-5">XL</label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->

												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="size-6">
														<label class="custom-control-label" for="size-6">XXL</label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->
											</div><!-- End .filter-items -->
										</div><!-- End .widget-body -->
									</div><!-- End .collapse -->
        						</div><!-- End .widget -->

        						<!-- <div class="widget widget-collapsible">
    								<h3 class="widget-title">
									    <a data-toggle="collapse" href="#widget-3" role="button" aria-expanded="true" aria-controls="widget-3">
									        Colour
									    </a>
									</h3>End .widget-title

									<div class="collapse show" id="widget-3">
										<div class="widget-body">
											<div class="filter-colors">
												<a href="#" style="background: #b87145;"><span class="sr-only">Color Name</span></a>
												<a href="#" style="background: #f0c04a;"><span class="sr-only">Color Name</span></a>
												<a href="#" style="background: #333333;"><span class="sr-only">Color Name</span></a>
												<a href="#" class="selected" style="background: #cc3333;"><span class="sr-only">Color Name</span></a>
												<a href="#" style="background: #3399cc;"><span class="sr-only">Color Name</span></a>
												<a href="#" style="background: #669933;"><span class="sr-only">Color Name</span></a>
												<a href="#" style="background: #f2719c;"><span class="sr-only">Color Name</span></a>
												<a href="#" style="background: #ebebeb;"><span class="sr-only">Color Name</span></a>
											</div>End .filter-colors
										</div>End .widget-body
									</div>End .collapse
        						</div>End .widget -->

        						<div class="widget widget-collapsible">
    								<h3 class="widget-title">
									    <a data-toggle="collapse" href="#widget-4" role="button" aria-expanded="true" aria-controls="widget-4">
									        Brand
									    </a>
									</h3><!-- End .widget-title -->

									<div class="collapse show" id="widget-4">
										<div class="widget-body">
											<div class="filter-items">
												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="brand-1">
														<label class="custom-control-label" for="brand-1">Th??i Lan</label>
													</div><!-- End .custom-checkbox -->
												</div><!-- End .filter-item -->

												<!-- <div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" name="UpdateButton" id="UpdateButton" class="custom-control-input" id="brand-2">
														<label class="custom-control-label" for="brand-2">River Island</label>
													</div>End .custom-checkbox
												</div>End .filter-item

												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="brand-3">
														<label class="custom-control-label" for="brand-3">Geox</label>
													</div>End .custom-checkbox
												</div>End .filter-item

												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="brand-4">
														<label class="custom-control-label" for="brand-4">New Balance</label>
													</div>End .custom-checkbox
												</div>End .filter-item

												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="brand-5">
														<label class="custom-control-label" for="brand-5">UGG</label>
													</div>End .custom-checkbox
												</div>End .filter-item

												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="brand-6">
														<label class="custom-control-label" for="brand-6">F&F</label>
													</div>End .custom-checkbox
												</div>End .filter-item

												<div class="filter-item">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input" id="brand-7">
														<label class="custom-control-label" for="brand-7">Nike</label>
													</div>End .custom-checkbox
												</div>End .filter-item -->

											</div><!-- End .filter-items -->
										</div><!-- End .widget-body -->
									</div><!-- End .collapse -->
        						</div><!-- End .widget -->

        						<div class="widget widget-collapsible">
    								<h3 class="widget-title">
									    <a data-toggle="collapse" href="#widget-5" role="button" aria-expanded="true" aria-controls="widget-5">
									        Price
									    </a>
									</h3><!-- End .widget-title -->

									<div class="collapse show" id="widget-5">
										<div class="widget-body">
                                            <div class="filter-price">
                                                <div class="filter-price-text">
                                                    Price Range:
                                                    <span id="filter-price-range"></span>
                                                </div><!-- End .filter-price-text -->

                                                <div id="price-slider"></div><!-- End #price-slider -->
                                            </div><!-- End .filter-price -->
										</div><!-- End .widget-body -->
									</div><!-- End .collapse -->
        						</div><!-- End .widget -->
                			</div><!-- End .sidebar sidebar-shop -->
                		</aside><!-- End .col-lg-3 -->
                	</div><!-- End .row -->
                </div><!-- End .container -->
                </form>
            </div><!-- End .page-content -->


<script>

$(document).ready(function() {
	  $("#UpdateButton").click(update);
	 
	});

	function update() {
		alert("Check box in Checked");
	}
	function addCart(data) {
		var userId= $('#userId').val();
		if (userId == null || userId =='') {
			window.location.href = "${LoginUrl}";
		}else{
		var id = data;
		   $.ajax({
         type: "POST",
		 url: "${APICartUrl}/"+id,
         data: JSON.stringify(data),
         dataType: "json",
         contentType: "application/json",
         success: function (response) {  
         	swal("Th??nh c??ng", "S???n ph???m ???? ???????c l??a", "success");
         },
         error: function (response) {
        	 swal("Th???t b???i", "S???n ph???m v???n an to??n :)", "error");
         }
      });
		}
}
	</script>
	
	<!-- <script type="text/javascript">
    $(function () {
    	var totalPage = $('#totalPage').val();
    	var  currentPage = $('#page').val();
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 10,
            startPage : currentPage,
            onPageClick: function (event, page) { // 1 2 3
            	if (currentPage != page) {
            		$('#limit').val(10);
					$('#page').val(page); // 1 bam 2 th?? 1 se thanh 2
					$('#formSubmit').submit();
				}
            }
        });
    });
</script> -->


</body>
</html>