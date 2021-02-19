<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

	$path = $_FILES['photo_logo']['name'];
    $path_tmp = $_FILES['photo_logo']['tmp_name'];

    if($path == '') {
    	$valid = 0;
        $error_message .= 'Вы должны выбрать фото<br>';
    } else {
        $ext = pathinfo( $path, PATHINFO_EXTENSION );
        $file_name = basename( $path, '.' . $ext );
        if( $ext!='jpg' && $ext!='png' && $ext!='jpeg' && $ext!='gif' ) {
            $valid = 0;
            $error_message .= 'Вы должны загрузить файл jpg, jpeg, gif или png<br>';
        }
    }

    if($valid == 1) {
    	// removing the existing photo
    	$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
    	$statement->execute();
    	$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
    	foreach ($result as $row) {
    		$logo = $row['logo'];
    		unlink('../uploads/'.$logo);
    	}

    	// updating the data
    	$final_name = 'logo'.'.'.$ext;
        move_uploaded_file( $path_tmp, '../uploads/'.$final_name );

        // updating the database
		$statement = $pdo->prepare("UPDATE tbl_settings SET logo=? WHERE id=1");
		$statement->execute(array($final_name));

        $success_message = 'Логотип успешно обновлен.';
    	
    }
}

if(isset($_POST['form2'])) {
	$valid = 1;

	$path = $_FILES['photo_favicon']['name'];
    $path_tmp = $_FILES['photo_favicon']['tmp_name'];

    if($path == '') {
    	$valid = 0;
        $error_message .= 'Вы должны выбрать фото<br>';
    } else {
        $ext = pathinfo( $path, PATHINFO_EXTENSION );
        $file_name = basename( $path, '.' . $ext );
        if( $ext!='jpg' && $ext!='png' && $ext!='jpeg' && $ext!='gif' ) {
            $valid = 0;
            $error_message .= 'Вы должны загрузить файл jpg, jpeg, gif или png<br>';
        }
    }

    if($valid == 1) {
    	// removing the existing photo
    	$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
    	$statement->execute();
    	$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
    	foreach ($result as $row) {
    		$favicon = $row['favicon'];
    		unlink('../uploads/'.$favicon);
    	}

    	// updating the data
    	$final_name = 'favicon'.'.'.$ext;
        move_uploaded_file( $path_tmp, '../uploads/'.$final_name );

        // updating the database
		$statement = $pdo->prepare("UPDATE tbl_settings SET favicon=? WHERE id=1");
		$statement->execute(array($final_name));

        $success_message = 'Фавикон успешно обновлен.';
    	
    }
}

if(isset($_POST['form3'])) {
	
	// updating the database
	$statement = $pdo->prepare("UPDATE tbl_settings SET footer_about=?, footer_copyright=?, contact_address=?, contact_email=?, contact_phone=?, contact_fax=?, contact_map_iframe=? WHERE id=1");
	$statement->execute(array($_POST['footer_about'],$_POST['footer_copyright'],$_POST['contact_address'],$_POST['contact_email'],$_POST['contact_phone'],$_POST['contact_fax'],$_POST['contact_map_iframe']));

	$success_message = 'Общие настройки содержимого успешно обновлены.';
    
}

