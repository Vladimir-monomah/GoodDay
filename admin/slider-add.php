<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

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

	if($valid == 1) {

		// getting auto increment id
		$statement = $pdo->prepare("SHOW TABLE STATUS LIKE 'tbl_slider'");
		$statement->execute();
		$result = $statement->fetchAll();
		foreach($result as $row) {
			$ai_id=$row[10];
		}


		$final_name = 'slider-'.$ai_id.'.'.$ext;
        move_uploaded_file( $path_tmp, '../uploads/'.$final_name );

	
		$statement = $pdo->prepare("INSERT INTO tbl_slider (photo,heading,content,button_text,button_url,order,status) VALUES (?,?,?,?,?,?,?)");
		$statement->execute(array($final_name,$_POST['heading'],$_POST['content'],$_POST['button_text'],$_POST['button_url'],$_POST['slide_order'],$_POST['status']));
			
		$success_message = 'Слайдер успешно добавлен!';

		unset($_POST['heading']);
		unset($_POST['content']);
		unset($_POST['button_text']);
		unset($_POST['button_url']);
		unset($_POST['slide_order']);
	}
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Add Slider</h1>
	</div>
	<div class="content-header-right">
		<a href="slider.php" class="btn btn-primary btn-sm">View All</a>
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
							<label for="" class="col-sm-2 control-label">Photo <span>*</span></label>
							<div class="col-sm-9" style="padding-top:5px">
								<input type="file" name="photo">(Допускаются только jpg, jpeg, gif и png)
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Заголовок</label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="heading" value="<?php if(isset($_POST['heading'])){echo $_POST['heading'];} ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Содержание</label>
							<div class="col-sm-6">
								<textarea class="form-control" name="content" style="height:140px;"><?php if(isset($_POST['content'])){echo $_POST['content'];} ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Текст кнопки</label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="button_text" value="<?php if(isset($_POST['button_text'])){echo $_POST['button_text'];} ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Кнопка URL </label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="button_url" value="<?php if(isset($_POST['button_url'])){echo $_POST['button_url'];} ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Заказ </label>
							<div class="col-sm-2">
								<input type="text" autocomplete="off" class="form-control" name="slide_order" value="<?php if(isset($_POST['slide_order'])){echo $_POST['slide_order'];} ?>">
							</div>
						</div>
				        <div class="form-group">
				            <label for="" class="col-sm-2 control-label">Активный </label>
				            <div class="col-sm-6">
				                <label class="radio-inline">
				                    <input type="radio" name="status" value="Active" checked>Да
				                </label>
				                <label class="radio-inline">
				                    <input type="radio" name="status" value="Inactive">Нет
				                </label>
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