<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(isset($_GET['action']) && $_GET['action']=="add"){
	$id=intval($_GET['id']);
	if(isset($_SESSION['cart'][$id])){
		$_SESSION['cart'][$id]['quantity']++;
	}else{
		$sql_p="SELECT * FROM products WHERE id={$id}";
		$query_p=mysqli_query($con,$sql_p);
		if(mysqli_num_rows($query_p)!=0){
			$row_p=mysqli_fetch_array($query_p);
			$_SESSION['cart'][$row_p['id']]=array("quantity" => 1, "price" => $row_p['productPrice']);
		
		}else{
			$message="Product ID is invalid";
		}
	}
		echo "<script>alert('Product has been added to the cart')</script>";
		echo "<script type='text/javascript'> document.location ='my-cart.php'; </script>";
}


?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title> Home Page</title>

	    <!-- Bootstrap Core CSS -->
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    
	    <!-- Customizable CSS -->
	    <link rel="stylesheet" href="assets/css/main.css">
	    <link rel="stylesheet" href="assets/css/green.css">
	    <link rel="stylesheet" href="assets/css/owl.carousel.css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css">
	
		<link href="assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<link rel="stylesheet" href="assets/css/rateit.css">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

		
		<link rel="stylesheet" href="assets/css/config.css">

		<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
		<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
		<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
		<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
		<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="assets/images/favicon.ico">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.1.0/remixicon.css"
        integrity="sha512-dUOcWaHA4sUKJgO7lxAQ0ugZiWjiDraYNeNJeRKGOIpEq4vroj1DpKcS3jP0K4Js4v6bXk31AAxAxaYt3Oi9xw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
			
.pro {
    width: 23%;
    min-width: 250px;
    padding: 10px 12px;
    border: 2px solid #cce7d0;
    border-radius: 25px;
    cursor: pointer;
    box-shadow: 20px 20px 30px rgba(0, 0, 0, 0.02);
    margin: 15px 0;
    transition: 0.2s ease-in-out;
    position: relative;

}

.container-pro {
    display: flex;
    justify-content: space-between;
    padding-top: 20px;
    flex-wrap: wrap;
}
.pro:hover {
    box-shadow: 20px 20px 30px rgba(0, 0, 0, 0.07);
}
.image{
    /* border: 2px solid #cce7d0; */
	border-radius: 20px;
	box-shadow: 0px 0px 7px #a8dfaa;
}

.pro img {
    width: 100%;
    border-radius: 20px;
	object-fit: contain;
}

.pro .des {
    text-align: start;
    padding: 10px 0;

}

.pro .des span {
    color: #606063;
    font-size: 12px;
}
.pro .des h5 {
    padding-top: 7px;
    font-size: 14px;
}
.pro .des i {
    font-size: 12px;
    color: rgb(243, 181, 25);
	/* text-align: center; */
	
}
.pro .des i{
	margin-left: 12px;

}
.pro .des h4 {
    padding-top: 7px;
    font-size: 15px;
    font-weight: 700;
    color: #088178;
}
.price-before-discount{
	text-decoration: line-through;
	color: #8f8f98;
}

.pro .cart {
    width: 40px;
    height: 40px;
    line-height: 40px;
    border-radius: 50px;
    background-color: #e8f6ea;
    font-weight: 500;
    color: #088178;
    border: 1px solid #cce7d0;
    position: absolute;
    bottom: 20px;
    right: 15px;
	margin-left: 200px;

}

.sm-banner {
    padding: 40px 80px;
    display: flex;
	flex-direction: column;
    justify-content: space-around;
    flex-wrap: nowrap;

}

.sm-banner .banner-box {
    margin: 40px 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    padding: 30px;
    /* text-align: center; */
    background-image: url("./assets//images//banners//banner6.jpg");
    min-width: 590px;
    height: 50vh;
    background-size: cover;
    background-position: center;

}

.sm-banner .banner-boxes {
    background-image: url("./assets//images//banners//banner7.jpg");
}