if(isset($_POST['form4'])) {
	// updating the database
	$statement = $pdo->prepare("UPDATE tbl_settings SET 
					contact_form_email=?,
					contact_form_email_subject=?,
					contact_form_email_thank_you_message=?,
					reservation_form_email=?,
					reservation_form_email_subject=?,
					reservation_form_email_thank_you_message=?

					WHERE id=1
				");
	$statement->execute(array(
					$_POST['contact_form_email'],
					$_POST['contact_form_email_subject'],
					$_POST['contact_form_email_thank_you_message'],
					$_POST['reservation_form_email'],
					$_POST['reservation_form_email_subject'],
					$_POST['reservation_form_email_thank_you_message']
				));

	$success_message = 'Настройки формы контакта и бронирования успешно обновлены.';
}


if(isset($_POST['form5'])) {
	// updating the database
	$statement = $pdo->prepare("UPDATE tbl_settings SET total_recent_news_footer=?, total_popular_news_footer=?, total_recent_news_sidebar=?, total_popular_news_sidebar=? WHERE id=1");
	$statement->execute(array($_POST['total_recent_news_footer'],$_POST['total_popular_news_footer'],$_POST['total_recent_news_sidebar'],$_POST['total_popular_news_sidebar']));

	$success_message = 'Настройки боковой панели успешно обновлены.';
}

if(isset($_POST['form6'])) {
	// updating the database
	$statement = $pdo->prepare("UPDATE tbl_settings SET meta_title_home=?, meta_keyword_home=?, meta_description_home=? WHERE id=1");
	$statement->execute(array($_POST['meta_title_home'],$_POST['meta_keyword_home'],$_POST['meta_description_home']));

	$success_message = 'Настройки Home Meta успешно обновлены.';
}

if(isset($_POST['form_service'])) {
	// updating the database
	$statement = $pdo->prepare("UPDATE tbl_settings SET home_status_service=? WHERE id=1");
	$statement->execute([$_POST['home_status_service']]);

	$success_message = 'Данные раздела домашнего обслуживания успешно обновлены.';
}

if(isset($_POST['form_about'])) {

	$valid = 1;

	$path = $_FILES['home_photo_about']['name'];
    $path_tmp = $_FILES['home_photo_about']['tmp_name'];

    if($path != '') {
        $ext = pathinfo( $path, PATHINFO_EXTENSION );
        $file_name = basename( $path, '.' . $ext );
        if( $ext!='jpg' && $ext!='png' && $ext!='jpeg' && $ext!='gif' && $ext!='JPG' && $ext!='PNG' && $ext!='JPEG' && $ext!='GIF' ) {
            $valid = 0;
            $error_message .= 'Вы должны загрузить файл jpg, jpeg, gif или png<br>';
        }
    }

    if($valid == 1) {
    	if($path != '') {

    		// removing the existing photo
            $statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
            $statement->execute();
            $result = $statement->fetchAll(PDO::FETCH_ASSOC);                           
            foreach ($result as $row) {
                $home_photo_about = $row['home_photo_about'];
                unlink('../uploads/'.$home_photo_about);
            }
            // updating the data
            $final_name = 'home_about_photo'.'.'.$ext;
            move_uploaded_file( $path_tmp, '../uploads/'.$final_name );

            // updating the database
			$statement = $pdo->prepare("UPDATE tbl_settings SET home_title_about=?,home_subtitle_about=?,home_text_about=?,home_photo_about=?,home_status_about=? WHERE id=1");
			$statement->execute([ $_POST['home_title_about'], $_POST['home_subtitle_about'],$_POST['home_text_about'],$final_name,$_POST['home_status_about'] ]);
    	} else {
	    	// updating the database
			$statement = $pdo->prepare("UPDATE tbl_settings SET home_title_about=?,home_subtitle_about=?,home_text_about=?,home_status_about=? WHERE id=1");
			$statement->execute([ $_POST['home_title_about'], $_POST['home_subtitle_about'],$_POST['home_text_about'],$_POST['home_status_about'] ]);	
    	}
		$success_message = 'Главная О разделе Данные успешно обновлены.';
    }

	
}

if(isset($_POST['form_menu'])) {
	// updating the database
	$statement = $pdo->prepare("UPDATE tbl_settings SET home_title_menu=?,home_subtitle_menu=?,home_status_menu=? WHERE id=1");
	$statement->execute([ $_POST['home_title_menu'], $_POST['home_subtitle_menu'], $_POST['home_status_menu'] ]);

	$success_message = 'Данные раздела меню домашней еды успешно обновлены.';
}

if(isset($_POST['form_testimonial'])) {
	// updating the database
	$statement = $pdo->prepare("UPDATE tbl_settings SET home_status_testimonial=? WHERE id=1");
	$statement->execute([$_POST['home_status_testimonial']]);

	$success_message = 'Главная страница отзывов Данные успешно обновлены.';
}

if(isset($_POST['form_chef'])) {
	// updating the database
	$statement = $pdo->prepare("UPDATE tbl_settings SET home_title_chef=?,home_subtitle_chef=?,home_status_chef=? WHERE id=1");
	$statement->execute([ $_POST['home_title_chef'], $_POST['home_subtitle_chef'], $_POST['home_status_chef'] ]);

	$success_message = 'Данные раздела Home Chef успешно обновлены.';
}

if(isset($_POST['form_color'])) {
	// updating the database
	$statement = $pdo->prepare("UPDATE tbl_settings SET color_primary=?,color_secondary=? WHERE id=1");
	$statement->execute([ $_POST['color_primary'],$_POST['color_secondary'] ]);

	$success_message = 'Цвет успешно обновлен.';
}


if(isset($_POST['form_reservation'])) {
	// updating the database
	$statement = $pdo->prepare("UPDATE tbl_settings SET reservation_text=?,reservation_button_text=?,reservation_button_url=?,reservation_status=? WHERE id=1");
	$statement->execute([ $_POST['reservation_text'], $_POST['reservation_button_text'], $_POST['reservation_button_url'], $_POST['reservation_status'] ]);

	$success_message = 'Информация о бронировании успешно обновлена.';
}

?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Настройки</h1>
	</div>
</section>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) {
	$logo                            = $row['logo'];
	$favicon                         = $row['favicon'];
	$footer_about                    = $row['footer_about'];
	$footer_copyright                = $row['footer_copyright'];
	$contact_address                 = $row['contact_address'];
	$contact_email                   = $row['contact_email'];
	$contact_phone                   = $row['contact_phone'];
	$contact_fax                     = $row['contact_fax'];
	$contact_map_iframe              = $row['contact_map_iframe'];
	$contact_form_email              = $row['contact_form_email'];
	$contact_form_email_subject      = $row['contact_form_email_subject'];
	$contact_form_email_thank_you_message = $row['contact_form_email_thank_you_message'];
	$reservation_form_email          = $row['reservation_form_email'];
	$reservation_form_email_subject  = $row['reservation_form_email_subject'];
	$reservation_form_email_thank_you_message = $row['reservation_form_email_thank_you_message'];
	$total_recent_news_footer        = $row['total_recent_news_footer'];
	$total_popular_news_footer       = $row['total_popular_news_footer'];
	$total_recent_news_sidebar       = $row['total_recent_news_sidebar'];
	$total_popular_news_sidebar      = $row['total_popular_news_sidebar'];
	$meta_title_home                 = $row['meta_title_home'];
	$meta_keyword_home               = $row['meta_keyword_home'];
	$meta_description_home           = $row['meta_description_home'];
	$home_status_service             = $row['home_status_service'];
	$home_title_about                = $row['home_title_about'];
	$home_subtitle_about             = $row['home_subtitle_about'];
	$home_text_about                 = $row['home_text_about'];
	$home_photo_about                = $row['home_photo_about'];
	$home_status_about               = $row['home_status_about'];
	$home_title_menu                 = $row['home_title_menu'];
	$home_subtitle_menu              = $row['home_subtitle_menu'];
	$home_status_menu                = $row['home_status_menu'];
	$home_status_testimonial         = $row['home_status_testimonial'];
	$home_title_chef                 = $row['home_title_chef'];
	$home_subtitle_chef              = $row['home_subtitle_chef'];
	$home_status_chef                = $row['home_status_chef'];
	$color_primary                   = $row['color_primary'];
	$color_secondary                 = $row['color_secondary'];
	$reservation_text                = $row['reservation_text'];
	$reservation_button_text         = $row['reservation_button_text'];
	$reservation_button_url          = $row['reservation_button_url'];
	$reservation_status              = $row['reservation_status'];
}
?>


