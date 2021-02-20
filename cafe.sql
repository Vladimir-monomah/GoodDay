-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 20 2021 г., 19:19
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cafe`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `category_slug` varchar(255) CHARACTER SET utf8 NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `meta_keyword` text CHARACTER SET utf8 NOT NULL,
  `meta_description` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `category_slug`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(1, 'Морепродукты', 'sea-foods', 'Морепродукты', '', ''),
(2, 'Еда и напитки', 'food-and-drink', 'Еда и напитки', '', ''),
(3, 'Рецепты', 'recipes', 'Рецепты', '', ''),
(4, 'Кофейный бизнес', 'restaurant-business', 'Кофейный бизнес', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_category_food_menu`
--

CREATE TABLE `tbl_category_food_menu` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `category_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_category_food_menu`
--

INSERT INTO `tbl_category_food_menu` (`category_id`, `category_name`, `category_order`) VALUES
(1, 'Завтрак', 1),
(2, 'Обед', 2),
(3, 'Ужин', 3),
(4, 'Десерты и напитки', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_chef`
--

CREATE TABLE `tbl_chef` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `google_plus` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `flickr` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `chef_order` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_chef`
--

INSERT INTO `tbl_chef` (`id`, `name`, `slug`, `designation_id`, `photo`, `banner`, `detail`, `facebook`, `twitter`, `linkedin`, `youtube`, `google_plus`, `instagram`, `flickr`, `phone`, `email`, `website`, `chef_order`, `status`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(1, 'Robert Smith', 'robert-smith', 7, 'chef-1.jpg', 'chef-banner-1.jpg', '<h2 style=\"color: rgb(0, 0, 0);\">About</h2><p>Enim venenatis nisl wisi quis, in wisi. Sollicitudin eget mollis accumsan, ut wisi maecenas tortor. Magna vehicula auctor lacus aliquam. Vehicula bibendum ut sed class erat, et et risus vel pede ac, purus orci. Nulla integer sed sem. Ut erat dolor lectus consectetuer, vel tincidunt integer duis euismod nunc, pede pede nec mauris in, vel sem fuga dis ligula. Ridiculus placerat, odio ut, mauris per vitae vehicula lorem sed vestibulum, nec fusce cras orci enim.</p><h2 style=\"color: rgb(0, 0, 0);\">Degree</h2><p>At mi consectetuer. Mauris elementum a, ridiculus est leo adipiscing in commodo, dapibus tempus, mattis suspendisse, aliquam aliquam proin.</p><h2 style=\"color: rgb(0, 0, 0);\">Education</h2><p>Pellentesque nulla ut. Convallis eleifend ut est dui eros, porta enim odio luctus, sed orci nonummy tellus, wisi enim venenatis magnis, dolor nunc.</p><h2 style=\"color: rgb(0, 0, 0);\">Experience</h2><p>Sociosqu at metus luctus feugiat integer, imperdiet auctor risus. Vel ultricies dis et at sodales. Massa id urna eros tempor. Fusce lobortis dolor viverra, tempor consequat nibh, eget faucibus sapien porttitor wisi, velit et. Sollicitudin consectetuer interdum gravida metus maecenas.<br></p><div><br></div>\r\n', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', '', '', '', '', '111-222-3333', 'info@yourwebsite.com', 'http://www.abc.com', 8, 'Active', 'Robert Smith', '', ''),
(2, 'Brent Grundy', 'brent-grundy', 5, 'chef-2.jpg', 'chef-banner-2.jpg', '<h2>About</h2><p>Enim venenatis nisl wisi quis, in wisi. Sollicitudin eget mollis accumsan, ut wisi maecenas tortor. Magna vehicula auctor lacus aliquam. Vehicula bibendum ut sed class erat, et et risus vel pede ac, purus orci. Nulla integer sed sem. Ut erat dolor lectus consectetuer, vel tincidunt integer duis euismod nunc, pede pede nec mauris in, vel sem fuga dis ligula. Ridiculus placerat, odio ut, mauris per vitae vehicula lorem sed vestibulum, nec fusce cras orci enim.</p><h2>Degree</h2><p>At mi consectetuer. Mauris elementum a, ridiculus est leo adipiscing in commodo, dapibus tempus, mattis suspendisse, aliquam aliquam proin.</p><h2>Education</h2><p>Pellentesque nulla ut. Convallis eleifend ut est dui eros, porta enim odio luctus, sed orci nonummy tellus, wisi enim venenatis magnis, dolor nunc.</p><h2>Experience</h2><p>Sociosqu at metus luctus feugiat integer, imperdiet auctor risus. Vel ultricies dis et at sodales. Massa id urna eros tempor. Fusce lobortis dolor viverra, tempor consequat nibh, eget faucibus sapien porttitor wisi, velit et. Sollicitudin consectetuer interdum gravida metus maecenas.<br></p><p><br></p>\r\n', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', '', '', '', '', '111-222-3333', 'info@yourwebsite.com', 'http://www.abc.com', 2, 'Active', 'Brent Grundy', '', ''),
(3, 'John Henderson', 'john-henderson', 2, 'chef-3.jpg', 'chef-banner-3.jpg', '<h2>About</h2><p>Enim venenatis nisl wisi quis, in wisi. Sollicitudin eget mollis accumsan, ut wisi maecenas tortor. Magna vehicula auctor lacus aliquam. Vehicula bibendum ut sed class erat, et et risus vel pede ac, purus orci. Nulla integer sed sem. Ut erat dolor lectus consectetuer, vel tincidunt integer duis euismod nunc, pede pede nec mauris in, vel sem fuga dis ligula. Ridiculus placerat, odio ut, mauris per vitae vehicula lorem sed vestibulum, nec fusce cras orci enim.</p><h2>Degree</h2><p>At mi consectetuer. Mauris elementum a, ridiculus est leo adipiscing in commodo, dapibus tempus, mattis suspendisse, aliquam aliquam proin.</p><h2>Education</h2><p>Pellentesque nulla ut. Convallis eleifend ut est dui eros, porta enim odio luctus, sed orci nonummy tellus, wisi enim venenatis magnis, dolor nunc.</p><h2>Experience</h2><p>Sociosqu at metus luctus feugiat integer, imperdiet auctor risus. Vel ultricies dis et at sodales. Massa id urna eros tempor. Fusce lobortis dolor viverra, tempor consequat nibh, eget faucibus sapien porttitor wisi, velit et. Sollicitudin consectetuer interdum gravida metus maecenas.<br></p><p><br></p>\r\n', '', '', '', '', '', '', '', '', '', '', 1, 'Active', 'John Henderson', '', ''),
(4, 'Patrick Joe', 'patrick-joe', 5, 'chef-4.jpg', 'chef-banner-4.jpg', '<h2 style=\"color: rgb(0, 0, 0);\">About</h2><p>Enim venenatis nisl wisi quis, in wisi. Sollicitudin eget mollis accumsan, ut wisi maecenas tortor. Magna vehicula auctor lacus aliquam. Vehicula bibendum ut sed class erat, et et risus vel pede ac, purus orci. Nulla integer sed sem. Ut erat dolor lectus consectetuer, vel tincidunt integer duis euismod nunc, pede pede nec mauris in, vel sem fuga dis ligula. Ridiculus placerat, odio ut, mauris per vitae vehicula lorem sed vestibulum, nec fusce cras orci enim.</p><h2 style=\"color: rgb(0, 0, 0);\">Degree</h2><p>At mi consectetuer. Mauris elementum a, ridiculus est leo adipiscing in commodo, dapibus tempus, mattis suspendisse, aliquam aliquam proin.</p><h2 style=\"color: rgb(0, 0, 0);\">Education</h2><p>Pellentesque nulla ut. Convallis eleifend ut est dui eros, porta enim odio luctus, sed orci nonummy tellus, wisi enim venenatis magnis, dolor nunc.</p><h2 style=\"color: rgb(0, 0, 0);\">Experience</h2><p>Sociosqu at metus luctus feugiat integer, imperdiet auctor risus. Vel ultricies dis et at sodales. Massa id urna eros tempor. Fusce lobortis dolor viverra, tempor consequat nibh, eget faucibus sapien porttitor wisi, velit et. Sollicitudin consectetuer interdum gravida metus maecenas.<br></p><div><br></div>\r\n', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', '', '', '', '', '111-222-3333', 'info@yourwebsite.com', 'http://www.abc.com', 3, 'Active', 'Patrick Joe', '', ''),
(5, 'Peter Robertson', 'peter-robertson', 5, 'chef-5.jpg', 'chef-banner-5.jpg', '<h2 style=\"color: rgb(0, 0, 0);\">About</h2><p>Enim venenatis nisl wisi quis, in wisi. Sollicitudin eget mollis accumsan, ut wisi maecenas tortor. Magna vehicula auctor lacus aliquam. Vehicula bibendum ut sed class erat, et et risus vel pede ac, purus orci. Nulla integer sed sem. Ut erat dolor lectus consectetuer, vel tincidunt integer duis euismod nunc, pede pede nec mauris in, vel sem fuga dis ligula. Ridiculus placerat, odio ut, mauris per vitae vehicula lorem sed vestibulum, nec fusce cras orci enim.</p><h2 style=\"color: rgb(0, 0, 0);\">Degree</h2><p>At mi consectetuer. Mauris elementum a, ridiculus est leo adipiscing in commodo, dapibus tempus, mattis suspendisse, aliquam aliquam proin.</p><h2 style=\"color: rgb(0, 0, 0);\">Education</h2><p>Pellentesque nulla ut. Convallis eleifend ut est dui eros, porta enim odio luctus, sed orci nonummy tellus, wisi enim venenatis magnis, dolor nunc.</p><h2 style=\"color: rgb(0, 0, 0);\">Experience</h2><p>Sociosqu at metus luctus feugiat integer, imperdiet auctor risus. Vel ultricies dis et at sodales. Massa id urna eros tempor. Fusce lobortis dolor viverra, tempor consequat nibh, eget faucibus sapien porttitor wisi, velit et. Sollicitudin consectetuer interdum gravida metus maecenas.<br></p><div><br></div>\r\n', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', '', '', '', '', '111-222-3333', 'info@yourwebsite.com', 'http://www.abc.com', 4, 'Active', 'Peter Robertson', '', ''),
(6, 'Bryan Smith', 'bryan-smith', 5, 'chef-6.jpg', 'chef-banner-6.jpg', '<h2 style=\"color: rgb(0, 0, 0);\">About</h2><p>Enim venenatis nisl wisi quis, in wisi. Sollicitudin eget mollis accumsan, ut wisi maecenas tortor. Magna vehicula auctor lacus aliquam. Vehicula bibendum ut sed class erat, et et risus vel pede ac, purus orci. Nulla integer sed sem. Ut erat dolor lectus consectetuer, vel tincidunt integer duis euismod nunc, pede pede nec mauris in, vel sem fuga dis ligula. Ridiculus placerat, odio ut, mauris per vitae vehicula lorem sed vestibulum, nec fusce cras orci enim.</p><h2 style=\"color: rgb(0, 0, 0);\">Degree</h2><p>At mi consectetuer. Mauris elementum a, ridiculus est leo adipiscing in commodo, dapibus tempus, mattis suspendisse, aliquam aliquam proin.</p><h2 style=\"color: rgb(0, 0, 0);\">Education</h2><p>Pellentesque nulla ut. Convallis eleifend ut est dui eros, porta enim odio luctus, sed orci nonummy tellus, wisi enim venenatis magnis, dolor nunc.</p><h2 style=\"color: rgb(0, 0, 0);\">Experience</h2><p>Sociosqu at metus luctus feugiat integer, imperdiet auctor risus. Vel ultricies dis et at sodales. Massa id urna eros tempor. Fusce lobortis dolor viverra, tempor consequat nibh, eget faucibus sapien porttitor wisi, velit et. Sollicitudin consectetuer interdum gravida metus maecenas.<br></p><div><br></div>\r\n', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', '', '', '', '', '111-222-3333', 'info@yourwebsite.com', 'http://www.abc.com', 5, 'Active', 'Bryan Smith', '', ''),
(7, 'Tom Steward', 'tom-steward', 5, 'chef-7.jpg', 'chef-banner-7.jpg', '<h2 style=\"\"><h2>About</h2><p>Enim venenatis nisl wisi quis, in wisi. Sollicitudin eget mollis accumsan, ut wisi maecenas tortor. Magna vehicula auctor lacus aliquam. Vehicula bibendum ut sed class erat, et et risus vel pede ac, purus orci. Nulla integer sed sem. Ut erat dolor lectus consectetuer, vel tincidunt integer duis euismod nunc, pede pede nec mauris in, vel sem fuga dis ligula. Ridiculus placerat, odio ut, mauris per vitae vehicula lorem sed vestibulum, nec fusce cras orci enim.</p><h2>Degree</h2><p>At mi consectetuer. Mauris elementum a, ridiculus est leo adipiscing in commodo, dapibus tempus, mattis suspendisse, aliquam aliquam proin.</p><h2>Education</h2><p>Pellentesque nulla ut. Convallis eleifend ut est dui eros, porta enim odio luctus, sed orci nonummy tellus, wisi enim venenatis magnis, dolor nunc.</p><h2>Experience</h2><p>Sociosqu at metus luctus feugiat integer, imperdiet auctor risus. Vel ultricies dis et at sodales. Massa id urna eros tempor. Fusce lobortis dolor viverra, tempor consequat nibh, eget faucibus sapien porttitor wisi, velit et. Sollicitudin consectetuer interdum gravida metus maecenas.<br></p><p><br></p></h2><div><br></div>\r\n', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', '', '', '', '', '111-222-3333', 'info@yourwebsite.com', 'http://www.abc.com', 6, 'Active', 'Tom Steward', '', ''),
(8, 'Jeff Benson', 'jeff-benson', 5, 'chef-8.jpg', 'chef-banner-8.jpg', '<h2 style=\"color: rgb(0, 0, 0);\">About</h2><p>Enim venenatis nisl wisi quis, in wisi. Sollicitudin eget mollis accumsan, ut wisi maecenas tortor. Magna vehicula auctor lacus aliquam. Vehicula bibendum ut sed class erat, et et risus vel pede ac, purus orci. Nulla integer sed sem. Ut erat dolor lectus consectetuer, vel tincidunt integer duis euismod nunc, pede pede nec mauris in, vel sem fuga dis ligula. Ridiculus placerat, odio ut, mauris per vitae vehicula lorem sed vestibulum, nec fusce cras orci enim.</p><h2 style=\"color: rgb(0, 0, 0);\">Degree</h2><p>At mi consectetuer. Mauris elementum a, ridiculus est leo adipiscing in commodo, dapibus tempus, mattis suspendisse, aliquam aliquam proin.</p><h2 style=\"color: rgb(0, 0, 0);\">Education</h2><p>Pellentesque nulla ut. Convallis eleifend ut est dui eros, porta enim odio luctus, sed orci nonummy tellus, wisi enim venenatis magnis, dolor nunc.</p><h2 style=\"color: rgb(0, 0, 0);\">Experience</h2><p>Sociosqu at metus luctus feugiat integer, imperdiet auctor risus. Vel ultricies dis et at sodales. Massa id urna eros tempor. Fusce lobortis dolor viverra, tempor consequat nibh, eget faucibus sapien porttitor wisi, velit et. Sollicitudin consectetuer interdum gravida metus maecenas.<br></p><div><br></div>\r\n', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', '', '', '', '', '111-222-3333', 'info@yourwebsite.com', 'http://www.abc.com', 7, 'Active', 'Jeff Benson', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL,
  `code_body` text NOT NULL,
  `code_main` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_comment`
--

INSERT INTO `tbl_comment` (`id`, `code_body`, `code_main`) VALUES
(1, '<div id=\"fb-root\"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = \"//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.10&appId=323620764400430\";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, \'script\', \'facebook-jssdk\'));</script>', '<div class=\"fb-comments\" data-href=\"https://developers.facebook.com/docs/plugins/comments#configurator\" data-numposts=\"5\"></div>');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `designation_id` int(11) NOT NULL,
  `designation_name` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_designation`
--

INSERT INTO `tbl_designation` (`designation_id`, `designation_name`) VALUES
(2, 'Шеф-повар'),
(5, 'Эксперт рецептов'),
(6, 'Помощник повара'),
(7, 'Главный повар');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `faq_id` int(11) NOT NULL,
  `faq_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `faq_content` text CHARACTER SET utf8 NOT NULL,
  `faq_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_faq`
--

INSERT INTO `tbl_faq` (`faq_id`, `faq_title`, `faq_content`, `faq_category_id`) VALUES
(1, 'Lorem ipsum dolor sit amet, an labores explicari qui', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 1),
(2, 'Eu nostrum copiosae argumentum has latine propriae quo no', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 1),
(3, 'Unum ridens expetenda id sit, at usu eius eligendi singulis', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 2),
(4, 'Sea ocurreret principes ne, at nonumy aperiri pri nam quodsi', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 2),
(5, 'Copiosae intellegebat et, ex deserunt euripidis usu', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 2),
(6, 'Duo volutpat imperdiet ut, postea salutatus imperdiet ut', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 3),
(7, 'Facilisi postulant vel no, ad mea commune disputando', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 3),
(8, 'Mea ei regione blandit ullamcorper, definiebas constituam vix ei', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_faq_category`
--

CREATE TABLE `tbl_faq_category` (
  `faq_category_id` int(11) NOT NULL,
  `faq_category_name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_faq_category`
--

INSERT INTO `tbl_faq_category` (`faq_category_id`, `faq_category_name`) VALUES
(1, 'Основные вопросы'),
(2, 'Клиентский запрос'),
(3, 'Технические вопросы');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_file`
--

CREATE TABLE `tbl_file` (
  `file_id` int(11) NOT NULL,
  `file_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_food_menu`
--

CREATE TABLE `tbl_food_menu` (
  `food_menu_id` int(11) NOT NULL,
  `food_menu_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `food_menu_description` text CHARACTER SET utf8 NOT NULL,
  `food_menu_price` varchar(10) CHARACTER SET utf8 NOT NULL,
  `food_menu_photo` varchar(255) NOT NULL,
  `food_menu_order` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_food_menu`
--

INSERT INTO `tbl_food_menu` (`food_menu_id`, `food_menu_name`, `food_menu_description`, `food_menu_price`, `food_menu_photo`, `food_menu_order`, `category_id`) VALUES
(14, 'Традиционный', 'Яйцо / Сыр Чеддер / Бекон', '200 руб.', 'food-menu-14.jpg', 1, 1),
(15, 'Копченый бублик с лососем', 'Сливочный сыр / жареные каперсы / нарезанный помидор', '700 руб.', 'food-menu-15.jpg', 2, 1),
(16, 'Тост с авокадо', 'Нарезанный тост / пюре из авокадо / масло чили / зеленый лук', '350 руб.', 'food-menu-16.jpg', 3, 1),
(17, 'Ветчина и сырная крупа', 'Хрустящая ветчина / зеленый лук / кремовая крупа', '500 руб.', 'food-menu-17.jpg', 4, 1),
(18, 'Хрустящая курица', 'Куриное бедро / сыр / перечное желе', '150 руб.', 'food-menu-18.jpg', 5, 2),
(19, 'Жареная индейка', 'Бекон / Авокадо / Салат / Чимичурри', '450 руб.', 'food-menu-19.jpg', 6, 2),
(20, 'Итальянское холодное мясо', 'Giardiniera / Garlic Aioli / Capicola', '750 руб.', 'food-menu-20.jpg', 7, 2),
(21, 'Жареный сыр', 'Американский сыр / тосты / белый хлеб', '340 руб.', 'food-menu-21.jpg', 8, 2),
(22, 'Горячий кофе', 'Помидоры / оливковое масло / сыр', '150 руб.', 'food-menu-22.jpg', 9, 3),
(23, 'Маринованные креветки на гриле', 'Свежие креветки / оливковое масло / томатный соус', '450 руб.', 'food-menu-23.jpg', 10, 3),
(24, 'Сальса из авокадо и манго', 'Авокадо / Манго / Помидоры', '500 руб.', 'food-menu-24.jpg', 11, 3),
(25, 'Запеченные картофельные шкурки', 'Картофель / Масло / Чеснок', '250 руб.', 'food-menu-25.jpg', 12, 3),
(26, 'Клубничное песочное печенье', 'Пахта / Клубника / Крем', '50 руб.', 'food-menu-26.jpg', 13, 4),
(27, 'Банановый сплит', 'Мороженое с карамелью / Клубника', '120 руб.', 'food-menu-27.jpeg', 14, 4),
(28, 'Безалкогольные напитки', 'Кола / спрайт / лимонад', '35 руб.', 'food-menu-28.jpg', 15, 4),
(29, 'Холодный сок', 'Яблоко / Апельсин / Виноград', '80 руб.', 'food-menu-29.jpg', 16, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_menu_footer`
--

CREATE TABLE `tbl_menu_footer` (
  `menu_id` int(11) NOT NULL,
  `menu_type` varchar(255) NOT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `category_or_page_slug` varchar(255) NOT NULL,
  `menu_order` int(11) NOT NULL,
  `menu_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_menu_footer`
--

INSERT INTO `tbl_menu_footer` (`menu_id`, `menu_type`, `menu_name`, `category_or_page_slug`, `menu_order`, `menu_url`) VALUES
(1, 'Page', 'Условия и положения', 'terms-and-conditions', 1, ''),
(2, 'Page', 'Политика конфиденциальности', 'privacy-policy', 2, '');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_menu_main`
--

CREATE TABLE `tbl_menu_main` (
  `menu_id` int(11) NOT NULL,
  `menu_type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `category_or_page_slug` varchar(255) CHARACTER SET utf8 NOT NULL,
  `menu_order` int(11) NOT NULL,
  `menu_parent` int(11) NOT NULL,
  `menu_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_menu_main`
--

INSERT INTO `tbl_menu_main` (`menu_id`, `menu_type`, `menu_name`, `category_or_page_slug`, `menu_order`, `menu_parent`, `menu_url`) VALUES
(17, 'Other', 'Главная', '', 1, 0, 'http://goodday'),
(34, 'Page', 'FAQ', 'faq', 4, 0, ''),
(35, 'Page', 'Новости', 'news', 5, 0, ''),
(36, 'Page', 'Контакты', 'contact-us', 7, 0, ''),
(37, 'Other', 'Меню', '', 6, 0, '#'),
(38, 'Page', 'Меню еды 1', 'food-menu-1', 1, 37, ''),
(39, 'Page', 'Меню еды 2', 'food-menu-2', 2, 37, ''),
(40, 'Page', 'Меню еды 3', 'food-menu-3', 3, 37, ''),
(41, 'Page', 'Меню еды 4', 'food-menu-4', 4, 37, ''),
(42, 'Other', 'Страницы', '', 2, 0, '#'),
(44, 'Page', 'Наши повара', 'chefs', 3, 42, ''),
(45, 'Page', 'О нас', 'about-us', 1, 42, ''),
(46, 'Page', 'Фотогалерея', 'photo-gallery', 4, 42, ''),
(47, 'Page', 'Наши услуги', 'our-services', 2, 42, ''),
(48, 'Page', 'Забронировать столик', 'reserve-table', 50, 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_news`
--

CREATE TABLE `tbl_news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `news_slug` varchar(255) CHARACTER SET utf8 NOT NULL,
  `news_content` text CHARACTER SET utf8 NOT NULL,
  `news_short_content` text CHARACTER SET utf8 NOT NULL,
  `news_date` varchar(255) CHARACTER SET utf8 NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `category_id` int(11) NOT NULL,
  `publisher` varchar(255) CHARACTER SET utf8 NOT NULL,
  `total_view` int(11) NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `meta_keyword` text CHARACTER SET utf8 NOT NULL,
  `meta_description` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_news`
--

INSERT INTO `tbl_news` (`news_id`, `news_title`, `news_slug`, `news_content`, `news_short_content`, `news_date`, `photo`, `category_id`, `publisher`, `total_view`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(11, 'Бразильский кофе: каппинг образцов аукционных лотов сезона 2021', 'brazilian-coffee-cupping-samples-of-the-2021-auction-lots', '<p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Компания Cocar представила десять образов аукционного кофе кооператива Expocaccer из региона Cerrado Mineiro (Бразилия)</span></p><span id=\"more-5911\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif; font-size: 18px; letter-spacing: -0.054px;\"></span><span style=\"color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif; font-size: 18px; letter-spacing: -0.054px;\"></span><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\">14 октября в офисе COFFEE PROJECT компания импортер зеленого зерна&nbsp;<a rel=\"noreferrer noopener\" aria-label=\"Cocar&nbsp; (откроется в новой вкладке)\" href=\"https://www.coffeeproject.ru/blog/cocar\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">Cocar&nbsp;</a>организовала и провела супер каппинг кофе для екатеринбургских обжарщиков:&nbsp;<a rel=\"noreferrer noopener\" aria-label=\" (откроется в новой вкладке)\" href=\"https://www.instagram.com/konstantacoffee/\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">Кonstanta Сoffee</a>&nbsp;,&nbsp;<a rel=\"noreferrer noopener\" aria-label=\"Ingresso coffee (откроется в новой вкладке)\" href=\"https://www.coffeeproject.ru/blog/ingresso\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">Ingresso coffee</a>.</p><h2 class=\"smart-toc__anchor\" data-smart-toc__anchor-id=\"0\" style=\"-webkit-font-smoothing: antialiased; margin: 35px 0px 15px; font-weight: 900; line-height: 40px; font-size: 2.3rem; font-family: &quot;Fira Sans Condensed&quot;, sans-serif; color: rgb(56, 56, 56); letter-spacing: -0.054px;\">Каппинг постоянных сортов компании Cocar</h2><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\">На первом каппинговом столе были образцы из действующего ассортимента:</p><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><br>&nbsp;<span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Бразилия Феникс (оценка Q 81.00)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" aria-label=\" разновидности (откроется в новой вкладке)\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: красный Катуаи, Мундо Ново<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" aria-label=\"обработка (откроется в новой вкладке)\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: натуральная<br style=\"-webkit-font-smoothing: antialiased;\">Букет: карамель, орех, тёмный шоколад<br style=\"-webkit-font-smoothing: antialiased;\">В каталоге Coffee Project представлен:&nbsp;<a rel=\"noreferrer noopener\" aria-label=\"Ингрессо (откроется в новой вкладке)\" href=\"https://www.coffeeproject.ru/coffee/ingresso-brazil-fenix\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">Ингрессо</a>,&nbsp;<a rel=\"noreferrer noopener\" aria-label=\"M9 ROASTERS (откроется в новой вкладке)\" href=\"https://www.coffeeproject.ru/coffee/m9-brazil-fenix\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">M9 ROASTERS</a></p><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><br><span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">&nbsp;Кения Каганда АБ (оценка Q 88.00)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: Блю Маунтин, Руиру 11<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: мытая<br style=\"-webkit-font-smoothing: antialiased;\">Букет: малина, персик, чёрная смородина, мандарин<br style=\"-webkit-font-smoothing: antialiased;\">В каталоге Coffee Project представлен:&nbsp;<a rel=\"noreferrer noopener\" aria-label=\"Ингрессо (откроется в новой вкладке)\" href=\"https://www.coffeeproject.ru/coffee/ingresso-kenya-kaganda\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">Ингрессо</a></p><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><br>&nbsp;<span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Эфиопия Шанго (Иллубабор, Гр.2) (оценка Q 84.00)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: дикий Хейрлум<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: натуральная<br style=\"-webkit-font-smoothing: antialiased;\">Букет: клубника, персик, лимон<br style=\"-webkit-font-smoothing: antialiased;\">В каталоге Coffee Project представлен:&nbsp;<a rel=\"noreferrer noopener\" aria-label=\"Ингрессо (откроется в новой вкладке)\" href=\"https://www.coffeeproject.ru/coffee/ingresso-ethiopia-shango\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">Ингрессо</a>,&nbsp;<a rel=\"noreferrer noopener\" aria-label=\"M9 ROASTERS (откроется в новой вкладке)\" href=\"https://www.coffeeproject.ru/coffee/m9-ethiopia-shango\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">M9 ROASTERS</a></p><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Индонезия</span><br style=\"-webkit-font-smoothing: antialiased;\"><br><span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">&nbsp;Бали, Гр.1 (оценка Q 86.25)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: В1, В21<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: semi washed<br style=\"-webkit-font-smoothing: antialiased;\">Букет: специи, белый шоколад, персик<br style=\"-webkit-font-smoothing: antialiased;\">В каталоге Coffee Project представлен:&nbsp;<a href=\"https://www.coffeeproject.ru/coffee/ingresso-indonesia-bali\" target=\"_blank\" rel=\"noreferrer noopener\" aria-label=\"Ингрессо  (откроется в новой вкладке)\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">Ингрессо</a></p><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><br>&nbsp;<span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Бали, Гр.1 (оценка Q 84.25)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: Копиол<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: мытая<br style=\"-webkit-font-smoothing: antialiased;\">Букет: корица, карамель, цитрус</p><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><br>&nbsp;<span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Торайя, Гр.1 (оценка Q 86.50)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: S795<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: semi washed<br style=\"-webkit-font-smoothing: antialiased;\">Букет: белое вино, ананас, папайя</p><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><br><span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">&nbsp;Гайо, Гр.1 (оценка Q 86.50)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: Гайо 2, Типика, Атенг С<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: wet hulled<br style=\"-webkit-font-smoothing: antialiased;\">Букет: специи, сладкий табак, земляника<br style=\"-webkit-font-smoothing: antialiased;\">В каталоге Coffee Project представлен:&nbsp;<a href=\"https://www.coffeeproject.ru/coffee/ingresso-indonesia-sumatra-gayo\" target=\"_blank\" rel=\"noreferrer noopener\" aria-label=\"Ингрессо   (откроется в новой вкладке)\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">Ингрессо</a></p><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><br>&nbsp;<span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Северный Малабар (оценка Q 86.75)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: Сигарар Утанг, Типика<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: мытая<br style=\"-webkit-font-smoothing: antialiased;\">Букет: маракуйя, манго, ананас<br style=\"-webkit-font-smoothing: antialiased;\">⠀<br style=\"-webkit-font-smoothing: antialiased;\"><span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Гватемала</span><br style=\"-webkit-font-smoothing: antialiased;\"><br>&nbsp;<span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Трес Мариас (Ориенте) (оценка Q 83.75)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: Бурбон, Катуаи, Катурра и Типика<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: мытая<br style=\"-webkit-font-smoothing: antialiased;\">Букет: апельсиновое варенье, мандарин, мед</p><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><br>&nbsp;<span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Белла Виста (Закапа) (оценка Q 85.00)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: Катуаи, Катурра, Анакафе 14<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: мытая<br style=\"-webkit-font-smoothing: antialiased;\">Букет: грейпфрут, карамель, апельсин, мята</p><p style=\"-webkit-font-smoothing: antialiased; margin-top: 25px; margin-bottom: 20px; letter-spacing: 0.3px; font-size: 18px; line-height: 1.6; color: rgb(56, 56, 56); font-family: &quot;Noto Serif&quot;, serif;\"><br>&nbsp;<span style=\"-webkit-font-smoothing: antialiased; font-weight: 700;\">Финка Капетилло (Антигуа) (оценка Q 87.00)</span><br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/geysha-protiv-burbona-kratkiy-kurs-po-sortam-kofe\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">разновидности</a>: Катуаи, Катурра, Анакафе 14<br style=\"-webkit-font-smoothing: antialiased;\"><a rel=\"noreferrer noopener\" href=\"https://www.coffeeproject.ru/blog/kak-vybrat-kofe-1\" target=\"_blank\" style=\"-webkit-font-smoothing: antialiased; color: rgb(56, 56, 56); line-height: 1.1; display: inline; transition: all 0.5s ease 0s; border-bottom: 2px solid rgb(67, 156, 68);\">обработка</a>: натуральная<br style=\"-webkit-font-smoothing: antialiased;\">Букет: тёмный шоколад, красное яблоко, изюм</p>', 'Сегодня 20 февраля в 20.00 (Мск) пройдет онлайн аукцион этих лотов❗\r\nМинимальная цена аукциона от 8 $ за кг, в прошлом году цены аукциона достигли 30 $ за кг.\r\nКаждого лота кофе на аукционе представлено не более 5 мешков (300 кг), минимальная закупка от 1 мешка.', '20-02-2021', 'news-11.jpg', 4, 'John Doe', 23, 'brazilian-coffee-cupping-samples-of-the-2021-auction-lots', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_page`
--

CREATE TABLE `tbl_page` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `page_slug` varchar(255) CHARACTER SET utf8 NOT NULL,
  `page_content` text CHARACTER SET utf8 NOT NULL,
  `page_layout` varchar(255) CHARACTER SET utf8 NOT NULL,
  `banner` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `meta_keyword` text CHARACTER SET utf8 NOT NULL,
  `meta_description` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_page`
--

INSERT INTO `tbl_page` (`page_id`, `page_name`, `page_slug`, `page_content`, `page_layout`, `banner`, `status`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(1, 'О нас', '-', '', 'About Us Page Layout', 'page-banner-1.jpg', 'Active', 'Страница о нас', '', ''),
(2, 'Контакты', 'contact-us', '<h2>Контакты</h2><p>Заполните форму ниже, чтобы связаться с нами и отправить нам электронное письмо<br></p>', 'Contact Us Page Layout', 'page-banner-2.jpg', 'Active', 'Страница контактов', '', ''),
(5, 'Фотогалерея', 'photo-gallery', '<p><br></p>', 'Photo Gallery Page Layout', 'page-banner-5.jpg', 'Active', 'Страница фотогалереи', '', ''),
(7, 'FAQ', 'faq', '<p><br></p>', 'FAQ Page Layout', 'page-banner-7.jpg', 'Active', 'Страница FAQ', '', ''),
(9, 'Новости', 'news', '', 'News Page Layout', 'page-banner-9.jpg', 'Active', 'Новостная страница', '', ''),
(10, 'Наши повара', 'chefs', '<p><br></p>', 'Chef Page Layout', 'page-banner-10.jpg', 'Active', 'Страница поваров', '', ''),
(11, 'Меню еды 1', 'food-menu-1', '<p><br></p>', 'Menu Style 1 Page Layout', 'page-banner-11.png', 'Active', 'Меню еды', '', ''),
(12, 'Меню еды 2', 'food-menu-2', '', 'Menu Style 2 Page Layout', 'page-banner-12.jpg', 'Active', 'Меню еды', '', ''),
(13, 'Меню еды 3', 'food-menu-3', '', 'Menu Style 3 Page Layout', 'page-banner-13.jpg', 'Active', 'Меню еды', '', ''),
(14, 'Меню еды 4', 'food-menu-4', '', 'Menu Style 4 Page Layout', 'page-banner-14.jpg', 'Active', 'Меню еды', '', ''),
(15, 'Наши услуги', 'our-services', '<p><br></p>', 'Service Page Layout', 'page-banner-15.jpg', 'Active', 'Наши услуги', '', ''),
(16, 'Забронировать столик', 'reserve-table', '<p style=\"text-align: center;\">Заполните форму ниже, чтобы зарезервировать столик</p><p style=\"text-align: center;\"><br></p>', 'Reserve Table Page Layout', 'page-banner-16.jpg', 'Active', 'Забронировать столик', '', ''),
(17, 'Условия и положения', 'terms-and-conditions', '<p style=\"font-family: \" times=\"\" new=\"\" roman\";=\"\" font-size:=\"\" medium;\"=\"\"><br></p>', 'Full Width Page Layout', 'page-banner-17.jpg', 'Active', 'Условия и положения', '', ''),
(18, 'Политика конфиденциальности', 'privacy-policy', '<p style=\"font-family: \" times=\"\" new=\"\" roman\";=\"\" font-size:=\"\" medium;\"=\"\"><br></p>', 'Full Width Page Layout', 'page-banner-18.jpg', 'Active', 'Политика конфиденциальности', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_photo`
--

CREATE TABLE `tbl_photo` (
  `photo_id` int(11) NOT NULL,
  `photo_caption` varchar(255) NOT NULL,
  `photo_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_photo`
--

INSERT INTO `tbl_photo` (`photo_id`, `photo_caption`, `photo_name`) VALUES
(8, 'Photo 1', 'photo-8.jpg'),
(9, 'Photo 2', 'photo-9.jpg'),
(10, 'Photo 3', 'photo-10.jpg'),
(11, 'Photo 4', 'photo-11.jpg'),
(12, 'Photo 5', 'photo-12.jpg'),
(13, 'Photo 6', 'photo-13.jpg'),
(14, 'Photo 7', 'photo-14.jpg'),
(15, 'Photo 8', 'photo-15.jpg'),
(16, 'Photo 9', 'photo-16.jpg'),
(17, 'Photo 10', 'photo-17.jpg'),
(18, 'Photo 11', 'photo-18.jpg'),
(19, 'Photo 12', 'photo-19.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_service`
--

CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `photo` varchar(255) NOT NULL,
  `service_order` int(11) NOT NULL,
  `show_on_home` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_service`
--

INSERT INTO `tbl_service` (`id`, `name`, `description`, `photo`, `service_order`, `show_on_home`) VALUES
(4, 'Качественная еда', '<p>Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.</p>\r\n', 'service-4.png', 0, 'Yes'),
(5, 'Особые продукты', '<p>Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.</p>\r\n', 'service-5.png', 0, 'Yes'),
(6, 'Кофе Первого Класса', '<p>Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.</p>\r\n', 'service-6.png', 0, 'Yes');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `footer_about` text CHARACTER SET utf8 NOT NULL,
  `footer_copyright` text CHARACTER SET utf8 NOT NULL,
  `contact_address` text CHARACTER SET utf8 NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `contact_fax` varchar(255) NOT NULL,
  `contact_map_iframe` text NOT NULL,
  `contact_form_email` varchar(255) NOT NULL,
  `contact_form_email_subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `contact_form_email_thank_you_message` text CHARACTER SET utf8 NOT NULL,
  `reservation_form_email` varchar(255) NOT NULL,
  `reservation_form_email_subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `reservation_form_email_thank_you_message` text CHARACTER SET utf8 NOT NULL,
  `total_recent_news_footer` int(10) NOT NULL,
  `total_popular_news_footer` int(10) NOT NULL,
  `total_recent_news_sidebar` int(11) NOT NULL,
  `total_popular_news_sidebar` int(11) NOT NULL,
  `meta_title_home` text CHARACTER SET utf8 NOT NULL,
  `meta_keyword_home` text CHARACTER SET utf8 NOT NULL,
  `meta_description_home` text CHARACTER SET utf8 NOT NULL,
  `home_status_service` int(11) NOT NULL,
  `home_title_about` varchar(255) CHARACTER SET utf8 NOT NULL,
  `home_subtitle_about` varchar(255) CHARACTER SET utf8 NOT NULL,
  `home_text_about` text CHARACTER SET utf8 NOT NULL,
  `home_photo_about` varchar(255) NOT NULL,
  `home_status_about` int(11) NOT NULL,
  `home_title_menu` varchar(255) CHARACTER SET utf8 NOT NULL,
  `home_subtitle_menu` varchar(255) CHARACTER SET utf8 NOT NULL,
  `home_status_menu` int(11) NOT NULL,
  `home_status_testimonial` int(11) NOT NULL,
  `home_title_chef` varchar(255) CHARACTER SET utf8 NOT NULL,
  `home_subtitle_chef` varchar(255) CHARACTER SET utf8 NOT NULL,
  `home_status_chef` int(11) NOT NULL,
  `color_primary` varchar(20) NOT NULL,
  `color_secondary` varchar(20) NOT NULL,
  `reservation_text` text CHARACTER SET utf8 NOT NULL,
  `reservation_button_text` varchar(255) CHARACTER SET utf8 NOT NULL,
  `reservation_button_url` varchar(255) NOT NULL,
  `reservation_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `logo`, `favicon`, `footer_about`, `footer_copyright`, `contact_address`, `contact_email`, `contact_phone`, `contact_fax`, `contact_map_iframe`, `contact_form_email`, `contact_form_email_subject`, `contact_form_email_thank_you_message`, `reservation_form_email`, `reservation_form_email_subject`, `reservation_form_email_thank_you_message`, `total_recent_news_footer`, `total_popular_news_footer`, `total_recent_news_sidebar`, `total_popular_news_sidebar`, `meta_title_home`, `meta_keyword_home`, `meta_description_home`, `home_status_service`, `home_title_about`, `home_subtitle_about`, `home_text_about`, `home_photo_about`, `home_status_about`, `home_title_menu`, `home_subtitle_menu`, `home_status_menu`, `home_status_testimonial`, `home_title_chef`, `home_subtitle_chef`, `home_status_chef`, `color_primary`, `color_secondary`, `reservation_text`, `reservation_button_text`, `reservation_button_url`, `reservation_status`) VALUES
(1, 'logo.png', 'favicon.png', '<p><span style=\"font-family: \"PT Sans\", Arial; font-size: 20px;\">Кофейня отличается от других заведений общественного питания широким выбором сортов кофе и кофейных напитков. Помимо главного пункта в меню — кофе, в кофейне представлены многочисленные кондитерские изделия, холодные и горячие закуски.</span><br></p>\r\n', 'Copyright © 2021. Все права защищены.', 'Бугульма, Ленина 140Б', 'ff071116@mail.ru', '89534802115', '89631237335', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2315.3627611693496!2d52.834534215843725!3d54.52709888024342!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4161a8b28a10f203%3A0xc64ea4ae08ec8feb!2z0YPQuy4g0JvQtdC90LjQvdCwLCAxNDAsINCR0YPQs9GD0LvRjNC80LAsINCg0LXRgdC_LiDQotCw0YLQsNGA0YHRgtCw0L0sIDQyMzIzNQ!5e0!3m2!1sru!2sru!4v1613662568585!5m2!1sru!2sru\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\" tabindex=\"0\"></iframe>', 'ff071116@mail.ru', 'Сообщение контактной формы - GoodDay', 'Спасибо, что отправили письмо. Мы свяжемся с Вами в скором времени.', 'ff071116@mail.ru', 'Сообщение формы бронирования - GoodDay', 'Спасибо за запрос при бронировании. Мы свяжемся с вами в ближайшее время и подтвердим вашу бронь.', 3, 3, 4, 4, 'GoodDay - Сайт кофейня и ресторан CMS', 'кафе, еда, ресторан, гостиница, фаст-фуд, стол в кафе, заказ, креветки, пицца', 'GoodDay - приятный и чистый отзывчивый сайт кафе и ресторана CMS', 1, 'О нас', 'Добро пожаловать в нашу замечательную кофейню', '<p style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 15px; padding-bottom: 0px; font-family: \"PT Sans\", Arial; font-size: 20px;\">Кофейня отличается от других заведений общественного питания широким выбором сортов кофе и кофейных напитков. Помимо главного пункта в меню — кофе, в кофейне представлены многочисленные кондитерские изделия, холодные и горячие закуски.</p><p style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 15px; padding-bottom: 0px; font-family: \"PT Sans\", Arial; font-size: 20px;\">Формат заведения близок к концепции «французской» кофейни. Основная идея — организация уютного пространства для отдыха. Упор делается не на скорость, а на качество обслуживания клиента. Официанты и бариста являются отличными консультантами по всем предлагаемым напиткам и блюдам.</p>', 'home_about_photo.jpg', 1, 'Меню кофейни', 'Доступные пункты меню в нашей кофейне', 1, 1, 'Наши повара', 'Знайте обо всех наших опытных поварах', 1, '323F52', 'DC9822', 'Наша еда вкусная. Не забудьте сделать бронирование', 'Зарезервировать', 'http://goodday/page.php?slug=reserve-table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `heading` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `button_text` varchar(255) CHARACTER SET utf8 NOT NULL,
  `button_url` varchar(255) NOT NULL,
  `slide_order` int(11) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_slider`
--

INSERT INTO `tbl_slider` (`id`, `photo`, `heading`, `content`, `button_text`, `button_url`, `slide_order`, `status`) VALUES
(1, 'slider-1.jpg', 'Добро пожаловать в нашу кофейню', 'Лучшее кафе в городе с отличной качественной едой', 'Забронируйте сейчас', '#', 1, 'Active'),
(2, 'slider-2.jpg', 'Добро пожаловать в нашу кофейню', 'Лучшее кафе в городе с отличной качественной едой', '', '', 2, 'Active');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_social`
--

CREATE TABLE `tbl_social` (
  `social_id` int(11) NOT NULL,
  `social_name` varchar(30) NOT NULL,
  `social_url` varchar(255) NOT NULL,
  `social_icon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_social`
--

INSERT INTO `tbl_social` (`social_id`, `social_name`, `social_url`, `social_icon`) VALUES
(1, 'Facebook', '#', 'fa fa-facebook'),
(2, 'Twitter', '#', 'fa fa-twitter'),
(3, 'LinkedIn', '#', 'fa fa-linkedin'),
(4, 'Google Plus', '#', 'fa fa-google-plus'),
(5, 'Pinterest', '#', 'fa fa-pinterest'),
(6, 'YouTube', '', 'fa fa-youtube'),
(7, 'Instagram', '', 'fa fa-instagram'),
(8, 'Tumblr', '', 'fa fa-tumblr'),
(9, 'Flickr', '', 'fa fa-flickr'),
(10, 'Reddit', '', 'fa fa-reddit'),
(11, 'Snapchat', '', 'fa fa-snapchat'),
(12, 'WhatsApp', '', 'fa fa-whatsapp'),
(13, 'Quora', '', 'fa fa-quora'),
(14, 'StumbleUpon', '', 'fa fa-stumbleupon'),
(15, 'Delicious', '', 'fa fa-delicious'),
(16, 'Digg', '', 'fa fa-digg');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_testimonial`
--

CREATE TABLE `tbl_testimonial` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8 NOT NULL,
  `company` varchar(255) CHARACTER SET utf8 NOT NULL,
  `photo` varchar(255) NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL,
  `testimonial_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_testimonial`
--

INSERT INTO `tbl_testimonial` (`id`, `name`, `designation`, `company`, `photo`, `comment`, `testimonial_order`) VALUES
(1, 'John Doe', 'Управляющий', 'ABC Inc.', 'testimonial-1.jpg', 'Ancillae interpretaris ea has. Id amet impedit qui, eripuit mnesarchum percipitur in eam. Ne sit habeo inimicus, no his liber regione volutpat. Ex quot voluptaria usu, dolor vivendo docendi nec ea. Et atqui vocent integre vim, quod cibo recusabo ei usu.', 1),
(2, 'Dadiv Smith', 'Исполнительный директор', 'SS Multimedia', 'testimonial-2.jpg', 'Ancillae interpretaris ea has. Id amet impedit qui, eripuit mnesarchum percipitur in eam. Ne sit habeo inimicus, no his liber regione volutpat. Ex quot voluptaria usu, dolor vivendo docendi nec ea. Et atqui vocent integre vim, quod cibo recusabo ei usu.', 2),
(3, 'Stefen Carman', 'Председатель', 'GH Group', 'testimonial-3.jpg', 'Ancillae interpretaris ea has. Id amet impedit qui, eripuit mnesarchum percipitur in eam. Ne sit habeo inimicus, no his liber regione volutpat. Ex quot voluptaria usu, dolor vivendo docendi nec ea. Et atqui vocent integre vim, quod cibo recusabo ei usu.', 3),
(4, 'Gary Brent', 'Финансовый директор', 'XYZ It Solution', 'testimonial-4.jpg', 'Ancillae interpretaris ea has. Id amet impedit qui, eripuit mnesarchum percipitur in eam. Ne sit habeo inimicus, no his liber regione volutpat. Ex quot voluptaria usu, dolor vivendo docendi nec ea. Et atqui vocent integre vim, quod cibo recusabo ei usu.', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `full_name`, `email`, `phone`, `password`, `photo`, `role`, `status`) VALUES
(1, 'John Doe', 'sadmin@gmail.com', '123-456-7899', '81dc9bdb52d04dc20036dbd8313ed055', 'user-1.jpg', 'Super Admin', 'Active'),
(13, 'David Smith', 'admin@gmail.com', '111-222-3333', '81dc9bdb52d04dc20036dbd8313ed055', '', 'Admin', 'Active');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `tbl_category_food_menu`
--
ALTER TABLE `tbl_category_food_menu`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `tbl_chef`
--
ALTER TABLE `tbl_chef`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Индексы таблицы `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`faq_id`);

--
-- Индексы таблицы `tbl_faq_category`
--
ALTER TABLE `tbl_faq_category`
  ADD PRIMARY KEY (`faq_category_id`);

--
-- Индексы таблицы `tbl_file`
--
ALTER TABLE `tbl_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Индексы таблицы `tbl_food_menu`
--
ALTER TABLE `tbl_food_menu`
  ADD PRIMARY KEY (`food_menu_id`);

--
-- Индексы таблицы `tbl_menu_footer`
--
ALTER TABLE `tbl_menu_footer`
  ADD PRIMARY KEY (`menu_id`);

--
-- Индексы таблицы `tbl_menu_main`
--
ALTER TABLE `tbl_menu_main`
  ADD PRIMARY KEY (`menu_id`);

--
-- Индексы таблицы `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Индексы таблицы `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD PRIMARY KEY (`page_id`);

--
-- Индексы таблицы `tbl_photo`
--
ALTER TABLE `tbl_photo`
  ADD PRIMARY KEY (`photo_id`);

--
-- Индексы таблицы `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_social`
--
ALTER TABLE `tbl_social`
  ADD PRIMARY KEY (`social_id`);

--
-- Индексы таблицы `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tbl_category_food_menu`
--
ALTER TABLE `tbl_category_food_menu`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tbl_chef`
--
ALTER TABLE `tbl_chef`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `tbl_faq_category`
--
ALTER TABLE `tbl_faq_category`
  MODIFY `faq_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tbl_file`
--
ALTER TABLE `tbl_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `tbl_food_menu`
--
ALTER TABLE `tbl_food_menu`
  MODIFY `food_menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `tbl_menu_footer`
--
ALTER TABLE `tbl_menu_footer`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tbl_menu_main`
--
ALTER TABLE `tbl_menu_main`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `tbl_page`
--
ALTER TABLE `tbl_page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `tbl_photo`
--
ALTER TABLE `tbl_photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tbl_social`
--
ALTER TABLE `tbl_social`
  MODIFY `social_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
