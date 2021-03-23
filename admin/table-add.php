<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

    $statement = $pdo->prepare("INSERT INTO tbl_table (table_name, seats_count, hidden) VALUES (?,?,?)");
    $statement->execute(array($_POST['table_name'], $_POST['seats_count'], $_POST['hidden']));
        
    $success_message = 'Стол успешно добавлен!';

    unset($_POST['table_name']);
    unset($_POST['seats_count']);
    unset($_POST['hidden']);
	}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Добавить столик</h1>
	</div>
	<div class="content-header-right">
		<a href="table.php" class="btn btn-primary btn-sm">Просмотреть всё</a>
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
							<label for="" class="col-sm-2 control-label">Название столика</label>
							<div class="col-sm-6">
								<input type="text" autocomplete="off" class="form-control" name="table_name" value="<?php if(isset($_POST['table_name'])){echo $_POST['table_name'];} ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Количество мест</label>
							<div class="col-sm-6">
								<input type="number" autocomplete="off" class="form-control" name="seats_count" value="<?php if(isset($_POST['seats_count'])){echo $_POST['seats_count'];} ?>">
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