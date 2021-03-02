<?php
require_once('user-profile-header.php'); 

$page_title = 'Редактирование профиля пользователя';

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
            $statement->execute(array($_SESSION['user']['id']));
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
		$statement = $pdo->prepare("UPDATE tbl_user SET full_name=?, email=?, phone=? WHERE id=?");
		$statement->execute(array($_POST['full_name'],$_POST['email'],$_POST['phone'],$_SESSION['user']['id']));
    	$success_message = 'Информация о пользователе успешно обновлена.';
        
        // updating SESSION user
        $statement = $pdo->prepare("SELECT * FROM tbl_user WHERE id=?");
        $statement->execute(array($_SESSION['user']['id']));
        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
        foreach($result as $row) {
            $_SESSION['user'] = $row;
        }
        
        header("refresh: 0"); 
    }
} // if(isset($_POST['form1'])) {


$statement = $pdo->prepare("SELECT * FROM tbl_user WHERE id=?");
$statement->execute(array($_SESSION['user']['id']));
// $statement->rowCount();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) {
    $full_name = $row['full_name'];
    $email     = $row['email'];
    $phone     = $row['phone'];
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

<form class="form-horizontal" action="" method="post">
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
            <label for="" class="col-sm-2 control-label"></label>
            <div class="col-sm-6">
                <button type="submit" class="btn btn-success pull-left" name="form1">Обновить информацию</button>
            </div>
        </div>
    </div>
</form>

<? require_once('user-profile-footer.php'); ?>