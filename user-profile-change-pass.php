<?php
require_once('user-profile-header.php'); 

$page_title = 'Изменение пароля';


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
		$statement->execute(array(md5($_POST['password']),$_SESSION['user_client']['id']));

    	$success_message = 'Пароль пользователя успешно обновлен.';
    }
} // if(isset($_POST['form2'])) {

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

<form class="form-horizontal" action="" method="post">
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
</form>

<? require_once('user-profile-footer.php'); ?>