<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

    if(empty($_POST['category_name'])) {
        $valid = 0;
        $error_message .= "Название категории не может быть пустым<br>";
    } else {
    	// Проверка повторяющихся категорий
    	$statement = $pdo->prepare("SELECT * FROM tbl_category WHERE category_name=?");
    	$statement->execute(array($_POST['category_name']));
    	$total = $statement->rowCount();
    	if($total)
    	{
    		$valid = 0;
        	$error_message .= "Название категории уже существует<br>";
    	}
    }

    if($valid == 1) {

    	// Получение идентификатора автоинкремента для этой категории
		$statement = $pdo->prepare("SHOW TABLE STATUS LIKE 'tbl_category'");
		$statement->execute();
		$result = $statement->fetchAll();
		foreach($result as $row) {
			$ai_id=$row[10];
		}

    	if($_POST['category_slug'] == '') {
    		// generate slug
    		$temp_string = strtolower($_POST['category_name']);
    		$category_slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $temp_string);
    	} else {
    		$temp_string = strtolower($_POST['category_slug']);
    		$category_slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $temp_string);
    	}

    	// if slug already exists, then rename it
		$statement = $pdo->prepare("SELECT * FROM tbl_category WHERE category_slug=?");
		$statement->execute(array($category_slug));
		$total = $statement->rowCount();
		if($total) {
			$category_slug = $category_slug.'-1';
		}
    	
		// Saving data into the main table tbl_category
		$statement = $pdo->prepare("INSERT INTO tbl_category (category_name,category_slug,meta_title,meta_keyword,meta_description) VALUES (?,?,?,?,?)");
		$statement->execute(array($_POST['category_name'],$category_slug,$_POST['meta_title'],$_POST['meta_keyword'],$_POST['meta_description']));
	
    	$success_message = 'Категория успешно добавлена.';
    }
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Добавить категорию</h1>
	</div>
	<div class="content-header-right">
		<a href="category.php" class="btn btn-primary btn-sm">Посмотреть все</a>
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
								<input type="text" class="form-control" name="category_name" placeholder="Пример: советы по здоровью">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Разряд категории </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="category_slug" placeholder="Пример: советы по здоровью">
							</div>
						</div>
						<h3 class="seo-info">SEO информация</h3>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Мета-заголовок </label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="meta_title">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Мета Ключевые слова </label>
							<div class="col-sm-9">
								<textarea class="form-control" name="meta_keyword" style="height:100px;"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Мета Описание </label>
							<div class="col-sm-9">
								<textarea class="form-control" name="meta_description" style="height:100px;"></textarea>
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