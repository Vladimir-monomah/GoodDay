-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 19 2021 г., 11:30
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
(1, 'Sea Foods', 'sea-foods', 'Sea Foods', '', ''),
(2, 'Food and Drink', 'food-and-drink', 'Food and Drink', '', ''),
(3, 'Recipes', 'recipes', 'Recipes', '', ''),
(4, 'Restaurant Business', 'restaurant-business', 'Restaurant Business', '', '');

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
(3, 'John Henderson', 'john-henderson', 2, 'chef-3.jpg', 'chef-banner-3.jpg', '<h2>About</h2><p>Enim venenatis nisl wisi quis, in wisi. Sollicitudin eget mollis accumsan, ut wisi maecenas tortor. Magna vehicula auctor lacus aliquam. Vehicula bibendum ut sed class erat, et et risus vel pede ac, purus orci. Nulla integer sed sem. Ut erat dolor lectus consectetuer, vel tincidunt integer duis euismod nunc, pede pede nec mauris in, vel sem fuga dis ligula. Ridiculus placerat, odio ut, mauris per vitae vehicula lorem sed vestibulum, nec fusce cras orci enim.</p><h2>Degree</h2><p>At mi consectetuer. Mauris elementum a, ridiculus est leo adipiscing in commodo, dapibus tempus, mattis suspendisse, aliquam aliquam proin.</p><h2>Education</h2><p>Pellentesque nulla ut. Convallis eleifend ut est dui eros, porta enim odio luctus, sed orci nonummy tellus, wisi enim venenatis magnis, dolor nunc.</p><h2>Experience</h2><p>Sociosqu at metus luctus feugiat integer, imperdiet auctor risus. Vel ultricies dis et at sodales. Massa id urna eros tempor. Fusce lobortis dolor viverra, tempor consequat nibh, eget faucibus sapien porttitor wisi, velit et. Sollicitudin consectetuer interdum gravida metus maecenas.<br></p><p><br></p>\r\n', 'http://www.facebook.com', 'http://www.twitter.com', 'http://www.linkedin.com', '', '', '', '', '111-222-3333', 'info@yourwebsite.com', 'http://www.abc.com', 1, 'Active', 'John Henderson', '', ''),
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
  `designation_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_designation`
--

INSERT INTO `tbl_designation` (`designation_id`, `designation_name`) VALUES
(2, 'Management Chef'),
(5, 'Recipe Expert'),
(6, 'Assistant Chef'),
(7, 'Head Chef');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `faq_id` int(11) NOT NULL,
  `faq_title` varchar(255) NOT NULL,
  `faq_content` text NOT NULL,
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
  `faq_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_faq_category`
--

INSERT INTO `tbl_faq_category` (`faq_category_id`, `faq_category_name`) VALUES
(1, 'General Questions'),
(2, 'Client Query'),
(3, 'Technical Questions');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_file`
--

CREATE TABLE `tbl_file` (
  `file_id` int(11) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL
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
(18, 'Crispy Chicken', 'Chicken Thigh / Cheese / Pepper Jelly', '$8.00', 'food-menu-18.jpg', 5, 2),
(19, 'Roasted Turkey', 'Bacon / Avocado / Lettuce / Chimichurri', '$8.50', 'food-menu-19.jpg', 6, 2),
(20, 'Italian Cold Cut', 'Giardiniera / Garlic Aioli / Capicola', '$8.50', 'food-menu-20.jpg', 7, 2),
(21, 'Grilled Cheese', 'American Cheese / Toasty / White bread', '$9.00', 'food-menu-21.jpg', 8, 2),
(22, 'Hot Coffee', 'Tomatoes / Olive Oil / Cheese', '$4.00', 'food-menu-22.jpg', 9, 3),
(23, 'Marinated Grilled Shrimp', 'Fresh Shrimp / Oive Oil / Tomato Sauce', '$7.00', 'food-menu-23.jpg', 10, 3),
(24, 'Avocado & Mango Salsa', 'Avocado / Mango / Tomatoes', '$5.00', 'food-menu-24.jpg', 11, 3),
(25, 'Baked Potato Skins', 'Potatoes / Oil / Garlic', '$9.00', 'food-menu-25.jpg', 12, 3),
(26, 'Strawberry Shortcake', 'Buttermilk Biscuit / Strawberries / Cream', '$4.20', 'food-menu-26.jpg', 13, 4),
(27, 'Banana Split', 'Ice-cream with caramel / Strawberries', '$5.40', 'food-menu-27.jpg', 14, 4),
(28, 'Soft Drinks', 'Coke / Sprite / Lemonade', '$6.00', 'food-menu-28.jpg', 15, 4),
(29, 'Cold Juice', 'Apple / Orange / Grape Fruit', '$6.00', 'food-menu-29.jpg', 16, 4);

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
  `news_title` varchar(255) NOT NULL,
  `news_slug` varchar(255) NOT NULL,
  `news_content` text NOT NULL,
  `news_short_content` text NOT NULL,
  `news_date` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `total_view` int(11) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_news`