.sm-banner h4 {
    color: white;
    font-size: 20px;
    font-weight: 300;
}

.sm-banner h1 {
    color: white;
    font-size: 35px;
    font-weight: 800;
}

.sm-banner span {
    color: white;
    font-size: 18 px;
    font-weight: 500;
    padding-bottom: 15px;
}

.sm-banner button {

    font-size: '13px';
    font-weight: 600;
    padding: 11px 18px;
    color: white;
    background-color: transparent;
    cursor: pointer;
    border: 1px solid white;
    outline: none;
    transition: 0.2s;
}

.banner-box:hover button {
    background-color: #088178;
    border: 1px solid #088178;
}
		</style>

	</head>
    <body class="cnt-home">
	
		

<header class="header-style-1">
<?php include('includes/top-header.php');?>
<?php include('includes/main-header.php');?>
<?php include('includes/menu-bar.php');?>
</header>

<div class="body-content outer-top-xs" id="top-banner-and-menu">
	<div class="container">
		<div class="furniture-container homepage-container">

		<div id="hero" class="homepage-slider3">
	<div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
		<div class="full-width-slider">	
			<div class="item" style="background-image: url(assets/images/sliders/4661882_2456565.jpg);">
				<!-- /.container-fluid -->
			</div><!-- /.item -->
		</div><!-- /.full-width-slider -->
	    
	    <div class="full-width-slider">
			<div class="item full-width-slider" style="background-image: url(assets/images/sliders/4661882_2456565\ -\ Copy.jpg);">
			</div><!-- /.item -->
		</div><!-- /.full-width-slider -->

	</div><!-- /.owl-carousel -->
</div>
		

		<div class="info-boxes wow fadeInUp">
	<div class="info-boxes-inner">
		<div class="row">
			<div class="col-md-6 col-sm-4 col-lg-4">
				<div class="info-box">
					<div class="row">
						<div class="col-xs-2">
						     <i class="icon fa fa-dollar"></i>
						</div>
						<div class="col-xs-10">
							<h4 class="info-box-heading green">money back</h4>
						</div>
					</div>	
					<h6 class="text">30 Day Money Back Guarantee.</h6>
				</div>
			</div><!-- .col -->

			<div class="hidden-md col-sm-4 col-lg-4">
				<div class="info-box">
					<div class="row">
						<div class="col-xs-2">
							<i class="icon fa fa-truck"></i>
						</div>
						<div class="col-xs-10">
							<h4 class="info-box-heading orange">free shipping</h4>
						</div>
					</div>
					<h6 class="text">free ship-on oder over Rs. 600.00</h6>	
				</div>
			</div><!-- .col -->

			<div class="col-md-6 col-sm-4 col-lg-4">
				<div class="info-box">
					<div class="row">
						<div class="col-xs-2">
							<i class="icon fa fa-gift"></i>
						</div>
						<div class="col-xs-10">
							<h4 class="info-box-heading red">Special Sale</h4>
						</div>
					</div>
					<h6 class="text">All items-sale up to 20% off </h6>	
				</div>
			</div><!-- .col -->
		</div><!-- /.row -->
	</div><!-- /.info-boxes-inner -->
	
</div><!-- /.info-boxes -->
		
			<div class="sections prod-slider-small outer-top-small">
				<div class="row">
					<div class="col-md-12">
	                   <section class="section">
	                   	<h3 class="section-title">Populer</h3>
	                   	<div class="owl-carousel homepage-owl-carousel custom-carousel outer-top-xs owl-theme" data-item="4">
	   
