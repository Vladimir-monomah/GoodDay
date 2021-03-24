<?php require_once('header.php'); ?>

<?php
if (isset($_POST['form1'])) {

    $valid = 1;

    if(empty($_POST['full_name'])) {
        $valid = 0;
        $error_message .= "Имя не может быть пустым<br>";
    }

    if(empty($_POST['email'])) {
        $valid = 0;
        $error_message .= 'Адрес электронной почты не может быть пустым<br>';
    } else {
    	if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) === false) {
	        $valid = 0;
	        $error_message .= 'Электронный адрес должен быть действительным<br>';
	    } else {
	    	$statement = $pdo->prepare("SELECT * FROM tbl_user WHERE email=?");
	    	$statement->execute(array($_POST['email']));
	    	$total = $statement->rowCount();							
	    	if($total) {
	    		$valid = 0;
	        	$error_message .= 'Адрес электронной почты уже существует<br>';
	    	}
	    }
    }

    if( empty($_POST['password']) || empty($_POST['re_password']) ) {
        $valid = 0;
        $error_message .= "Пароль не может быть пустым<br>";
    }

    if( !empty($_POST['password']) && !empty($_POST['re_password']) ) {
    	if($_POST['password'] != $_POST['re_password']) {
	    	$valid = 0;
	        $error_message .= "Пароли не соответствуют<br>";	
    	}        
    }

    if($valid == 1) {

		// saving into the database
		$statement = $pdo->prepare("INSERT INTO tbl_user (full_name,email,phone,password,photo,role,status) VALUES (?,?,?,?,?,?,?)");
		$statement->execute(array($_POST['full_name'],$_POST['email'],$_POST['phone'],md5($_POST['password']),'','User','Active'));
    
    	
    	unset($_POST['full_name']);
    	unset($_POST['email']);
    	unset($_POST['phone']);

    	$success_message = 'Регистрация прошла успешно!';
    }
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1 style="margin-left: 227px;">Регистрация пользователя</h1>
	</div>
	<!-- <div class="content-header-right">
		<a href="user.php" class="btn btn-primary btn-sm">Посмотреть все</a>
	</div> -->
</section>


<section class="content">

	<div class="row">
		<div class="col-md-12">

			<?php if($error_message): ?>
			<div class="error_message" style="margin-left: 260px;">
				<?php echo $error_message; ?>
			</div>
			<?php endif; ?>

			<?php if($success_message): ?>
			<div class="callout callout-success">
			
			<p><?php echo $success_message; ?></p>
			</div>
			<?php endif; ?>

			<form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
				<div class="box box-info">
					<div class="box-body">
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Имя <span>*</span></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="full_name" value="<?php if(isset($_POST['full_name'])) {echo $_POST['full_name'];} ?>">
							</div>
						</div>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Email<span>*</span></label>
							<div class="col-sm-4">
								<input type="email" class="form-control" name="email" value="<?php if(isset($_POST['email'])) {echo $_POST['email'];} ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Телефон </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="phone" value="<?php if(isset($_POST['phone'])) {echo $_POST['phone'];} ?>" onkeyup="this.value = this.value.replace(/[^\d]/g,'');">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Пароль <span>*</span></label>
							<div class="col-sm-4">
								<input type="password" class="form-control" name="password">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Повторите ввод пароля <span>*</span></label>
							<div class="col-sm-4">
								<input type="password" class="form-control" name="re_password">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label"></label>
							<div class="col-sm-6">
								<button type="submit" class="btn btn-success pull-left" name="form1">Зарегистрироваться</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</section>

<?php require_once('footer.php'); ?>