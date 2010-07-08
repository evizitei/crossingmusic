<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Site Map</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />

<!-- start javascript for header slideshow -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.slideshow.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout(function(){
		$('.imageNavigation').slideShow({
			interval: 3
		});
		},3000);
	});
</script>
<!-- end javascript for header slideshow -->

<!-- start lightbox code -->
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css" type="text/css" />
<script type="text/javascript" src="js/jquery.lightbox-0.5.pack.js"></script>
<script type="text/javascript">
$(function() {
	$('.lightbox').lightBox();
});
</script>
<!-- end lightbox code -->
<!--[if IE 6]>
<style type="text/css">
#menucontainer {
	float:right;
	width: 525px;
}
ul.navigation {
	width:130px;
	margin:5px 0px 0 700px;
    position:absolute;
    float:left;
}
.submenu {
	float:left;
	width:560px;
	margin:7px 0 0 10px;
}
</style>
<![endif]-->
</head>
<body>
<div id="wrapper">
  <div id="header">
    <div id="logo"><img src="images/logo.gif" alt="Logo" /></div>
    <!--end logo-->
    <!--start main menu-->
    <div id="menucontainer">
      <ul>
        <li><a href="index.html">Home <br />
          <span>where it begins</span></a></li>
        <li><a href="about.html">About <br />
          <span>Earth Nature</span></a></li>
        <li><a href="portfolio.html">Portfolio <br />
          <span>my work</span></a></li>
        <li><a href="blog.html">Blog <br />
          <span>Articles &amp; Info</span></a></li>
        <li><a href="contact.html">Contact <br />
          <span>Get in touch</span></a></li>
      </ul>
    </div>
    <!--end main menu-->
  </div>
  <!--end header-->
  <!--start banner-->
  <div id="banner">
    <div class="slide_container">
      <div class="imageNavigation slideShow">
        <ul class="slides" style="height:270px;">
          <li class="slide" style="position:absolute;"><img src="images/banner_home.jpg" width="889" height="270" alt="slide1" /></li>
          <li class="slide" style="position:absolute; display:none;"><img src="images/banner_kookaburra.jpg" border="0" alt="slide2" /></li>
          <li class="slide" style="position:absolute; display:none;"><img src="images/banner_mushrooms.jpg" width="889" height="270" alt="slide3" /></li>
          <li class="slide" style="position:absolute; display:none;"><img src="images/banner_waterfall.jpg" border="0" alt="slide4" /></li>
        </ul>
          <ul class="navigation white">
            <li><a href="javascript:void(0);" class="page selected">1</a></li>
            <li><a href="javascript:void(0);" class="page">2</a></li>
            <li><a href="javascript:void(0);" class="page">3</a></li>
            <li><a href="javascript:void(0);" class="page">4</a></li>
          </ul>
        
      </div>
    </div>
    <div class="menu">
      <div class="icon"><img src="images/icon_camera.gif" alt="Camera" width="30" height="26" /></div>
      <ul class="submenu">
      	<li><a href="#">latest photos</a></li>
        <li><a href="#">Landscape</a></li>
        <li><a href="#">Animals</a></li>
        <li><a href="#">macro</a></li>
        <li><a href="#">urban</a></li>
        <li><a href="#">panoramic</a></li>
        <li class="last"><a href="#">website design</a></li>
       </ul>
    </div>
  </div>
  <!--end banner-->
  <div id="maincontent">
    <div class="left">
     <!--start site map code-->
<h1>Site Map</h1>
<ul>
  <?php
	$files = glob("*.html");
	$ignore_files = array( //add any file names of files you don't want to appear in the site map
		"formsubmit.php",
		"thankyou.html",
	);
	foreach($files as $f){ 
		if(in_array($f,$ignore_files))continue;
		$file_data = file_get_contents($f);
		if(preg_match('/<title>([^<]+)<\/title>/i',$file_data,$matches)){
		$page_title = $matches[1];
		}else{
		$page_title = $f;
		}
		
		?>
  <li><a href="<?=$f;?>">
    <?=$page_title;?>
    </a></li>
  <?
	}
	?>
</ul>
<!--end site map code-->
    </div>
    <!--end left-->
    <!--start right column-->
    <div class="right">
      <!--start side box ABOUT-->
      <div class="side_box">
        <div class="title">About Me</div>
        <div class="about_me_thumb"><img src="images/thumb_me.jpg" alt="Me" /></div>
        <div class="about_me_text">My name is Hayley crook,
          I’m a designer/photographer from the Gold Coast, Australia. <a href="#">Read More</a></div>
        <hr class="clear" />
      </div>
      <!--end side box-ABOUT-->
      <!--start side box TWITTER-->
      <div class="side_box">
        <div class="title" ><div style="float:left; width:100px;">Latest tweets</div><div class="twitter"><img src="images/icon_twitter.gif" alt="twitter" width="45" height="26" /></div>
        </div>
        <!--tweet1-->
        <div class="tweet_text">Just finising off my entry into the PSDTUTS portfolio competition.</div>
        <div class="tweet_date">Posted 2009/09/18</div>
        <!--tweet2-->
        <div class="tweet_text">Photoshoot at the waterfall complete. Can’t wait to check the photos on the computer.</div>
        <div class="tweet_date">Posted 2009/09/18</div>
        <div align="right"><a href="http://www.twitter.com"><img src="images/button_followme.gif" alt="Follow Me" border="0" /></a> </div>
        <hr class="clear" />
      </div>
      <!--end side box TWITTER-->
      <!--start side box PHOTOS-->
      <div class="side_box">
        <div class="title">New Photos</div>
        <ul class="photo_thumb">
        	<li><img src="images/thumb_tiny_1.jpg" alt="1" /></li>
            <li><img src="images/thumb_tiny_2.jpg" alt="2" /></li>
            <li><img src="images/thumb_tiny_3.jpg" alt="3" /></li>
            <li><img src="images/thumb_tiny_4.jpg" alt="4" /></li>
            <li><img src="images/thumb_tiny_5.jpg" alt="5" /></li>
            <li><img src="images/thumb_tiny_6.jpg" alt="6" /></li>
         </ul>
        <hr class="clear" />
      </div>
      <!--end side box PHOTOS-->
      <!--start side box TAGS-->
      <div class="side_box">
        <div class="title">tags</div>
        <ul class="tags">
        	<li><a href="#" class="size18">Animals</a></li>
            <li><a href="#">Landscape</a></li>
            <li><a href="#">Macro</a></li>
            <li><a href="#">Urban</a></li>
            <li><a href="#" class="size13">Panoramic</a></li> 
            <li><a href="#">Website Design</a></li>
            <li><a href="#">Butterfly</a></li>
            <li><a href="#">Lion</a></li>
            <li><a href="#" class="size18">Rhino</a></li>
        </ul>
        <hr class="clear" />
      </div>
      <!--end side box TAGS-->
    </div>
    <!--end right column-->
  </div>
  <!--end main content-->
  <hr class="clear" />
</div>
<div id="footer">
  <div class="left">&copy; Company Name</div>
  <div class="right"><a href="sitemap.php">Site map</a> | <a href="#">Privacy</a> | <a href="contact.html">Contact Us</a></div>
</div>
<!--end footer-->

</body>
</html>