<?php
$ret=mysqli_query($con,"select * from products where category=7");
while ($row=mysqli_fetch_array($ret)) 
{
?>




		<div class="item item-carousel">
<div class="container-pro">
            <div class="pro">
				<div class="image">
					<a href="product-details.php?pid=<?php echo htmlentities($row['id']);?>"><img  src="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage1']);?>" data-echo="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage1']);?>"  width="200" height="250"></a>
				</div>
                <div class="des">
                    <h5><a href="product-details.php?pid=<?php echo htmlentities($row['id']);?>"><?php echo htmlentities($row['productName']);?></a></h5>
                    <div class="rating rateit-small"></div>
                    <div class="product-price">	
						<span class="price">
							Rs. <?php echo htmlentities($row['productPrice']);?>		
						<span>
						<span class="price-before-discount">Rs.<?php echo htmlentities($row['productPriceBeforeDiscount']);?></span>
					</div>
                </div>
				
					<?php if($row['productAvailability']=='In Stock'){?>
					<div class="action"><a href="index.php?page=product&action=add&id=<?php echo $row['id']; ?>" ><i class="ri-shopping-cart-2-fill cart text-center"></i></a></div>
				<?php } else {?>
						<div class="action" style="color:red">Out of Stock</div>
					<?php } ?>
            
            </div>
</div>


		</div>





<?php }?>

	
			                   	</div>
	                   </section>
					</div>
					
				</div>
			</div>

		<section class="sm-banner">
        <div class="banner-box">
            <h4>crazy deals</h4>
            <h1>buy 1 get 1 free</h1>
            <span>The best Classic dess is on sale at cara</span>
            <button> Learn More</button>
        </div>
        <div class="banner-box banner-boxes">
            <h4>spring/summer</h4>
            <h1>upcomming season</h1>
            <span>The best Classic dess is on sale at cara</span>
            <button> Collection</button>
        </div>
    </section>
		

	<section class="section featured-product inner-xs wow fadeInUp">
		<h3 class="section-title">Accessories</h3>
		<div class="owl-carousel best-seller custom-carousel owl-theme outer-top-xs">
			<?php
$ret=mysqli_query($con,"select * from products where category=10");
while ($row=mysqli_fetch_array($ret)) 
{



?>
				<div class="item">
				<div class="container-pro">
            <div class="pro">
				<div class="image">
					<a href="product-details.php?pid=<?php echo htmlentities($row['id']);?>"><img  src="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage1']);?>" data-echo="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage1']);?>"  width="200" height="250"></a>
				</div>
                <div class="des">
                    <h5><a href="product-details.php?pid=<?php echo htmlentities($row['id']);?>"><?php echo htmlentities($row['productName']);?></a></h5>
                    <div class="rating rateit-small"></div>
                    <div class="product-price">	
						<span class="price">
							Rs. <?php echo htmlentities($row['productPrice']);?>		
						<span>
						<span class="price-before-discount">Rs.<?php echo htmlentities($row['productPriceBeforeDiscount']);?></span>
					</div>
                </div>
				
					<?php if($row['productAvailability']=='In Stock'){?>
					<div class="action"><a href="index.php?page=product&action=add&id=<?php echo $row['id']; ?>" ><i class="ri-shopping-cart-2-fill cart text-center"></i></a></div>
				<?php } else {?>
						<div class="action" style="color:red">Out of Stock</div>
					<?php } ?>
            
            </div>
</div>
					
				</div><?php } ?>
							</div>
		</section>
<?php include('includes/brands-slider.php');?>
</div>
</div>
<?php include('includes/footer.php');?>
	
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	
	<script src="assets/js/bootstrap.min.js"></script>
	
	<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	
	<script src="assets/js/echo.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/bootstrap-slider.min.js"></script>
    <script src="assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
	<script src="assets/js/scripts.js"></script>

	
	<script src="switchstylesheet/switchstylesheet.js"></script>
	
	<script>
		$(document).ready(function(){ 
			$(".changecolor").switchstylesheet( { seperator:"color"} );
			$('.show-theme-options').click(function(){
				$(this).parent().toggleClass('open');
				return false;
			});
		});

		$(window).bind("load", function() {
		   $('.show-theme-options').delay(2000).trigger('click');
		});
	</script>
	

	

</body>
</html>