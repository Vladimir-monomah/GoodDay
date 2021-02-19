<?php require_once('header.php'); ?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Просмотр страниц</h1>
	</div>
	<div class="content-header-right">
		<a href="page-add.php" class="btn btn-primary btn-sm">Добавить новое</a>
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
			        <th>Название страницы</th>
			        <th>Раздел страницы</th>
			        <th>Макет страницы</th>
			        <th>Статус</th>
			        <th>Действие</th>
			    </tr>
			</thead>
            <tbody>
            	<?php
            	$i=0;
            	$statement = $pdo->prepare("SELECT * FROM tbl_page ORDER BY page_id ASC");
            	$statement->execute();
            	$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
            	foreach ($result as $row) {
            		$i++;
            		?>
					<tr>
	                    <td><?php echo $i; ?></td>
	                    <td><?php echo $row['page_name']; ?></td>
	                    <td><?php echo $row['page_slug']; ?></td>
	                    <td><?php echo $row['page_layout']; ?></td>
	                    <td><?php echo $row['status']; ?></td>
	                    <td>
	                        <a href="page-edit.php?id=<?php echo $row['page_id']; ?>" class="btn btn-primary btn-xs">Редактировать</a>
	                        <a href="#" class="btn btn-danger btn-xs" data-href="page-delete.php?id=<?php echo $row['page_id']; ?>" data-toggle="modal" data-target="#confirm-delete">Удалить</a>
	                    </td>
	                </tr>
            		<?php
            	}
            	?>
            </tbody>
          </table>
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