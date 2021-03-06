<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

	if(empty($_POST['name'])) {
		$valid = 0;
		$error_message .= 'Название не может быть пустым<br>';
	}

	if(empty($_POST['description'])) {
		$valid = 0;
		$error_message .= 'Описание не может быть пустым<br>';
	}

	$path = $_FILES['photo']['name'];
    $path_tmp = $_FILES['photo']['tmp_name'];

    if($path!='') {
        $ext = pathinfo( $path, PATHINFO_EXTENSION );
        $file_name = basename( $path, '.' . $ext );
        if( $ext!='jpg' && $ext!='png' && $ext!='jpeg' && $ext!='gif' ) {
            $valid = 0;
            $error_message .= 'Вы должны загрузить файл jpg, jpeg, gif или png для избранного фото.<br>';
        }
    } else {
    	$valid = 0;
        $error_message .= 'Вы должны выбрать фотографию для избранного фото<br>';
    }

	if($valid == 1) {

		// getting auto increment id
		$statement = $pdo->prepare("SHOW TABLE STATUS LIKE 'tbl_service'");
		$statement->execute();
		$result = $statement->fetchAll();
		foreach($result as $row) {
			$ai_id=$row[10];
		}

		$final_name = 'service-'.$ai_id.'.'.$ext;
        move_uploaded_file( $path_tmp, '../uploads/'.$final_name );

		$statement = $pdo->prepare("INSERT INTO tbl_service (name,description,photo,service_order,show_on_home) VALUES (?,?,?,?,?)");
		$statement->execute(array($_POST['name'],$_POST['description'],$final_name,$_POST['service_order'],$_POST['show_on_home']));
			
		$success_message = 'Сервис успешно добавлен!';

		unset($_POST['name']);
		unset($_POST['description']);
		unset($_POST['service_order']);
	}
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Добавить сервис</h1>
	</div>
	<div class="content-header-right">
		<a href="service.php" class="btn btn-primary btn-sm">Просмотреть все</a>
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
							<label for="" class="col-sm-2 control-label">Описание <span>*</span></label>
							<div class="col-sm-6">
								<textarea class="form-control" name="description" id="editor1"><?php if(isset($_POST['description'])){echo $_POST['description'];} ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Избранные фото <span>*</span></label>
							<div class="col-sm-9" style="padding-top:5px">
								<input type="file" name="photo">(Допускаются только jpg, jpeg, gif и png)
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Заказ</label>
							<div class="col-sm-1">
								<input type="text" autocomplete="off" class="form-control" name="service_order" value="<?php if(isset($_POST['service_order'])){echo $_POST['service_order'];} ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Показывать страницы? <span>*</span></label>
							<div class="col-sm-6">
								<select name="show_on_home" class="form-control" style="width:auto;">
									<option value="Yes">Да</option>
									<option value="No">Нет</option>
								</select>
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