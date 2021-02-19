<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

	if(empty($_POST['name'])) {
		$valid = 0;
		$error_message .= 'Имя не может быть пустым<br>';
	}

	if(empty($_POST['designation'])) {
		$valid = 0;
		$error_message .= 'Обозначение не может быть пустым<br>';
	}

	if(empty($_POST['company'])) {
		$valid = 0;
		$error_message .= 'Название компании не может быть пустым<br>';
	}

	
    $path = $_FILES['photo']['name'];
    $path_tmp = $_FILES['photo']['tmp_name'];

    if($path!='') {
        $ext = pathinfo( $path, PATHINFO_EXTENSION );
        $file_name = basename( $path, '.' . $ext );
        if( $ext!='jpg' && $ext!='png' && $ext!='jpeg' && $ext!='gif' ) {
            $valid = 0;
            $error_message .= 'Вы должны загрузить файл jpg, jpeg, gif или png<br>';
        }
    }

    if(empty($_POST['comment'])) {
		$valid = 0;
		$error_message .= 'Комментарий не может быть пустым<br>';
	}

	if($valid == 1) {

		if($path == '') {
			$statement = $pdo->prepare("UPDATE tbl_testimonial SET name=?, designation=?, company=?, comment=?, testimonial_order=? WHERE id=?");
    		$statement->execute(array($_POST['name'],$_POST['designation'],$_POST['company'],$_POST['comment'],$_POST['testimonial_order'],$_REQUEST['id']));
		} else {

			unlink('../uploads/'.$_POST['current_photo']);

			$final_name = 'testimonial-'.$_REQUEST['id'].'.'.$ext;
        	move_uploaded_file( $path_tmp, '../uploads/'.$final_name );

        	$statement = $pdo->prepare("UPDATE tbl_testimonial SET name=?, designation=?, company=?, photo=?, comment=?, testimonial_order=? WHERE id=?");
    		$statement->execute(array($_POST['name'],$_POST['designation'],$_POST['company'],$final_name,$_POST['comment'],$_POST['testimonial_order'],$_REQUEST['id']));
		}	   

	    $success_message = 'Отзыв успешно обновлен!';
	}
}
?>

<?php
if(!isset($_REQUEST['id'])) {
	header('location: logout.php');
	exit;
} else {
	// Check the id is valid or not
	$statement = $pdo->prepare("SELECT * FROM tbl_testimonial WHERE id=?");
	$statement->execute(array($_REQUEST['id']));
	$total = $statement->rowCount();
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);
	if( $total == 0 ) {
		header('location: logout.php');
		exit;
	}
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Редактировать отзыв</h1>
	</div>
	<div class="content-header-right">
		<a href="testimonial.php" class="btn btn-primary btn-sm">Просмотреть все</a>
	</div>
</section>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_testimonial WHERE id=?");
$statement->execute(array($_REQUEST['id']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);
foreach ($result as $row) {
	$name        = $row['name'];
	$designation = $row['designation'];
	$company     = $row['company'];
	$photo       = $row['photo'];
	$comment     = $row['comment'];
	$testimonial_order  = $row['testimonial_order'];
}
?>

<section class="content">

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

			<form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
				<input type="hidden" name="current_photo" value="<?php echo $photo; ?>">
				<div class="box box-info">
					<div class="box-body">
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Название <span>*</span></label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="name" value="<?php echo $name; ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Обозначение <span>*</span></label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="designation" value="<?php echo $designation; ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Компания <span>*</span></label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="company" value="<?php echo $company; ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Существующая фотография</label>
							<div class="col-sm-9" style="padding-top:5px">
								<img src="../uploads/<?php echo $photo; ?>" alt="Slider Photo" style="width:180px;">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Фото </label>
							<div class="col-sm-6" style="padding-top:5px">
								<input type="file" name="photo">(Допускаются только jpg, jpeg, gif и png)
							</div>
						</div>						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Комментарий <span>*</span></label>
							<div class="col-sm-6">
								<textarea class="form-control" name="comment" style="height:140px;"><?php echo $comment; ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Заказ</label>
							<div class="col-sm-1">
								<input type="text" autocomplete="off" class="form-control" name="testimonial_order" value="<?php echo $testimonial_order; ?>">
							</div>
						</div>	
						<div class="form-group">
							<label for="" class="col-sm-2 control-label"></label>
							<div class="col-sm-6">
								<button type="submit" class="btn btn-success pull-left" name="form1">Сохранить</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</section>

<?php require_once('footer.php'); ?>