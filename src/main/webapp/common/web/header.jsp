<%@ page import="springmvc.Utils.SecurityUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
    <c:url var="searchUrl" value="/web/api/search" />
    <c:url var="detailUrl" value="/web/search" />
<!DOCTYPE html>
<html>
<head>
 <style>
  #result {
	   position: absolute;
	   width: 100%;
	   max-width:870px;
	   cursor: pointer;
	   overflow-y: auto;
	   max-height: 400px;
	   box-sizing: border-box;
	   z-index: 1001;
  }
  
  #result li {
  		color: green;
  		font-size: 16px;
  }
  .link-class:hover{
   background-color:#f1f1f1;
   color: red;
  }
  </style>
<title>Insert title here</title>
</head>
<body>

   <header class="header header-12">
                <div class="header-top">
                    <div class="container">
                        <div class="header-right">

                            <ul class="top-menu">
                                <li>
                                    <ul class="dropdown-links">
                                        <li>
                                     <security:authorize access="isAuthenticated()">
										  <a  href="<c:url value='/web/logout'/>" >LogOut</a>
										</security:authorize>
										
										<security:authorize access="isAnonymous()">
									 <a  href="<c:url value='/login'/>" >Sign in / Sign up</a>
									 </security:authorize>
									
                                        </li>
                                    </ul>
                                </li>
                            </ul><!-- End .top-menu -->
                        </div><!-- End .header-right -->

                    </div><!-- End .container -->
                </div><!-- End .header-top -->

            <div class="header-middle">
                <div class="container">
                    <div class="header-left">
                        <button class="mobile-menu-toggler">
                            <span class="sr-only">Toggle mobile menu</span>
                            <i class="icon-bars"></i>
                        </button>

                        <a href="<c:url value='/web/home'/>" class="logo">
                            <img src="<c:url value='/template/web/assets/images/demos/demo-20/logo.png'/>" alt="Molla Logo" width="105" height="25">
                        </a>
                    </div><!-- End .header-left -->

                    <div class="header-right">
                        <div class="header-search header-search-extended header-search-visible header-search-no-radius">
                            <a href="#" class="search-toggle" role="button"><i class="icon-search"></i></a>
                            <form action="<c:url value='/web/search'/>"  method="get">
                                <div class="header-search-wrapper search-wrapper-wide">
                                    <label for="q" class="sr-only">Tìm Kiếm</label>
                                    <input type="search" class="form-control" name="name" id="name" placeholder="Tìm kiếm Sản Phẩm...." required autocomplete="off">
                                    <div class="select-custom">
                                        <select  name="categoryName">
                                            <!-- <option value="">Thể Loại</option> -->
                                            <c:forEach var="item" items="${categorys}">
                                           <option value="${item.name }" ${item.name == book.categoryName  ? 'selected' : '' }>${item.name }</option>
                                             </c:forEach>
                                            
                                        </select>
                                    </div><!-- End .select-custom -->
                                    <button class="btn btn-primary" type="submit"><i class="icon-search"></i></button>
                                </div><!-- End .header-search-wrapper -->
                              <ul class="list-group" id="result">
                              	<!-- <li class="list-group link-class">'+value.name+'</li> -->
                              </ul>
   								<br/>
                            <input type="hidden"  id="page" name="page" value="${currentPage}"/>
							<input type="hidden"  id="limit" name="limit"/>
							<input type="hidden"  id="totalPage" value="${totalPages}"/>
                          
                            </form>
                        </div><!-- End .header-search -->
                        
                        <div class="header-dropdown-link">
                            <div class="account">
                            <c:if test="${userId != null }">
                            
                               <a href="<c:url value='account/${userId}' />" title="My account">
                                    <div class="icon">
                                        <i class="icon-user"></i>
                                    </div>
                                    <p><%=SecurityUtils.getPrincipal().getFullName()%></p>
                                </a>
							</c:if>
							
							 <c:if test="${userId == null }">
                            
                               <a href="<c:url value='/account/${userId}'/>" title="My account" style = "visibility: hidden;">
                                </a>
							</c:if>
                             
                            </div><!-- End .compare-dropdown -->

                            <div class="wishlist">
                                <a href="wishlist.html" title="Wishlist">
                                    <div class="icon">
                                        <i class="icon-heart-o"></i>
                                        <span class="wishlist-count badge">3</span>
                                    </div>
                                    <p>Wishlist</p>
                                </a>
                            </div><!-- End .compare-dropdown -->

                            <div class="dropdown cart-dropdown">
                                <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
                                    <div class="icon">
                                        <i class="icon-shopping-cart"></i>
                                        <span class="cart-count">2</span>
                                    </div>
                                    <p>Cart</p>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right">
                                    <div class="dropdown-cart-products">
                                        <div class="product">
                                            <div class="product-cart-details">
                                                <h4 class="product-title">
                                                    <a href="product.html">Beige knitted elastic runner shoes</a>
                                                </h4>

                                                <span class="cart-product-info">
                                                    <span class="cart-product-qty">1</span>
                                                    x $84.00
                                                </span>
                                            </div><!-- End .product-cart-details -->

                                            <figure class="product-image-container">
                                                <a href="product.html" class="product-image">
                                                
                                                    <img src="<c:url value='/template/web/assets/images/products/cart/product-1.jpg'/>" alt="product">
                                                </a>
                                            </figure>
                                            <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                        </div><!-- End .product -->

                                        <div class="product">
                                            <div class="product-cart-details">
                                                <h4 class="product-title">
                                                    <a href="product.html">Blue utility pinafore denim dress</a>
                                                </h4>

                                                <span class="cart-product-info">
                                                    <span class="cart-product-qty">1</span>
                                                    x $76.00
                                                </span>
                                            </div><!-- End .product-cart-details -->

                                            <figure class="product-image-container">
                                                <a href="product.html" class="product-image">
                                                
                                                    <img src="<c:url value='/template/web/assets/images/products/cart/product-2.jpg'/>" alt="product">
                                                </a>
                                            </figure>
                                            <a href="#" class="btn-remove" title="Remove Product"><i class="icon-close"></i></a>
                                        </div><!-- End .product -->
                                    </div><!-- End .cart-product -->

                                    <div class="dropdown-cart-total">
                                        <span>Total</span>

                                        <span class="cart-total-price">$160.00</span>
                                    </div><!-- End .dropdown-cart-total -->

                                    <div class="dropdown-cart-action">
                                        <a href="cart.html" class="btn btn-primary">View Cart</a>
                                        <a href="checkout.html" class="btn btn-outline-primary-2"><span>Checkout</span><i class="icon-long-arrow-right"></i></a>
                                    </div><!-- End .dropdown-cart-total -->
                                </div><!-- End .dropdown-menu -->
                            </div><!-- End .cart-dropdown -->
                        </div>
                    </div><!-- End .header-right -->
                </div><!-- End .container -->
            </div><!-- End .header-middle -->

            <div class="header-bottom sticky-header">
                <div class="container">
                    <div style="background-color: #333; display: flex; width: 100%;">   
                        <div class="header-left">
                            <div class="dropdown category-dropdown">
                                <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static" title="Browse Categories">
                                    Danh Mục Sản Phẩm
                                </a>

                                <div class="dropdown-menu">
                                
                                    <nav class="side-nav">
                                        <ul class="menu-vertical sf-arrows">
                                        	<c:forEach var="item" items="${categorys}">
                                            <li class="item-lead"><a href="<c:url value='/web/category/${item.id}?page=1&limit=10'/>">${item.name}</a></li>
                                             </c:forEach>
                                        </ul><!-- End .menu-vertical -->
                                    </nav><!-- End .side-nav -->
                                </div><!-- End .dropdown-menu -->
                            </div><!-- End .category-dropdown -->
                        </div><!-- End .header-left -->

                        <div class="header-center">
                            
                            <nav class="main-nav">
                                <ul class="menu sf-arrows">
                                    <li class="megamenu-container active">
                                        <a href="<c:url value='/web/home'/>">Trang chủ</a>
                                    </li>
                                    <li>
                                        <a href="<c:url value='/web/product?page=1&limit=10'/>" class="sf-with-ul">Sản Phẩm</a>

                                    </li>
                                    <li>
                                        <a href="product.html" class="sf-with-ul">Product</a>

                                        <div class="megamenu megamenu-sm">
                                            <div class="row no-gutters">
                                                <div class="col-md-6">
                                                    <div class="menu-col">
                                                        <div class="menu-title">Product Details</div><!-- End .menu-title -->
                                                        <ul>
                                                            <li><a href="product.html">Default</a></li>
                                                            <li><a href="product-centered.html">Centered</a></li>
                                                            <li><a href="product-extended.html"><span>Extended Info<span class="tip tip-new">New</span></span></a></li>
                                                            <li><a href="product-gallery.html">Gallery</a></li>
                                                            <li><a href="product-sticky.html">Sticky Info</a></li>
                                                            <li><a href="product-sidebar.html">Boxed With Sidebar</a></li>
                                                            <li><a href="product-fullwidth.html">Full Width</a></li>
                                                            <li><a href="product-masonry.html">Masonry Sticky Info</a></li>
                                                        </ul>
                                                    </div><!-- End .menu-col -->
                                                </div><!-- End .col-md-6 -->

                                                <div class="col-md-6">
                                                    <div class="banner banner-overlay">
                                                        <a href="category.html">
                                                            < src="assets/images/menu/banner-2.jpg" alt="Banner">

                                                            <div class="banner-content banner-content-bottom">
                                                                <div class="banner-title text-white">New Trends<br><span><strong>spring 2019</strong></span></div><!-- End .banner-title -->
                                                            </div><!-- End .banner-content -->
                                                        </a>
                                                    </div><!-- End .banner -->
                                                </div><!-- End .col-md-6 -->
                                            </div><!-- End .row -->
                                        </div><!-- End .megamenu megamenu-sm -->
                                    </li>
                                    <li>
                                        <a href="#" class="sf-with-ul">Pages</a>

                                        <ul>
                                            <li>
                                                <a href="about.html" class="sf-with-ul">About</a>

                                                <ul>
                                                    <li><a href="about.html">About 01</a></li>
                                                    <li><a href="about-2.html">About 02</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="contact.html" class="sf-with-ul">Contact</a>

                                                <ul>
                                                    <li><a href="contact.html">Contact 01</a></li>
                                                    <li><a href="contact-2.html">Contact 02</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="login.html">Login</a></li>
                                            <li><a href="faq.html">FAQs</a></li>
                                            <li><a href="404.html">Error 404</a></li>
                                            <li><a href="coming-soon.html">Coming Soon</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="blog.html" class="sf-with-ul">Blog</a>

                                        <ul>
                                            <li><a href="blog.html">Classic</a></li>
                                            <li><a href="blog-listing.html">Listing</a></li>
                                            <li>
                                                <a href="#">Grid</a>
                                                <ul>
                                                    <li><a href="blog-grid-2cols.html">Grid 2 columns</a></li>
                                                    <li><a href="blog-grid-3cols.html">Grid 3 columns</a></li>
                                                    <li><a href="blog-grid-4cols.html">Grid 4 columns</a></li>
                                                    <li><a href="blog-grid-sidebar.html">Grid sidebar</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="#">Masonry</a>
                                                <ul>
                                                    <li><a href="blog-masonry-2cols.html">Masonry 2 columns</a></li>
                                                    <li><a href="blog-masonry-3cols.html">Masonry 3 columns</a></li>
                                                    <li><a href="blog-masonry-4cols.html">Masonry 4 columns</a></li>
                                                    <li><a href="blog-masonry-sidebar.html">Masonry sidebar</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="#">Mask</a>
                                                <ul>
                                                    <li><a href="blog-mask-grid.html">Blog mask grid</a></li>
                                                    <li><a href="blog-mask-masonry.html">Blog mask masonry</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="#">Single Post</a>
                                                <ul>
                                                    <li><a href="single.html">Default with sidebar</a></li>
                                                    <li><a href="single-fullwidth.html">Fullwidth no sidebar</a></li>
                                                    <li><a href="single-fullwidth-sidebar.html">Fullwidth with sidebar</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="elements-list.html" class="sf-with-ul">Elements</a>

                                        <ul>
                                            <li><a href="elements-products.html">Products</a></li>
                                            <li><a href="elements-typography.html">Typography</a></li>
                                            <li><a href="elements-titles.html">Titles</a></li>
                                            <li><a href="elements-banners.html">Banners</a></li>
                                            <li><a href="elements-product-category.html">Product Category</a></li>
                                            <li><a href="elements-video-banners.html">Video Banners</a></li>
                                            <li><a href="elements-buttons.html">Buttons</a></li>
                                            <li><a href="elements-accordions.html">Accordions</a></li>
                                            <li><a href="elements-tabs.html">Tabs</a></li>
                                            <li><a href="elements-testimonials.html">Testimonials</a></li>
                                            <li><a href="elements-blog-posts.html">Blog Posts</a></li>
                                            <li><a href="elements-portfolio.html">Portfolio</a></li>
                                            <li><a href="elements-cta.html">Call to Action</a></li>
                                            <li><a href="elements-icon-boxes.html">Icon Boxes</a></li>
                                        </ul>
                                    </li>
                                </ul><!-- End .menu -->
                            </nav><!-- End .main-nav -->
                        </div>

                        <div class="header-right">
                            <i class="la la-lightbulb-o"></i><p>Clearance Up to 30% Off</p>
                        </div><!-- End .header-right -->
                    </div>
                </div><!-- End .container -->
            </div><!-- End .header-bottom -->
        </header><!-- End .header -->
	
	<script>
	 $('#name').keyup(function (e){
		e.preventDefault();
		$('#result').empty();
		var search = $('#name').val();
		if(search.length > 0){
			$.ajax({
				url : '${searchUrl}',
				type :'POST',
				data : {
					'name' : search,
				},
				success : function(data){
					$.each(data, function (key, value) {
                        $('#result').append('<a href="${detailUrl}?name='+ value.name +'&categoryName='+value.categoryName+'" ><li class="list-group-item link-class">'+value.name+'</li></a>'); 
                 	});
				},
				error : function(error){
					console.log(error)
					alert("Lỗi hệ thống");
				}
			});
		}
		/*  $(window).click(function () {
			    $('#result').empty();
			}); */
		 
		 $('#name').focusout(function () {
			    $(window).click(function () {
			        $('#result').empty();
			    });
			});
	}); 
	</script>

</body>
</html>