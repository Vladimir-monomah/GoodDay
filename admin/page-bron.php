<?php require_once('header.php'); ?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Заказы</h1>
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
				  <th>Фамилия</th>
				  <th>Email</th>
				  <th>Телефон</th>
				  <th>Дата</th>
				  <th>Время</th>
				  <th>Дополнительная информация</th>
			  </tr>
		  </thead>
		  <tbody>
			  <?php
			  $i=0;
			  $statement = $pdo->prepare("SELECT * FROM tbl_bron");
			  $statement->execute();
			  $result = $statement->fetchAll(PDO::FETCH_ASSOC);							
			  foreach ($result as $row) {
				  $i++;
				  ?>
				  <tr>
					  <td><?php echo $i; ?></td>
					  <td><?php echo $row['first_name']; ?></td>
					  <td><?php echo $row['last_name']; ?></td>
					  <td><?php echo $row['email']; ?></td>
					  <td><?php echo $row['phone']; ?></td>
					  <td><?php echo date('d.m.Y',  $row['date']); ?></td>
					  <td><?php echo $row['time']; ?></td>
					  <td><?php echo $row['message']; ?></td>
				  </tr>
				  <?php
			  }
			  ?>
		  </tbody>
		</table>
        </div>
      </div>
  

</section>


<?php require_once('footer.php'); ?>