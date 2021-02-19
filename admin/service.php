<?php require_once('header.php'); ?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Посмотреть услуги</h1>
	</div>
	<div class="content-header-right">
		<a href="service-add.php" class="btn btn-primary btn-sm">Добавить услугу</a>
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
								<th width="50">№</th>
								<th width="140">Фото</th>
								<th>Название</th>
								<th>Показывать?</th>
								<th width="140">Действие</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$i=0;
							$statement = $pdo->prepare("SELECT
														
														id,
														name,
														description,
														photo,
														show_on_home

							                           	FROM tbl_service
							                           	
							                           	");
							$statement->execute();
							$result = $statement->fetchAll();
							foreach ($result as $row) {
								$i++;
								?>
								<tr>
									<td><?php echo $i; ?></td>
									<td style="width:150px;"><img src="../uploads/<?php echo $row['photo']; ?>" alt="<?php echo $row['name']; ?>" style="width:140px;"></td>
									<td><?php echo $row['name']; ?></td>
									<td><?php echo $row['show_on_home']; ?></td>
									<td>										
										<a href="service-edit.php?id=<?php echo $row['id']; ?>" class="btn btn-primary btn-xs">Редактировать</a>
										<a href="#" class="btn btn-danger btn-xs" data-href="service-delete.php?id=<?php echo $row['id']; ?>" data-toggle="modal" data-target="#confirm-delete">Удалить</a>  
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


<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Удалить подтверждение</h4>
            </div>
            <div class="modal-body">
                <p>Вы действительно хотите удалить этот элемент?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                <a class="btn btn-danger btn-ok">Удалить</a>
            </div>
        </div>
    </div>
</div>


<?php require_once('footer.php'); ?>