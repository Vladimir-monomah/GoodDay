<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	
	$valid = 1;

    if(empty($_POST['category_name'])) {
        $valid = 0;
        $error_message .= "Название категории не может быть пустым<br>";
    }

    if($valid == 1) {

		// Saving data into the main table tbl_category
		$statement = $pdo->prepare("INSERT INTO tbl_category_food_menu (category_name,category_order) VALUES (?,?)");
		$statement->execute(array($_POST['category_name'],$_POST['category_order']));
	
    	$success_message = 'Категория меню еды добавлена успешно.';
    }
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Добавить категорию меню еды</h1>
	</div>
	<div class="content-header-right">
		<a href="food-menu-category.php" class="btn btn-primary btn-sm">Посмотреть все</a>
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

			<form class="form-horizontal" action="" method="post">

				<div class="box box-info">
					<div class="box-body">
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Название категории <span>*</span></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="category_name">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Категория заказа </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="category_order">
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