<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
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
	    	// current email address that is in the database
	    	$statement = $pdo->prepare("SELECT * FROM tbl_user WHERE id=?");
			$statement->execute(array($_REQUEST['id']));
			$result = $statement->fetchAll(PDO::FETCH_ASSOC);
			foreach($result as $row) {
				$current_email = $row['email'];
			}

	    	$statement = $pdo->prepare("SELECT * FROM tbl_user WHERE email=? and email!=?");
	    	$statement->execute(array($_POST['email'],$current_email));
	    	$total = $statement->rowCount();							
	    	if($total) {
	    		$valid = 0;
	        	$error_message .= 'Адрес электронной почты уже существует<br>';
	    	}
	    }
    }

    if($valid == 1) {

		// updating the database
		$statement = $pdo->prepare("UPDATE tbl_user SET full_name=?, email=?, phone=?, status=?, role=? WHERE id=?");
		$statement->execute(array($_POST['full_name'],$_POST['email'],$_POST['phone'],$_POST['status'],$_POST['role'],$_REQUEST['id']));

    	$success_message = 'Информация о пользователе успешно обновлена.';
    }
}


if(isset($_POST['form2'])) {
	$valid = 1;

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

    	// updating the database
		$statement = $pdo->prepare("UPDATE tbl_user SET password=? WHERE id=?");
		$statement->execute(array(md5($_POST['password']),$_REQUEST['id']));

    	$success_message = 'Пароль пользователя успешно обновлен.';
    }
}



?>

<?php
if(!isset($_REQUEST['id'])) {
	header('location: logout.php');
	exit;
} else {
	// Check the id is valid or not
	$statement = $pdo->prepare("SELECT * FROM tbl_user WHERE id=?");
	$statement->execute(array($_REQUEST['id']));
	$total = $statement->rowCount();
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);
	if( $total == 0 || $_REQUEST['id'] == 1 ) {
		header('location: logout.php');
		exit;
	}
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Изменить пользователя (администратор)</h1>
	</div>
	<div class="content-header-right">
		<a href="user.php" class="btn btn-primary btn-sm">Показать все</a>
	</div>
</section>


<?php
$statement = $pdo->prepare("SELECT * FROM tbl_user WHERE id=?");
$statement->execute(array($_REQUEST['id']));
$statement->rowCount();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) {
	$full_name = $row['full_name'];
	$email     = $row['email'];
	$phone     = $row['phone'];
	$status    = $row['status'];
}
?>


<section class="content" style="min-height:auto;margin-bottom: -30px;">
	<div class="row">
		<div class="col-md-12">
			<?php if($error_message): ?>
			<div class="callout callout-danger">
			
			<p>
			<?php echo $error_message; ?>
			</p>
			</div>
			<?php endif; ?>

			<?php if($success_message): ?>
			<div class="callout callout-success">
			
			<p><?php echo $success_message; ?></p>
			</div>
			<?php endif; ?>
		</div>
	</div>
</section>

<section class="content">

	<div class="row">
		<div class="col-md-12">

				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab_1" data-toggle="tab">Обновить информацию</a></li>
						<li><a href="#tab_2" data-toggle="tab">Обновить пароль</a></li>
					</ul>
					<div class="tab-content">
          				<div class="tab-pane active" id="tab_1">
							
							<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Имя <span>*</span></label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="full_name" value="<?php echo $full_name; ?>">
										</div>
									</div>									
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Email<span>*</span></label>
										<div class="col-sm-4">
											<input type="email" class="form-control" name="email" value="<?php echo $email; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Телефон </label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="phone" value="<?php echo $phone; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Роль </label>
										<div class="col-sm-4">
											<select name="role">
												<option value="Admin" <?php if(isset($_POST['role']) && $_POST['role'] == 'Admin') { echo selected; }?>>Администратор</option>
												<option value="Publisher" <?php if(isset($_POST['role']) && $_POST['role'] == 'Publisher') { echo selected; }?>>Менеджер</option>
												<option value="User" <?php if(isset($_POST['role']) && $_POST['role'] == 'User') { echo selected; }?>>Пользователь</option>
											</select>
											<input type="text" class="form-control" name="phone" value="<?php if(isset($_POST['phone'])) {echo $_POST['phone'];} ?>">
										</div>
									</div>
							        <div class="form-group">
							            <label for="" class="col-sm-2 control-label">Активный? </label>
							            <div class="col-sm-6">
							                <label class="radio-inline">
							                    <input type="radio" name="status" value="Active" <?php if($status == 'Active') { echo 'checked'; } ?>>Да
							                </label>
							                <label class="radio-inline">
							                    <input type="radio" name="status" value="Inactive" <?php if($status == 'Inactive') { echo 'checked'; } ?>>Нет
							                </label>
							            </div>
							        </div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form1">Обновить информацию</button>
										</div>
									</div>
								</div>
							</div>
							</form>


          				</div>
          				<div class="tab-pane" id="tab_2">

							<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Пароль</label>
										<div class="col-sm-4">
											<input type="password" class="form-control" name="password">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Повторите ввод пароля</label>
										<div class="col-sm-4">
											<input type="password" class="form-control" name="re_password">
										</div>
									</div>
							        <div class="form-group">
										<label for="" class="col-sm-2 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form2">Обновить пароль</button>
										</div>
									</div>
								</div>
							</div>
							</form>

          				</div>
          			</div>
				</div>
			
		</div>
	</div>

</section>

<?php require_once('footer.php'); ?>