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
    } else {
    	$valid = 0;
        $error_message .= 'Вы должны выбрать фото<br>';
    }

    if(empty($_POST['comment'])) {
		$valid = 0;
		$error_message .= 'Комментарий не может быть пустым<br>';
	}

	if($valid == 1) {

		// getting auto increment id
		$statement = $pdo->prepare("SHOW TABLE STATUS LIKE 'tbl_testimonial'");
		$statement->execute();
		$result = $statement->fetchAll();
		foreach($result as $row) {
			$ai_id=$row[10];
		}


		$final_name = 'testimonial-'.$ai_id.'.'.$ext;
        move_uploaded_file( $path_tmp, '../uploads/'.$final_name );

	
		$statement = $pdo->prepare("INSERT INTO tbl_testimonial (name,designation,company,photo,comment,testimonial_order) VALUES (?,?,?,?,?,?)");
		$statement->execute(array($_POST['name'],$_POST['designation'],$_POST['company'],$final_name,$_POST['comment'],$_POST['testimonial_order']));
			
		$success_message = 'Отзыв успешно добавлен!';

		unset($_POST['name']);
		unset($_POST['designation']);
		unset($_POST['company']);
		unset($_POST['comment']);
		unset($_POST['testimonial_order']);
	}
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Добавить отзыв</h1>
	</div>
	<div class="content-header-right">
		<a href="testimonial.php" class="btn btn-primary btn-sm">Просмотреть все</a>
	</div>
</section>


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
				<div class="box box-info">
					<div class="box-body">
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Название <span>*</span></label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="name" value="<?php if(isset($_POST['name'])){echo $_POST['name'];} ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Обозначение <span>*</span></label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="designation" value="<?php if(isset($_POST['designation'])){echo $_POST['designation'];} ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Компания <span>*</span></label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="company" value="<?php if(isset($_POST['company'])){echo $_POST['company'];} ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Фото <span>*</span></label>
							<div class="col-sm-9" style="padding-top:5px">
								<input type="file" name="photo">(Допускаются только jpg, jpeg, gif и png)
							</div>
						</div>						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Комментарий <span>*</span></label>
							<div class="col-sm-6">
								<textarea class="form-control" name="comment" style="height:200px;"><?php if(isset($_POST['comment'])){echo $_POST['comment'];} ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Заказ</label>
							<div class="col-sm-1">
								<input type="text" autocomplete="off" class="form-control" name="testimonial_order" value="<?php if(isset($_POST['testimonial_order'])){echo $_POST['testimonial_order'];} ?>">
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