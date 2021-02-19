<?php require_once('header.php'); ?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Посмотреть поваров</h1>
	</div>
	<div class="content-header-right">
		<a href="chef-add.php" class="btn btn-primary btn-sm">Добавить повара</a>
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
								<th>Фото</th>
								<th width="180">Имя</th>
								<th width="240">Обозначение</th>
								<th>Заказ</th>
								<th>Статус</th>
								<th width="140">Действия</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$i=0;
							$statement = $pdo->prepare("SELECT
														
														t1.id,
														t1.name,
														t1.designation_id,
														t1.photo,
														t1.chef_order,
														t1.status,

														t2.designation_id,
														t2.designation_name

							                           	FROM tbl_chef t1
							                           	JOIN tbl_designation t2
							                           	ON t1.designation_id = t2.designation_id
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
									<td><?php echo $row['designation_name']; ?></td>
									<td><?php echo $row['chef_order']; ?></td>
									<td><?php echo $row['status']; ?></td>
									<td>			
										<a href="chef-edit.php?id=<?php echo $row['id']; ?>" class="btn btn-primary btn-xs">Редактировать</a>
										<a href="#" class="btn btn-danger btn-xs" data-href="chef-delete.php?id=<?php echo $row['id']; ?>" data-toggle="modal" data-target="#confirm-delete">Удалить</a>  
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
                <h4 class="modal-title" id="myModalLabel">Delete Confirmation</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure want to delete this item?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger btn-ok">Delete</a>
            </div>
        </div>
    </div>
</div>


<?php require_once('footer.php'); ?>