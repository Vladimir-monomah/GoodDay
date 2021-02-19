<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	foreach($_POST['arr_order'] as $key=>$value) {
		$statement = $pdo->prepare("UPDATE tbl_menu_footer SET menu_order=? WHERE menu_id=?");
		$statement->execute(array($value,$key));
	}	
	$success_message = 'Порядок меню был успешно изменен.';
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Просмотр меню (нижний колонтитул)</h1>
	</div>
	<div class="content-header-right">
		<a href="menu-footer-add.php" class="btn btn-primary btn-sm">Добавить новое</a>
	</div>
</section>


<section class="content">

  	<div class="row">
    	<div class="col-md-12">
		

			<div class="box box-info">        
				<div class="box-body table-responsive">

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
					
					<form action="" method="post">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Id меню</th>
								<th>Тип меню</th>
								<th>Название меню</th>
								<th>Категория / страница раздела</th>
								<th>Порядок меню</th>
								<th>URL</th>
								<th>Действие</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$i=0;
							$statement = $pdo->prepare("SELECT * FROM tbl_menu_footer");
							$statement->execute();
							$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
							foreach ($result as $row) {
								$i++;
								?>
								<tr>
									<td><?php echo $row['menu_id']; ?></td>
									<td><?php echo $row['menu_type']; ?></td>
									<td><?php echo $row['menu_name']; ?></td>
									<td><?php echo $row['category_or_page_slug']; ?></td>
									<td>
									<input type="text" name="arr_order[<?php echo $row['menu_id']; ?>]" class="form-control" value="<?php echo $row['menu_order']; ?>">
									</td>
									<td><?php echo $row['menu_url']; ?></td>
									<td>
									<a href="#" class="btn btn-danger btn-xs" data-href="menu-delete.php?id=<?php echo $row['menu_id']; ?>" data-toggle="modal" data-target="#confirm-delete">Удалить</a>
									</td>
								</tr>
								<?php
							}
							?>
						</tbody>
					</table>
					<div class="text-center">
						<input type="submit" class="btn btn-success" value="Обновить заказ" name="form1">
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>


<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Удалить подтверждение</h4>
            </div>
            <div class="modal-body">
			Вы действительно хотите удалить этот элемент?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                <a class="btn btn-danger btn-ok">Удалить</a>
            </div>
        </div>
    </div>
</div>

<?php require_once('footer.php'); ?>