<?php
require_once('header.php');

$success_message = '';
$error_message1 = '';
$success_message1 = '';

// Current Page Access Level check for all pages
$cur_page = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1);


?>

    <link rel="stylesheet" href="admin/css/bootstrap.min.css">
	<link rel="stylesheet" href="admin/css/font-awesome.min.css">
	<link rel="stylesheet" href="admin/css/ionicons.min.css">
	<link rel="stylesheet" href="admin/css/datepicker3.css">
	<link rel="stylesheet" href="admin/css/all.css">
	<link rel="stylesheet" href="admin/css/select2.min.css">
	<link rel="stylesheet" href="admin/css/dataTables.bootstrap.css">
	<link rel="stylesheet" href="admin/css/jquery.fancybox.css">
	<link rel="stylesheet" href="admin/css/AdminLTE.min.css">
	<link rel="stylesheet" href="admin/css/_all-skins.min.css">
	<link rel="stylesheet" href="admin/css/on-off-switch.css">
	<link rel="stylesheet" href="admin/css/summernote.css">
	<link rel="stylesheet" href="admin/css/style.css">

    <div class="skin-blue">
	<div class="wrapper">

	<?php
		if(!isset($_SESSION['user'])){
			$error_message = 'Необходимо войти в учётную запись';
			echo '<div class="content-wrapper">'
				.'<section class="content">'
				.  '<div class="row">'
				.	  '<div class="col-md-12">'
				."<div class=\"error_message\" style=\"margin-left: 260px;\">"
				.$error_message
				."</div>";
			include('user-profile-footer.php');
			die();
		}
	?>
		<header class="main-header">

			<nav class="navbar navbar-static-top">
				<span style="float:left;line-height:50px;color:#fff;padding-left:15px;font-size:18px;">Пользовательский профиль</span>
			</nav>
		</header>

  		<aside class="main-sidebar">
    		<section class="sidebar">
      
      			<ul class="sidebar-menu">

			        <li class="treeview <?php if($cur_page == 'user-profile.php') {echo 'active';} ?>">
			          <a href="user-profile.php">
			            <i class="fa fa-laptop"></i> <span>Информационная панель</span>
			          </a>
			        </li>

			        <li class="treeview <?php if($cur_page == 'user-profile-edit.php') {echo 'active';} ?>">
			          <a href="user-profile-edit.php">
			            <i class="fa fa-laptop"></i> <span>Редактировать профиль</span>
			          </a>
			        </li>

			        <li class="treeview <?php if($cur_page == 'user-profile-change-pass.php') {echo 'active';} ?>">
			          <a href="user-profile-change-pass.php">
			            <i class="fa fa-laptop"></i> <span>Изменить пароль</span>
			          </a>
			        </li>

			        <li class="treeview <?php if($cur_page == 'logout.php') {echo 'active';} ?>">
			          <a href="logout.php">
			            <i class="fa fa-laptop"></i> <span>Выход</span>
			          </a>
			        </li>

      			</ul>
    		</section>
  		</aside>

  		<div class="content-wrapper">
			<section class="content">
				<div class="row">
					<div class="col-md-12">
					<div class="box box-info">