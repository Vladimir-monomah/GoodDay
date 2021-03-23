<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

	if($valid == 1) {
		$statement = $pdo->prepare("UPDATE tbl_table SET table_name=?, seats_count=?, hidden=? WHERE id=?");
		$statement->execute(array($_POST['table_name'],$_POST['seats_count'],$_POST['hidden'],$_REQUEST['id']));

	    $success_message = 'Столик успешно обновлен!';
	}
}
?>

<?php
if(!isset($_REQUEST['id'])) {
	header('location: logout.php');
	exit;
} else {
	// Check the id is valid or not
	$statement = $pdo->prepare("SELECT * FROM tbl_table WHERE id=?");
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
		<h1>Редактировать</h1>
	</div>
	<div class="content-header-right">
		<a href="table.php" class="btn btn-primary btn-sm">Показать все</a>
	</div>
</section>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_table WHERE id=?");
$statement->execute(array($_REQUEST['id']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);
foreach ($result as $row) {
	$table_name       = $row['table_name'];
	$seats_count      = $row['seats_count'];
	$hidden           = $row['hidden'];
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
							<label for="" class="col-sm-2 control-label">Название  столика</label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="table_name" value="<?php echo $table_name; ?>">
							</div>
						</div>
                        <div class="form-group">
							<label for="" class="col-sm-2 control-label">Количество мест </label>
							<div class="col-sm-6">
								<input type="number" autocomplete="off" class="form-control" name="seats_count" value="<?php echo $seats_count; ?>">
							</div>
						</div>
				        <div class="form-group">
				            <label for="" class="col-sm-2 control-label">Скрытый</label>
				            <div class="col-sm-6">
				                <label class="radio-inline">
				                    <input type="radio" name="hidden" value="1" <?php if($hidden == '1') { echo 'checked'; } ?>>Да
				                </label>
				                <label class="radio-inline">
				                    <input type="radio" name="hidden" value="0" <?php if($hidden == '0') { echo 'checked'; } ?>>Нет
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