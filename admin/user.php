<?php require_once('header.php'); ?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Просмотр пользователей (администратор)</h1>
	</div>
	<div class="content-header-right">
		<a href="user-add.php" class="btn btn-primary btn-sm">Добавить нового</a>
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
			        <th>Имя</th>
			        <th>Email</th>
			        <th>Роль</th>
			        <th>Статус</th>
			        <th>Действие</th>
			    </tr>
			</thead>
            <tbody>

				<?php
                    $i=0;
                    $statement = $pdo->prepare("SELECT * FROM tbl_user");
                    $statement->execute();
                    $result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
                    foreach ($result as $row) {
                    	$i++;
                    	?>
						<tr>
		                    <td><?php echo $i; ?></td>
		                    <td><?php echo $row['full_name']; ?></td>
		                    <td><?php echo $row['email']; ?></td>
		                    <td><?php echo $row['role']; ?></td>
		                    <td><?php echo $row['status']; ?></td>
		                    <td>
		                        <?php
		                        	if($i != 1) {
			                        	echo '<a href="user-edit.php?id='.$row['id'].'" class="btn btn-primary btn-xs">Редактировать</a> ';
			                        	echo '<a href="#" class="btn btn-danger btn-xs" data-href="user-delete.php?id='.$row['id'].'" data-toggle="modal" data-target="#confirm-delete">Удалить</a> ';	
		                        	}		                        	
		                        ?>
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