<section class="content" style="min-height:auto;margin-bottom: -30px;">
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
		</div>
	</div>
</section>

<section class="content">

	<div class="row">
		<div class="col-md-12">
							
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab_1" data-toggle="tab">Логотип</a></li>
						<li><a href="#tab_2" data-toggle="tab">Иконка</a></li>
						<li><a href="#tab_3" data-toggle="tab">Общее содержание</a></li>
						<li><a href="#tab_4" data-toggle="tab">Настройки Email</a></li>
						<li><a href="#tab_5" data-toggle="tab">Новости</a></li>
						<li><a href="#tab_6" data-toggle="tab">Домашняя страница Мета</a></li>
						<li><a href="#tab_7" data-toggle="tab">Разделы домашней страницы</a></li>
						<li><a href="#tab_8" data-toggle="tab">Цвет темы</a></li>
						<li><a href="#tab_9" data-toggle="tab">Бронирование</a></li>
					</ul>
					<div class="tab-content">
          				<div class="tab-pane active" id="tab_1">


          					<form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
          					<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
							            <label for="" class="col-sm-2 control-label">Существующая фотография</label>
							            <div class="col-sm-6" style="padding-top:6px;">
							                <img src="../uploads/<?php echo $logo; ?>" class="existing-photo" style="height:80px;">
							            </div>
							        </div>
									<div class="form-group">
							            <label for="" class="col-sm-2 control-label">Новое фото</label>
							            <div class="col-sm-6" style="padding-top:6px;">
							                <input type="file" name="photo_logo">
							            </div>
							        </div>
							        <div class="form-group">
										<label for="" class="col-sm-2 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form1">Обновить логотип</button>
										</div>
									</div>
								</div>
							</div>
							</form>

							


          				</div>
          				<div class="tab-pane" id="tab_2">

          					<form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
							            <label for="" class="col-sm-2 control-label">Существующая фотография</label>
							            <div class="col-sm-6" style="padding-top:6px;">
							                <img src="../uploads/<?php echo $favicon; ?>" class="existing-photo" style="height:40px;">
							            </div>
							        </div>
									<div class="form-group">
							            <label for="" class="col-sm-2 control-label">Новая фотография</label>
							            <div class="col-sm-6" style="padding-top:6px;">
							                <input type="file" name="photo_favicon">
							            </div>
							        </div>
							        <div class="form-group">
										<label for="" class="col-sm-2 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form2">Обновить иконку</button>
										</div>
									</div>
								</div>
							</div>
							</form>


          				</div>
          				<div class="tab-pane" id="tab_3">

							<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Нижний колонтитул - О нас </label>
										<div class="col-sm-9">
											<textarea class="form-control" name="footer_about" id="editor1"><?php echo $footer_about; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Нижний колонтитул - Авторские права </label>
										<div class="col-sm-9">
											<input class="form-control" type="text" name="footer_copyright" value="<?php echo $footer_copyright; ?>">
										</div>
									</div>								
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Контактный адрес </label>
										<div class="col-sm-6">
											<textarea class="form-control" name="contact_address" style="height:140px;"><?php echo $contact_address; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Почта для связи </label>
										<div class="col-sm-6">
											<input type="text" class="form-control" name="contact_email" value="<?php echo $contact_email; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Контактный телефон </label>
										<div class="col-sm-6">
											<input type="text" class="form-control" name="contact_phone" value="<?php echo $contact_phone; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Контактный номер факса </label>
										<div class="col-sm-6">
											<input type="text" class="form-control" name="contact_fax" value="<?php echo $contact_fax; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Связаться с Map iFrame </label>
										<div class="col-sm-9">
											<textarea class="form-control" name="contact_map_iframe" style="height:200px;"><?php echo $contact_map_iframe; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form3">Обновить</button>
										</div>
									</div>
								</div>
							</div>
							</form>


          				</div>

          				<div class="tab-pane" id="tab_4">

          					<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<h4 style="border-bottom: 2px solid #000;padding-bottom: 5px;">Форма обратной связи</h4>
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">Адрес электронной почты контактной формы <span>*</span></label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="contact_form_email" value="<?php echo $contact_form_email; ?>">
										</div>
									</div>									
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">Контактная форма Тема электронного письма <span>*</span></label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="contact_form_email_subject" value="<?php echo $contact_form_email_subject; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">Контактная форма Электронная почта Сообщение с благодарностью <span>*</span></label>
										<div class="col-sm-9">
											<textarea class="form-control" name="contact_form_email_thank_you_message"><?php echo $contact_form_email_thank_you_message; ?></textarea>
										</div>
									</div>


									<h4 style="border-bottom: 2px solid #000;padding-bottom: 5px;margin-top:40px;">Форма бронирования</h4>
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">Адрес электронной почты для формы бронирования <span>*</span></label>
										<div class="col-sm-4">
											<input type="text" class="form-control" name="reservation_form_email" value="<?php echo $reservation_form_email; ?>">
										</div>
									</div>									
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">Форма бронирования Электронная почта Тема <span>*</span></label>
										<div class="col-sm-9">
											<input type="text" class="form-control" name="reservation_form_email_subject" value="<?php echo $reservation_form_email_subject; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">Электронная почта формы бронирования Спасибо сообщение <span>*</span></label>
										<div class="col-sm-9">
											<textarea class="form-control" name="reservation_form_email_thank_you_message"><?php echo $reservation_form_email_thank_you_message; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-3 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form4">Обновить</button>
										</div>
									</div>
								</div>
							</div>
							</form>


          				</div>

          				<div class="tab-pane" id="tab_5">

          					<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Нижний колонтитул (Сколько последних новостей?)<span>*</span></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" name="total_recent_news_footer" value="<?php echo $total_recent_news_footer; ?>">
										</div>
									</div>		
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Нижний колонтитул (Сколько популярных новостей?)<span>*</span></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" name="total_popular_news_footer" value="<?php echo $total_popular_news_footer; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Боковая панель (Сколько последних новостей?)<span>*</span></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" name="total_recent_news_sidebar" value="<?php echo $total_recent_news_sidebar; ?>">
										</div>
									</div>		
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Боковая панель (Сколько популярных новостей?)<span>*</span></label>
										<div class="col-sm-2">
											<input type="text" class="form-control" name="total_popular_news_sidebar" value="<?php echo $total_popular_news_sidebar; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form5">Обновить</button>
										</div>
									</div>
								</div>
							</div>
							</form>


          				</div>


          				<div class="tab-pane" id="tab_6">

          					<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Мета-заголовок </label>
										<div class="col-sm-9">
											<input type="text" name="meta_title_home" class="form-control" value="<?php echo $meta_title_home ?>">
										</div>
									</div>		
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Мета-ключевое слово </label>
										<div class="col-sm-9">
											<textarea class="form-control" name="meta_keyword_home" style="height:100px;"><?php echo $meta_keyword_home ?></textarea>
										</div>
									</div>	
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Мета Описание </label>
										<div class="col-sm-9">
											<textarea class="form-control" name="meta_description_home" style="height:200px;"><?php echo $meta_description_home ?></textarea>
										</div>
									</div>	
									<div class="form-group">
										<label for="" class="col-sm-2 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form6">Обновить</button>
										</div>
									</div>
								</div>
							</div>
							</form>


          				</div>



          				<div class="tab-pane section-hdl" id="tab_7">

          					<h3>Сервисный отдел</h3>
                            <form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                            <div class="box box-info">
                                <div class="box-body">                                          
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Статус</label>
                                        <div class="col-sm-8">
                                            <select name="home_status_service" class="form-control" style="width:auto;">
                                            	<option value="1" <?php if($home_status_service == 1){echo 'selected';} ?>>Включен</option>
                                            	<option value="0" <?php if($home_status_service == 0){echo 'selected';} ?>>Выключен</option>
                                            </select>
                                        </div>
                                    </div>                                    
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label"></label>
                                        <div class="col-sm-6">
                                            <button type="submit" class="btn btn-success pull-left" name="form_service">Обновить</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>



                            <h3>О разделе</h3>
                            <form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                            <div class="box box-info">
                                <div class="box-body">
                                	<div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Заголовок</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="home_title_about" value="<?php echo $home_title_about; ?>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Подзаголовок</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="home_subtitle_about" value="<?php echo $home_subtitle_about; ?>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Текст</label>
                                        <div class="col-sm-9">
                                            <textarea name="home_text_about" class="form-control" id="editor2" cols="30" rows="10"><?php echo $home_text_about; ?></textarea>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Существующая фотография</label>
                                        <div class="col-sm-6" style="padding-top:6px;">
                                            <img src="../uploads/<?php echo $home_photo_about; ?>" class="existing-photo" style="width:400px;">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Новое фото</label>
                                        <div class="col-sm-6" style="padding-top:6px;">
                                            <input type="file" name="home_photo_about">
                                        </div>
                                    </div>
                                                                         
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Статус</label>
                                        <div class="col-sm-8">
                                            <select name="home_status_about" class="form-control" style="width:auto;">
                                            	<option value="1" <?php if($home_status_about == 1){echo 'selected';} ?>>Включен</option>
                                            	<option value="0" <?php if($home_status_about == 0){echo 'selected';} ?>>Выключен</option>
                                            </select>
                                        </div>
                                    </div>                                    
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label"></label>
                                        <div class="col-sm-6">
                                            <button type="submit" class="btn btn-success pull-left" name="form_about">Обновить</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>




                            <h3>Раздел меню еды</h3>
                            <form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                            <div class="box box-info">
                                <div class="box-body">
                                	<div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Заголовок</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="home_title_menu" value="<?php echo $home_title_menu; ?>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Подзаголовок</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="home_subtitle_menu" value="<?php echo $home_subtitle_menu; ?>">
                                        </div>
                                    </div>
                                                                         
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Статус</label>
                                        <div class="col-sm-8">
                                            <select name="home_status_menu" class="form-control" style="width:auto;">
                                            	<option value="1" <?php if($home_status_menu == 1){echo 'selected';} ?>>Включен</option>
                                            	<option value="0" <?php if($home_status_menu == 0){echo 'selected';} ?>>Выключен</option>
                                            </select>
                                        </div>
                                    </div>                                    
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label"></label>
                                        <div class="col-sm-6">
                                            <button type="submit" class="btn btn-success pull-left" name="form_menu">Обновить</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>


                            <h3>Раздел отзывов</h3>
                            <form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                            <div class="box box-info">
                                <div class="box-body">                                          
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Статус</label>
                                        <div class="col-sm-8">
                                            <select name="home_status_testimonial" class="form-control" style="width:auto;">
                                            	<option value="1" <?php if($home_status_testimonial == 1){echo 'selected';} ?>>Включен</option>
                                            	<option value="0" <?php if($home_status_testimonial == 0){echo 'selected';} ?>>Выключен</option>
                                            </select>
                                        </div>
                                    </div>                                    
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label"></label>
                                        <div class="col-sm-6">
                                            <button type="submit" class="btn btn-success pull-left" name="form_testimonial">Обновить</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>



                            <h3>Секция поваров</h3>
                            <form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
                            <div class="box box-info">
                                <div class="box-body">
                                	<div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Заголовк</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="home_title_chef" value="<?php echo $home_title_chef; ?>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Подзаголовк</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="home_subtitle_chef" value="<?php echo $home_subtitle_chef; ?>">
                                        </div>
                                    </div>
                                                                         
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label">Статус</label>
                                        <div class="col-sm-8">
                                            <select name="home_status_chef" class="form-control" style="width:auto;">
                                            	<option value="1" <?php if($home_status_chef == 1){echo 'selected';} ?>>Включен</option>
                                            	<option value="0" <?php if($home_status_chef == 0){echo 'selected';} ?>>Выключен</option>
                                            </select>
                                        </div>
                                    </div>                                    
                                    <div class="form-group">
                                        <label for="" class="col-sm-2 control-label"></label>
                                        <div class="col-sm-6">
                                            <button type="submit" class="btn btn-success pull-left" name="form_chef">Обновить</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </form>


          				</div>



          				<div class="tab-pane" id="tab_8">
          					<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Основной цвет </label>
										<div class="col-sm-2">
											<input type="text" name="color_primary" class="form-control jscolor" value="<?php echo $color_primary; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Вторичный цвет </label>
										<div class="col-sm-2">
											<input type="text" name="color_secondary" class="form-control jscolor" value="<?php echo $color_secondary; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form_color">Обновить</button>
										</div>
									</div>
								</div>
							</div>
							</form>
          				</div>


          				<div class="tab-pane" id="tab_9">
          					<form class="form-horizontal" action="" method="post">
							<div class="box box-info">
								<div class="box-body">
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Текст бронирования</label>
										<div class="col-sm-9">
											<textarea name="reservation_text" class="form-control" cols="30" rows="10" style="height: 100px;"><?php echo $reservation_text; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Текст кнопки</label>
										<div class="col-sm-4">
											<input type="text" name="reservation_button_text" class="form-control" value="<?php echo $reservation_button_text; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Кнопка URL</label>
										<div class="col-sm-4">
											<input type="text" name="reservation_button_url" class="form-control" value="<?php echo $reservation_button_url; ?>">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label">Кнопка статуса URL</label>
										<div class="col-sm-4">
											<select name="reservation_status" class="form-control" style="width:auto;">
                                            	<option value="1" <?php if($reservation_status == 1){echo 'selected';} ?>>Включен</option>
                                            	<option value="0" <?php if($reservation_status == 0){echo 'selected';} ?>>Выключен</option>
                                            </select>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-2 control-label"></label>
										<div class="col-sm-6">
											<button type="submit" class="btn btn-success pull-left" name="form_reservation">Обновить</button>
										</div>
									</div>
								</div>
							</div>
							</form>
          				</div>




          			</div>
				</div>

				
		</div>
	</div>

</section>

<?php require_once('footer.php'); ?>