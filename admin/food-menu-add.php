<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

	if(empty($_POST['food_menu_name'])) {
		$valid = 0;
		$error_message .= 'Название меню еды не может быть пустым<br>';
	}

	if(empty($_POST['food_menu_description'])) {
		$valid = 0;
		$error_message .= 'Описание меню еды не может быть пустым<br>';
	}

	if(empty($_POST['food_menu_price'])) {
		$valid = 0;
		$error_message .= 'Цена меню еды не может быть пустой<br>';
	}

	if(empty($_POST['category_id'])) {
		$valid = 0;
		$error_message .= 'Вы должны выбрать категорию<br>';
	}

	$path = $_FILES['food_menu_photo']['name'];
    $path_tmp = $_FILES['food_menu_photo']['tmp_name'];

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

		// getting auto increment id for photo renaming
		$statement = $pdo->prepare("SHOW TABLE STATUS LIKE 'tbl_food_menu'");
		$statement->execute();
		$result = $statement->fetchAll();
		foreach($result as $row) {
			$ai_id=$row[10];
		}

		
		// uploading the photo into the main location and giving it a final name
		$final_name = 'food-menu-'.$ai_id.'.'.$ext;
        move_uploaded_file( $path_tmp, '../uploads/'.$final_name );

        $statement = $pdo->prepare("INSERT INTO tbl_food_menu (food_menu_name,food_menu_description,food_menu_price,food_menu_photo,food_menu_order,category_id) VALUES (?,?,?,?,?,?)");
		$statement->execute(array($_POST['food_menu_name'],$_POST['food_menu_description'],$_POST['food_menu_price'],$final_name,$_POST['food_menu_order'],$_POST['category_id']));
	
		$success_message = 'Меню еды успешно добавлено!';
	}
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Добавить меню еды</h1>
	</div>
	<div class="content-header-right">
		<a href="food-menu.php" class="btn btn-primary btn-sm">Посмотреть все</a>
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
							<label for="" class="col-sm-2 control-label">Название меню еды <span>*</span></label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="food_menu_name">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Описание меню еды <span>*</span></label>
							<div class="col-sm-6">
								<textarea class="form-control" name="food_menu_description" style="height:100px;"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Стоимость меню еды <span>*</span></label>
							<div class="col-sm-1">
								<input type="text" class="form-control" name="food_menu_price">
							</div>
						</div>
						<div class="form-group">
				            <label for="" class="col-sm-2 control-label">Избранные фото</label>
				            <div class="col-sm-6" style="padding-top:6px;">
				                <input type="file" name="food_menu_photo">
				            </div>
				        </div>
				        <div class="form-group">
							<label for="" class="col-sm-2 control-label">Заказ</label>
							<div class="col-sm-1">
								<input type="text" class="form-control" name="food_menu_order">
							</div>
						</div>
						<div class="form-group">
				            <label for="" class="col-sm-2 control-label">Выберите категорию <span>*</span></label>
				            <div class="col-sm-3">
				            	<select class="form-control select2" name="category_id">
				            		<option value="">Выберите категорию</option>
				            		<?php
						            	$i=0;
						            	$statement = $pdo->prepare("SELECT * FROM tbl_category_food_menu ORDER BY category_name ASC");
						            	$statement->execute();
						            	$result = $statement->fetchAll(PDO::FETCH_ASSOC);
						            	foreach ($result as $row) {
						            		?>
											<option value="<?php echo $row['category_id']; ?>"><?php echo $row['category_name']; ?></option>
						            		<?php
						            	}
					            	?>
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