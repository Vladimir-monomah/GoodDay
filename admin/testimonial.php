<?php require_once('header.php'); ?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Посмотреть отзывы</h1>
	</div>
	<div class="content-header-right">
		<a href="testimonial-add.php" class="btn btn-primary btn-sm">Добавить отзыв</a>
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
								<th width="30">№</th>
								<th>Фото</th>
								<th width="100">Название</th>
								<th width="100">Обозначение</th>
								<th width="100">Компания</th>
								<th>Комментарий</th>
								<th width="30">Заказ</th>
								<th width="80">Действия</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$i=0;
							$statement = $pdo->prepare("SELECT
														
														id,
														name,
														designation,
														company,
														photo,
														comment,
														testimonial_order

							                           	FROM tbl_testimonial
							                           	
							                           	");
							$statement->execute();
							$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
							foreach ($result as $row) {
								$i++;
								?>
								<tr>
									<td><?php echo $i; ?></td>
									<td style="width:130px;"><img src="../uploads/<?php echo $row['photo']; ?>" alt="<?php echo $row['name']; ?>" style="width:120px;"></td>
									<td><?php echo $row['name']; ?></td>
									<td><?php echo $row['designation']; ?></td>
									<td><?php echo $row['company']; ?></td>
									<td><?php echo $row['comment']; ?></td>
									<td><?php echo $row['testimonial_order']; ?></td>
									<td>										
										<a href="testimonial-edit.php?id=<?php echo $row['id']; ?>" class="btn btn-primary btn-xs">Редактировать</a>
										<a href="#" class="btn btn-danger btn-xs" data-href="testimonial-delete.php?id=<?php echo $row['id']; ?>" data-toggle="modal" data-target="#confirm-delete">Удалить</a>  
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