--

INSERT INTO `tbl_news` (`news_id`, `news_title`, `news_slug`, `news_content`, `news_short_content`, `news_date`, `photo`, `category_id`, `publisher`, `total_view`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(1, 'Putent accusamus te qui, vero forensibus ei ius', 'putent-accusamus-te-qui-vero-forensibus-ei-ius', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-1.jpg', 3, 'John Doe', 50, 'Putent accusamus te qui, vero forensibus ei ius', '', ''),
(2, 'Eu semper imperdiet duo, eos ut exerci sanctus', 'eu-semper-imperdiet-duo-eos-ut-exerci-sanctus', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-2.jpg', 3, 'John Doe', 1, 'Eu semper imperdiet duo, eos ut exerci sanctus', '', ''),
(3, 'Vis constituto complectitur an, modo falli eirmod', 'vis-constituto-complectitur-an-modo-falli-eirmod', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-3.jpg', 3, 'John Doe', 2, 'Vis constituto complectitur an, modo falli eirmod', '', ''),
(4, 'Latine sanctus perfecto ad pro. Ut vel molestiae', 'latine-sanctus-perfecto-ad-pro-ut-vel-molestiae', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-4.jpg', 4, 'John Doe', 2, 'Latine sanctus perfecto ad pro. Ut vel molestiae', '', ''),
(5, 'Mea ei regione blandit ullamcorper, definiebas constituam', 'mea-ei-regione-blandit-ullamcorper-definiebas-constituam', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-5.jpg', 4, 'John Doe', 22, 'Mea ei regione blandit ullamcorper, definiebas constituam', '', ''),
(6, 'At his ludus nonumes gloriatur. Ne vim tamquam', 'at-his-ludus-nonumes-gloriatur-ne-vim-tamquam', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-6.jpg', 4, 'John Doe', 0, 'At his ludus nonumes gloriatur. Ne vim tamquam', '', ''),
(7, 'Ad mea commune disputando, cu vel choro exerci', 'ad-mea-commune-disputando-cu-vel-choro-exerci', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-7.jpg', 2, 'John Doe', 0, 'Ad mea commune disputando, cu vel choro exerci', '', ''),
(8, 'Pri et oratio iisque atomorum, enim detracto', 'pri-et-oratio-iisque-atomorum-enim-detracto', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-8.jpg', 2, 'John Doe', 10, 'Pri et oratio iisque atomorum, enim detracto', '', ''),
(9, 'Mei ut errem legimus periculis, eos liber', 'mei-ut-errem-legimus-periculis-eos-liber', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-9.jpg', 1, 'John Doe', 9, 'Mei ut errem legimus periculis, eos liber', '', ''),
(10, 'Vix tale noluisse voluptua ad, ne brute', 'vix-tale-noluisse-voluptua-ad-ne-brute', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-10.jpg', 1, 'John Doe', 10, 'Vix tale noluisse voluptua ad, ne brute', '', ''),
(11, 'Liber utroque vim an, ne his brute vivendo', 'liber-utroque-vim-an-ne-his-brute-vivendo', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p>\r\n\r\n<p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p>\r\n\r\n<p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p>\r\n\r\n<p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p>\r\n\r\n<p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>\r\n', 'Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.', '05-09-2017', 'news-11.jpg', 1, 'John Doe', 17, 'Liber utroque vim an, ne his brute vivendo', '', '');

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
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `service_order` int(11) NOT NULL,
  `show_on_home` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_service`
--

INSERT INTO `tbl_service` (`id`, `name`, `description`, `photo`, `service_order`, `show_on_home`) VALUES
(4, 'Quality Food', '<p>Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.</p>\r\n', 'service-4.png', 0, 'Yes'),
(5, 'Special Items', '<p>Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.</p>\r\n', 'service-5.png', 0, 'Yes'),
(6, 'First Class Coffee', '<p>Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.</p>\r\n', 'service-6.png', 0, 'Yes'),
(14, 'Quality Food', '<p>Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.<br></p>', 'service-14.png', 4, 'No'),
(15, 'Special Items', '<p>Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.<br></p>', 'service-15.png', 5, 'No'),
(16, 'First Class Coffee', '<p>Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.<br></p>', 'service-16.png', 6, 'No');

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
  `heading` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `button_text` varchar(255) NOT NULL,
  `button_url` varchar(255) NOT NULL,
  `slide_order` int(11) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_slider`
--

INSERT INTO `tbl_slider` (`id`, `photo`, `heading`, `content`, `button_text`, `button_url`, `slide_order`, `status`) VALUES
(1, 'slider-1.jpg', 'Welcome to Our Cafe', 'The best restaurant in the city with great quality foods', 'Book Now', '#', 1, 'Active'),
(2, 'slider-2.jpg', 'Welcome to Our Cafe', 'The best restaurant in the city with great quality foods', 'Book Now', '#', 2, 'Active');

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
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `testimonial_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `tbl_testimonial`
--

INSERT INTO `tbl_testimonial` (`id`, `name`, `designation`, `company`, `photo`, `comment`, `testimonial_order`) VALUES
(1, 'John Doe', 'Managing Director', 'ABC Inc.', 'testimonial-1.jpg', 'Ancillae interpretaris ea has. Id amet impedit qui, eripuit mnesarchum percipitur in eam. Ne sit habeo inimicus, no his liber regione volutpat. Ex quot voluptaria usu, dolor vivendo docendi nec ea. Et atqui vocent integre vim, quod cibo recusabo ei usu.', 1),
(2, 'Dadiv Smith', 'CEO', 'SS Multimedia', 'testimonial-2.jpg', 'Ancillae interpretaris ea has. Id amet impedit qui, eripuit mnesarchum percipitur in eam. Ne sit habeo inimicus, no his liber regione volutpat. Ex quot voluptaria usu, dolor vivendo docendi nec ea. Et atqui vocent integre vim, quod cibo recusabo ei usu.', 2),
(3, 'Stefen Carman', 'Chairman', 'GH Group', 'testimonial-3.jpg', 'Ancillae interpretaris ea has. Id amet impedit qui, eripuit mnesarchum percipitur in eam. Ne sit habeo inimicus, no his liber regione volutpat. Ex quot voluptaria usu, dolor vivendo docendi nec ea. Et atqui vocent integre vim, quod cibo recusabo ei usu.', 3),
(4, 'Gary Brent', 'CFO', 'XYZ It Solution', 'testimonial-4.jpg', 'Ancillae interpretaris ea has. Id amet impedit qui, eripuit mnesarchum percipitur in eam. Ne sit habeo inimicus, no his liber regione volutpat. Ex quot voluptaria usu, dolor vivendo docendi nec ea. Et atqui vocent integre vim, quod cibo recusabo ei usu.', 4);

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
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;

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
