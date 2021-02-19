<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

    if(empty($_POST['faq_category_name'])) {
        $valid = 0;
        $error_message .= "Название категории FAQ не может быть пустым<br>";
    } else {
    	// Duplicate Category checking
    	$statement = $pdo->prepare("SELECT * FROM tbl_faq_category WHERE faq_category_name=?");
    	$statement->execute(array($_POST['faq_category_name']));
    	$total = $statement->rowCount();
    	if($total) {
    		$valid = 0;
        	$error_message .= "Название FAQ уже существует<br>";
    	}
    }


    if($valid == 1) {

		// saving into the database
		$statement = $pdo->prepare("INSERT INTO tbl_faq_category (faq_category_name) VALUES (?)");
		$statement->execute(array($_POST['faq_category_name']));

    	$success_message = 'Категория FAQ добавлена успешно.';
    }
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Добавить категорию FAQ</h1>
	</div>
	<div class="content-header-right">
		<a href="faq-category.php" class="btn btn-primary btn-sm">Посмотреть все</a>
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
							<label for="" class="col-sm-2 control-label">Название категории FAQ <span>*</span></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="faq_category_name" autocomplete="off">
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