<?php require_once('header.php'); ?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Просмотр столов</h1>
	</div>
	<div class="content-header-right">
		<a href="table-add.php" class="btn btn-primary btn-sm">Добавить столик</a>
	</div>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-info">
				<div class="box-body table-responsive">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>№</th>
								<th>Название</th>
                                <th>Количество мест</th>
                                <th>Статус</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$i=0;
							$statement = $pdo->prepare("SELECT * FROM tbl_table");
							$statement->execute();
							$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
							foreach ($result as $row) {
								$i++;
								?>
								<tr>
									<td><?php echo $i; ?></td>
									<td><?php echo $row['table_name']; ?></td>
									<td><?php echo $row['seats_count']; ?></td>
									<td><?php echo $row['hidden'] == '1' ? 'Скрытый' : ''; ?></td>
									<td>										
										<a href="table-edit.php?id=<?php echo $row['id']; ?>" class="btn btn-primary btn-xs">Редактировать</a>
									</td>
								</tr>
								<?php
							}
							?>							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>

<?php require_once('footer.php'); ?>