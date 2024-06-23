-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 22 2024 г., 17:37
-- Версия сервера: 8.0.37-0ubuntu0.22.04.3
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `zaikin-va`
--

-- --------------------------------------------------------

--
-- Структура таблицы `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Кресты', NULL, NULL),
(2, 'Гробы', NULL, NULL),
(3, 'Венки', NULL, NULL),
(4, 'Траурные ленты', NULL, NULL),
(5, 'Урны', NULL, NULL),
(6, 'Ритуальные услуги', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `compounds`
--

CREATE TABLE `compounds` (
  `id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `compounds`
--

INSERT INTO `compounds` (`id`, `quantity`, `total_price`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, 3400.00, 1, 9, NULL, NULL),
(2, 3, 600.00, 2, 13, NULL, NULL),
(3, 1, 6500.00, 2, 20, NULL, NULL),
(4, 1, 300.00, 3, 22, NULL, NULL),
(5, 2, 16000.00, 4, 5, NULL, NULL),
(6, 1, 31000.00, 3, 4, NULL, NULL),
(7, 3, 6900.00, 4, 11, NULL, NULL),
(8, 1, 3000.00, 1, 7, NULL, NULL),
(9, 2, 6000.00, 1, 7, NULL, NULL),
(10, 3, 9000.00, 1, 7, NULL, NULL),
(11, 3, 18000.00, 1, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_04_20_105201_create_roles_table', 1),
(3, '2024_04_20_105203_create_users_table', 1),
(4, '2024_04_20_105204_create_categories_table', 1),
(5, '2024_04_20_105205_create_products_table', 1),
(6, '2024_04_20_105207_create_carts_table', 1),
(7, '2024_04_20_105210_create_orders_table', 1),
(8, '2024_04_20_105211_create_compounds_table', 1),
(9, '2024_04_20_105212_create_reviews_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `date_order` datetime NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `date_order`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2023-04-22 15:14:15', 3, NULL, NULL),
(2, '2023-06-18 12:16:05', 4, NULL, NULL),
(3, '2023-07-03 20:20:11', 5, NULL, NULL),
(4, '2024-02-21 05:53:35', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(15,2) NOT NULL,
  `quantity` int NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `quantity`, `category_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 'Гроб простой без постели', 'Материал: Сосновая доска\\r\\nОтделка гроба: Ткань бордового цвета', 6500.00, 9999, 2, 'Product/1/1_1714495671.jpeg', NULL, NULL),
(2, 'Гроб социальный без постели', 'Материал: Сосновая доска\\r\\nОтделка гроба: Ткань бордового цвета', 6500.00, 9999, 2, 'Product/2/2_1713951267.jpeg', NULL, NULL),
(3, 'Гроб шёлковый белый с тесьмой', 'Материал: Сосновая доска\\r\\nОтделка гроба: Шелковая ткань белого цвета, отделка тесьмой по контуру', 7500.00, 9999, 2, 'Product/3/3_1713951276.jpeg', NULL, NULL),
(4, 'Гроб полированный «Скрипка» белый', 'Материал: Сосновая доска\\r\\nОтделка гроба: Эксклюзивный полированный белый гроб.', 31000.00, 666, 2, 'Product/4/4_1713951284.jpeg', NULL, NULL),
(5, 'Крест дубовый с домиком', NULL, 8000.00, 9999, 1, 'Product/5/5_1713951289.jpg', NULL, NULL),
(6, 'Крест дубовый без домика', NULL, 7500.00, 9999, 1, 'Product/6/6_1713951296.jpg', NULL, NULL),
(7, 'Крест «Вечная память»', NULL, 3000.00, 5, 1, 'Product/7/7_1713951302.jpeg', NULL, NULL),
(8, 'Крест православный с распятием', NULL, 2600.00, 777, 1, 'Product/8/8_1713951312.jpeg', NULL, NULL),
(9, 'Венок 75 см', 'Артикул: 07500\\r\\nЦвет: Красный\\r\\nМатериал: Искусственные цветы', 1700.00, 9999, 3, 'Product/9/9_1713951321.png', NULL, NULL),
(10, 'Венок 85 см', 'Артикул: Р08503Б\\r\\nЦвет: Белый\\r\\nМатериал: Искусственные цветы', 1900.00, 9999, 3, 'Product/10/10_1713951326.jpeg', NULL, NULL),
(11, 'Венок 105 см', 'Артикул: Р10514\\r\\nЦвет: Бежевый\\r\\nМатериал: Искусственные цветы', 2300.00, 9999, 3, 'Product/11/11_1713951332.jpeg', NULL, NULL),
(12, 'Венок 120 см', 'Артикул: Р12002Е\\r\\nЦвет: Зеленый с белым\\r\\nМатериал: Искусственные цветы', 6000.00, 9999, 3, 'Product/12/12_1713951337.jpg', NULL, NULL),
(13, 'Лента траурная', 'Возможны различные варианты траурных надписей', 200.00, 9999, 4, 'Product/13/13_1713951342.jpeg', NULL, NULL),
(14, 'Урна для праха ДУ-4', NULL, 3190.00, 1488, 5, 'Product/14/14_1713951347.jpeg', NULL, NULL),
(15, 'Урна для праха УФ-16', NULL, 3290.00, 1488, 5, 'Product/15/15_1713951352.jpeg', NULL, NULL),
(16, 'Урна для праха У17Н', NULL, 4500.00, 1488, 5, 'Product/16/16_1713951357.png', NULL, NULL),
(17, 'Урна для праха УРД-2-О', NULL, 5100.00, 1488, 5, 'Product/17/17_1713951362.jpeg', NULL, NULL),
(18, 'Выезд агента на адрес', 'Чтобы облегчить тяжесть утраты и избавить вас от забот по самостоятельной организации похорон ваших родных, у нас предусмотрена услуга вызов ритуального агента на адрес к заказчику. На месте из каталога, предоставленного агентом, вы сможете выбрать и заказать доставку необходимых атрибутов для похорон усопшего, а также заключить договор на предоставление необходимого вам пакета услуг, который включает в себя все начиная с изделий для похорон и заканчивая бронированием места для организации поминального обеда.', 5000.00, 9999, 6, 'Product/18/18_1714497031.jpg', NULL, NULL),
(19, 'Доставка тела', 'Смерть родных людей всегда большое потрясение. Поэтому, многие обращаются в агентства по организации похорон, которые берут на себя все сложности с перевозкой тела из дома в морг и обратно. Со стоимостью доставки тела можно ознакомиться в прайсе. Доставка осуществляется в заранее оговоренный день и время.\\r\\nПеревозка тела покойного может быть не только внутренней, но и международной. В каждой стране существуют свои законы и правила, которые необходимо соблюдать при перевозке тела, если речь идет о дальнобойной доставки тела усопшего. Одним из основных требований является наличие комплекта документов на покойного человека, который включает в себя: смертный акт, медицинское заключение о причинах смерти и другие документы.\\r\\nПодготовка тела к перевозке также требует особого внимания. Оно должно быть помещено в герметичный и специально предназначенный для этого контейнер. Кроме того, на тело должна быть наложена специальная противомозговая повязка, чтобы предотвратить выделение гниющих газов и запаха. Это все касается междугородних перевозок, внутригородские проходят значительно проще, об этом готовы проконсультировать по телефону.', 2600.00, 9999, 6, 'Product/19/19_1714497057.jpg', NULL, NULL),
(20, 'Катафалк', 'В функциональном отношении катафалк предназначен для службы похорон и перевозки умершего из дома или больницы до кладбища. Кроме того, такой автомобиль может использоваться в качестве элемента траурной церемонии. Катафалки существуют с различным уровнем окраски и декорации, в зависимости от религиозных и культурных принципов, но как правило, все они представляют собой строгий, но очень красивый элемент траурной обстановки.\\r\\nХотя использование катафалка многим людям может показаться несколько запрещённым и странным делом, но в реальности это является принятой практикой в многих странах мира, где траурные обряды проводятся с большим уважением и почтением к умершему.\\r\\nЗаказать Катафалк для перевозки тела усопшего в Томске\\r\\nАренда катафалка в Томске - неотъемлемая часть для организации церемонии проводов родственника. Перевозка гроба с покойным чаще осуществляется специализированным похоронным транспортом, который предоставляется нашим агентством в границах области.', 6500.00, 9999, 6, 'Product/20/20_1714497077.jpg', NULL, NULL),
(21, 'Омовение, одеяние покойного', 'Омовение и одевание покойного являются важной частью процесса похоронных обрядов. Эти этапы позволяют прощаться с ушедшим близким и подготовить тело к похоронам. Омовение покойного, также известное как орошение или орошение водой, является одним из старейших похоронных обрядов. Это обряд, при котором тело покойного тщательно очищается водой или другой жидкостью. Омовение производится для устранения любых остатков загрязнений или радости, которые могут остаться на теле.\\r\\nРитуал омовения и облачения покойного в одежду перед укладкой в гроб требует соблюдения некоторых правил данной процедуры, с которыми знаком не каждый. Поэтому для выполнения таких работ приглашают людей, которые хорошо знакомы с процессом. Обычно это пожилые женщины, но не обязательно. С этой услугой часто покупают и ритуальные товары, и памятники.', 4000.00, 9999, 6, 'Product/21/21_1714497123.jpg', NULL, NULL),
(22, 'Укладка тела в гроб', 'Подготовка к укладке тела начинается с момента поступления его в морг. Специалисты производят внешний осмотр, определяют причину смерти и состояние тела. Все эти данные необходимы для того, чтобы правильно подготовить тело и убедиться в его готовности к укладке в гроб.\\r\\nПосле укладки тела в гроб, его переносят в комнату, где происходит прощание. Родственники и близкие могут провести здесь свои последние минуты с усопшим, выразив свой скорбный отпуск и прощание. Определенное количество времени отводится на последний прощальный привет усопшему, и только потом гроб закрывают и направляют на кладбище для дальнейшей церемонии погребения. То как тело было подготовлено и уложено в гроб психологически влияет на общий процесс всей церемонии, на это в свою очередь может влиять стоимость услуг укладки тела в гроб.', 300.00, 9999, 6, 'Product/22/22_1714497144.jpeg', NULL, NULL),
(23, 'Установка креста', 'Установка креста на кладбище – это непростой процесс, требующий серьезной подготовки. Во-первых, необходимо выбрать подходящее место для установки креста. Во-вторых, крест необходимо подготовить перед установкой, обработав его специальными растворами или лаками, чтобы он не портился со временем, поэтому этим должны заниматься опытные люди со своей ценой на установку крестов на могилу.\\r\\nНо главное, что нужно учитывать при установке креста на кладбище – это уважение к погибшему. Это трагичный момент в жизни родственников и близких усопшего, поэтому важно сделать все максимально качественно и соответствующим образом, чтобы это осталось на долгое время в памяти всех, кто ушел в мир иной.', 1000.00, 9999, 6, 'Product/23/23_1714497162.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `rating` int NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `rating`, `description`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 5, 'Отличный венок, очень красивый', 3, 9, NULL, NULL),
(2, 4, 'Хороший крест, но немного дороговат', 3, 5, NULL, NULL),
(3, 3, 'Не плохой крест, но не очень качественный', 3, 5, NULL, NULL),
(4, 5, 'Вполне хороший венок за свою цену', 3, 9, NULL, NULL),
(5, 2, 'Очень плохой товар, не рекомендую', 5, 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Администратор', 'admin', NULL, NULL),
(2, 'Клиент', 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` bigint NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `patronymic`, `login`, `password`, `email`, `telephone`, `api_token`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'Алексей', 'Смирнов', 'Владимирович', 'savayaqu', '$2y$12$YQ5P34XbjdrKkvHMTcf37.8Mp8Y1W0hGtfhamID4i6OeyTA4DzW4a', 'savayaqu@mail.ru', 88005553535, 'savayaqu', 1, NULL, NULL),
(2, 'Елена', 'Иванова', 'Сергеевна', 'admin', '$2y$12$i5yXWIxvw.RsCzQ.lvT4BuuMIDaA8QhLdr8W12A2hNObOMIYiUpwO', 'admin@mail.ru', 89061902635, 'admin', 1, NULL, NULL),
(3, 'Иван', 'Кузнецов', 'Николаевич', 'ivan', '$2y$12$Xr/vkpaGBt1xSktOAjQ5NerK7aaL5GVx683u9hSKvSTN7aSEkR.x6', 'ivan@mail.ru', 89134597126, 'ivan', 2, NULL, NULL),
(4, 'Ольга', 'Попова', 'Анатольевна', 'user1', '$2y$12$Pz4G8qyGVwF1zfvcer4BCOqb91CgbvRXfJLEYS/ZJeD.SXkx.Q1KK', 'user1@mail.ru', 89112538619, 'user1', 2, NULL, NULL),
(5, 'Дмитрий', 'Лебедев', 'Игоревич', 'user2', '$2y$12$JTxPGaEGgIQqMIhWBrKNLeo58i2DL5T4zJYl/ah88S2XNC4m1kJn6', 'user2@mail.ru', 89168120459, 'user2', 2, NULL, NULL),
(6, 'Екатерина', 'Морозова', 'Владимировна', 'user3', '$2y$12$xYuzmN4dK/uhCO564L8maOKz36.wEK4783IRpfhSKEM5XwZKRp5Am', 'user3@mail.ru', 89065551254, 'user3', 2, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `compounds`
--
ALTER TABLE `compounds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compounds_order_id_foreign` (`order_id`),
  ADD KEY `compounds_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_path_unique` (`path`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_code_unique` (`code`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login_unique` (`login`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_telephone_unique` (`telephone`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `compounds`
--
ALTER TABLE `compounds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `compounds`
--
ALTER TABLE `compounds`
  ADD CONSTRAINT `compounds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compounds_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
