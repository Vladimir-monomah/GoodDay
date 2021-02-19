<?php require_once('header.php'); ?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Просмотр меню еды</h1>
	</div>
	<div class="content-header-right">
		<a href="food-menu-add.php" class="btn btn-primary btn-sm">Добавить новое</a>
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
								<th>Цена</th>
								<th width="30">Заказ</th>
								<th>Категория</th>
								<th>Действие</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$i=0;
							$statement = $pdo->prepare("SELECT

														t1.food_menu_id,
														t1.food_menu_name,
														t1.food_menu_price,
														t1.food_menu_photo,
														t1.food_menu_order,
														t1.category_id,

														t2.category_id,
														t2.category_name

							                           	FROM tbl_food_menu t1
							                           	JOIN tbl_category_food_menu t2
							                           	ON t1.category_id = t2.category_id

							                           	ORDER BY t1.food_menu_id ASC
							                           	");
							$statement->execute();
							$result = $statement->fetchAll();
							foreach ($result as $row) {
								$i++;
								?>
								<tr>
									<td><?php echo $i; ?></td>
									<td>
										<?php
										if($row['food_menu_photo'] == '')
										{
											echo '<img src="../uploads/no-photo1.jpg" alt="" style="width:100px;">';
										}
										else
										{
											echo '<img src="../uploads/'.$row['food_menu_photo'].'" alt="'.$row['food_menu_name'].'" style="width:100px;">';
										}
										?>
									</td>
									<td><?php echo $row['food_menu_name']; ?></td>
									<td><?php echo $row['food_menu_price']; ?></td>
									<td><?php echo $row['food_menu_order']; ?></td>
									<td>
										<?php echo $row['category_name']; ?>
									</td>
									<td>										
										<a href="food-menu-edit.php?id=<?php echo $row['food_menu_id']; ?>" class="btn btn-primary btn-xs">Редактировать</a>
										<a href="#" class="btn btn-danger btn-xs" data-href="food-menu-delete.php?id=<?php echo $row['food_menu_id']; ?>" data-toggle="modal" data-target="#confirm-delete">Удалить</a>  
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