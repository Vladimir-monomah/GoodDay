<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

	if(empty($_POST['photo_caption'])) {
        $valid = 0;
        $error_message .= "Название фотографии не может быть пустым.<br>";
    }

    $path = $_FILES['photo']['name'];
    $path_tmp = $_FILES['photo']['tmp_name'];

    if($path != '') {
    	$ext = pathinfo( $path, PATHINFO_EXTENSION );
        $file_name = basename( $path, '.' . $ext );
        if( $ext!='jpg' && $ext!='png' && $ext!='jpeg' && $ext!='gif' ) {
            $valid = 0;
            $error_message .= 'Вы должны загрузить файл jpg, jpeg, gif или png<br>';
        }
    }
       
    if($valid == 1) {

    	if($path == '') {
    		// updating into the database
			$statement = $pdo->prepare("UPDATE tbl_photo SET photo_caption=? WHERE photo_id=?");
			$statement->execute(array($_POST['photo_caption'],$_REQUEST['id']));
    	} else {
    		unlink('../uploads/'.$_POST['previous_photo']);

    		$final_name = 'photo-'.$_REQUEST['id'].'.'.$ext;
        	move_uploaded_file( $path_tmp, '../uploads/'.$final_name );

        	// updating into the database
			$statement = $pdo->prepare("UPDATE tbl_photo SET photo_caption=?, photo_name=? WHERE photo_id=?");
			$statement->execute(array($_POST['photo_caption'],$final_name,$_REQUEST['id']));
    	}
    	
    	$success_message = 'Фото успешно обновлено.';
    }
}
?>

<?php
if(!isset($_REQUEST['id'])) {
	header('location: logout.php');
	exit;
} else {
	// Check the id is valid or not
	$statement = $pdo->prepare("SELECT * FROM tbl_photo WHERE photo_id=?");
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
		<h1>Редактировать фото</h1>
	</div>
	<div class="content-header-right">
		<a href="photo.php" class="btn btn-primary btn-sm">Просмотреть все</a>
	</div>
</section>

<?php							
foreach ($result as $row) {
	$photo_caption = $row['photo_caption'];
	$photo_name = $row['photo_name'];
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

				<div class="box box-info">
					<div class="box-body">
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Подпись к фотографии <span>*</span></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="photo_caption" value="<?php echo $photo_caption ?>">
							</div>
						</div>
						<div class="form-group">
				            <label for="" class="col-sm-2 control-label">Существующая фотография</label>
				            <div class="col-sm-6" style="padding-top:6px;">
				                <img src="../uploads/<?php echo $photo_name; ?>" class="existing-photo" style="width:300px;">

				                <input type="hidden" name="previous_photo" value="<?php echo $photo_name; ?>">
				            </div>
				        </div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Загрузить новое фото <span>*</span></label>
							<div class="col-sm-4" style="padding-top:6px;">
								<input type="file" name="photo">
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