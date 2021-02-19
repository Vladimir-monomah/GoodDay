<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

	if(empty($_POST['menu_name_and_category_or_page_slug'])) {
        $valid = 0;
        $error_message .= "Вы должны выбрать категорию в качестве названия меню<br>";
    }
    if(empty($_POST['menu_order'])) {
        $valid = 0;
        $error_message .= "Порядок меню не может быть пустым<br>";
    }
    if( $_POST['menu_parent'] == '') {
        $valid = 0;
        $error_message .= "Вы должны выбрать родителя для этого меню<br>";
    }

	if($valid == 1) {

    	$mns = explode(':1:1:',$_POST['menu_name_and_category_or_page_slug']);

		// saving into the database
		$statement = $pdo->prepare("INSERT INTO tbl_menu_footer (menu_type,menu_name,category_or_page_slug,menu_order,menu_url) VALUES (?,?,?,?,?)");
		$statement->execute(array('Category',$mns[0],$mns[1],$_POST['menu_order'],''));

    	$success_message = 'Меню успешно добавлено.';
    }

}
?>


<?php
if(isset($_POST['form2'])) {
	$valid = 1;

	if(empty($_POST['menu_name_and_category_or_page_slug'])) {
        $valid = 0;
        $error_message .= "Вы должны выбрать страницу в качестве имени меню<br>";
    }
    if(empty($_POST['menu_order'])) {
        $valid = 0;
        $error_message .= "Порядок меню не может быть пустым<br>";
    }

	if($valid == 1) {

    	$mns = explode(':1:1:',$_POST['menu_name_and_category_or_page_slug']);

		// saving into the database
		$statement = $pdo->prepare("INSERT INTO tbl_menu_footer (menu_type,menu_name,category_or_page_slug,menu_order,menu_url) VALUES (?,?,?,?,?)");
		$statement->execute(array('Page',$mns[0],$mns[1],$_POST['menu_order'],''));

    	$success_message = 'Меню успешно добавлено.';
    }

}
?>


<?php
if(isset($_POST['form3'])) {
	$valid = 1;

	if(empty($_POST['menu_name'])) {
        $valid = 0;
        $error_message .= "Название меню не может быть пустым<br>";
    }
    if(empty($_POST['menu_order'])) {
        $valid = 0;
        $error_message .= "Порядок меню не может быть пустым<br>";
    }
    if(empty($_POST['menu_url'])) {
        $valid = 0;
        $error_message .= "URL меню не может быть пустым<br>";
    }

	if($valid == 1) {

		// saving into the database
		$statement = $pdo->prepare("INSERT INTO tbl_menu_footer (menu_type,menu_name,category_or_page_slug,menu_order,menu_url) VALUES (?,?,?,?,?)");
		$statement->execute(array('Other',$_POST['menu_name'],'',$_POST['menu_order'],$_POST['menu_url']));

    	$success_message = 'Меню успешно добавлено.';
    }

}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Добавить меню (нижний колонтитул)</h1>
	</div>
	<div class="content-header-right">
		<a href="menu-footer.php" class="btn btn-primary btn-sm">Посмотреть все</a>
	</div>
</section>


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
					<li class="active"><a href="#tab_1" data-toggle="tab">Категория как меню</a></li>
					<li><a href="#tab_2" data-toggle="tab">Страница как меню</a></li>
					<li><a href="#tab_3" data-toggle="tab">Другое меню</a></li>
				</ul>
				<div class="tab-content">
      				<div class="tab-pane active" id="tab_1">


						<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Выберите категорию <span>*</span></label>
										<div class="col-sm-4">
											<select class="form-control select2" name="menu_name_and_category_or_page_slug" style="width:250px;">
												<option value="">Выберите категорию</option>
												<?php
												$statement = $pdo->prepare("SELECT * FROM tbl_category ORDER BY category_name ASC");
												$statement->execute();
												$result = $statement->fetchAll(PDO::FETCH_ASSOC);		
												foreach ($result as $row) {
													echo '<option value="'.$row['category_name'].':1:1:'.$row['category_slug'].'">'.$row['category_name'].'</option>';
												}
												?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Заказ <span>*</span></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" name="menu_order">
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
      				<div class="tab-pane" id="tab_2">


						<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Выбрать страницу <span>*</span></label>
										<div class="col-sm-4">
											<select class="form-control select2" name="menu_name_and_category_or_page_slug" style="width:250px;">
												<option value="">Выберите страницу</option>
												<?php
												$statement = $pdo->prepare("SELECT * FROM tbl_page ORDER BY page_name ASC");
												$statement->execute();
												$result = $statement->fetchAll(PDO::FETCH_ASSOC);		
												foreach ($result as $row) {
													echo '<option value="'.$row['page_name'].':1:1:'.$row['page_slug'].'">'.$row['page_name'].'</option>';
												}
												?>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Заказ <span>*</span></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" name="menu_order">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form2">Сохранить</button>
										</div>
									</div>
								</div>
							</div>
						</form>



      				</div>
      				<div class="tab-pane" id="tab_3">


						<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Название меню <span>*</span></label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="menu_name">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Заказ <span>*</span></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" name="menu_order">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">URL <span>*</span></label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="menu_url">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form3">Сохранить</button>
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