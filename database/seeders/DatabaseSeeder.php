<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run()
    {
        // Заполнение таблицы categories
        DB::table('categories')->insert([
            ['name' => 'Кресты'],
            ['name' => 'Гробы'],
            ['name' => 'Венки'],
            ['name' => 'Траурные ленты'],
            ['name' => 'Урны'],
            ['name' => 'Ритуальные услуги']
        ]);
        // Заполнение таблицы products
        DB::table('products')->insert([
            ['name' => 'Гроб простой без постели', 'description' => 'Материал: Сосновая доска\r\nОтделка гроба: Ткань бордового цвета', 'price' => 6500, 'quantity' => 9999, 'category_id' => 2,'path' => 'Product/1/1_1714495671.jpeg'],
            ['name' => 'Гроб социальный без постели', 'description' => 'Материал: Сосновая доска\r\nОтделка гроба: Ткань бордового цвета', 'price' => 6500, 'quantity' => 9999, 'category_id' => 2, 'path' => 'Product/2/2_1713951267.jpeg'],
            ['name' => 'Гроб шёлковый белый с тесьмой', 'description' => 'Материал: Сосновая доска\r\nОтделка гроба: Шелковая ткань белого цвета, отделка тесьмой по контуру', 'price' => 7500, 'quantity' => 9999, 'category_id' => 2, 'path' => 'Product/3/3_1713951276.jpeg'],
            ['name' => 'Гроб полированный «Скрипка» белый', 'description' => 'Материал: Сосновая доска\r\nОтделка гроба: Эксклюзивный полированный белый гроб.', 'price' => 31000, 'quantity' => 666, 'category_id' => 2, 'path' => 'Product/4/4_1713951284.jpeg'],
            ['name' => 'Крест дубовый с домиком',  'description' => NULL, 'price' => 8000, 'quantity' => 9999, 'category_id' => 1   ,'path' => 'Product/5/5_1713951289.jpg' ],
            ['name' => 'Крест дубовый без домика', 'description' => NULL, 'price' => 7500.00, 'quantity' => 9999, 'category_id' => 1,'path' => 'Product/6/6_1713951296.jpg' ],
            ['name' => 'Крест «Вечная память»',    'description' => NULL, 'price' => 3000.00, 'quantity' => 5, 'category_id' => 1   ,'path' => 'Product/7/7_1713951302.jpeg'],
            ['name' => 'Крест православный с распятием','description' => NULL, 'price' => 2600.00, 'quantity' => 777, 'category_id' => 1                                                            , 'path' => 'Product/8/8_1713951312.jpeg'   ],
            ['name' => 'Венок 75 см', 'description' => 'Артикул: 07500\r\nЦвет: Красный\r\nМатериал: Искусственные цветы', 'price' => 1700.00, 'quantity' => 9999, 'category_id' => 3               , 'path' => 'Product/9/9_1713951321.png'    ],
            [ 'name' => 'Венок 85 см', 'description' => 'Артикул: Р08503Б\r\nЦвет: Белый\r\nМатериал: Искусственные цветы', 'price' => 1900.00, 'quantity' => 9999, 'category_id' => 3              , 'path' => 'Product/10/10_1713951326.jpeg' ],
            [ 'name' => 'Венок 105 см', 'description' => 'Артикул: Р10514\r\nЦвет: Бежевый\r\nМатериал: Искусственные цветы', 'price' => 2300.00, 'quantity' => 9999, 'category_id' => 3            , 'path' => 'Product/11/11_1713951332.jpeg' ],
            [ 'name' => 'Венок 120 см', 'description' => 'Артикул: Р12002Е\r\nЦвет: Зеленый с белым\r\nМатериал: Искусственные цветы', 'price' => 6000.00, 'quantity' => 9999, 'category_id' => 3   , 'path' => 'Product/12/12_1713951337.jpg'  ],
            [ 'name' => 'Лента траурная', 'description' => 'Возможны различные варианты траурных надписей', 'price' => 200.00, 'quantity' => 9999, 'category_id' => 4,'path' => 'Product/13/13_1713951342.jpeg'   ],
            [ 'name' => 'Урна для праха ДУ-4',  'description' => NULL,  'price' => 3190.00, 'quantity' => 1488, 'category_id' => 5                                   ,'path' => 'Product/14/14_1713951347.jpeg'   ],
            [ 'name' => 'Урна для праха УФ-16', 'description' => NULL,  'price' => 3290.00, 'quantity' => 1488, 'category_id' => 5                                   ,'path' => 'Product/15/15_1713951352.jpeg'   ],
            [ 'name' => 'Урна для праха У17Н',  'description' => NULL,  'price' => 4500.00, 'quantity' => 1488, 'category_id' => 5                                   ,'path' => 'Product/16/16_1713951357.png'    ],
            [ 'name' => 'Урна для праха УРД-2-О','description' => NULL, 'price' => 5100.00, 'quantity' => 1488, 'category_id' => 5                                   ,'path' => 'Product/17/17_1713951362.jpeg'   ],
            [ 'name' => 'Выезд агента на адрес', 'description' => 'Чтобы облегчить тяжесть утраты и избавить вас от забот по самостоятельной организации похорон ваших родных, у нас предусмотрена услуга вызов ритуального агента на адрес к заказчику. На месте из каталога, предоставленного агентом, вы сможете выбрать и заказать доставку необходимых атрибутов для похорон усопшего, а также заключить договор на предоставление необходимого вам пакета услуг, который включает в себя все начиная с изделий для похорон и заканчивая бронированием места для организации поминального обеда.', 'price' => 5000.00, 'quantity' => 9999, 'category_id' => 6, 'path' => 'Product/18/18_1714497031.jpg' ],
            [ 'name' => 'Доставка тела', 'description' => 'Смерть родных людей всегда большое потрясение. Поэтому, многие обращаются в агентства по организации похорон, которые берут на себя все сложности с перевозкой тела из дома в морг и обратно. Со стоимостью доставки тела можно ознакомиться в прайсе. Доставка осуществляется в заранее оговоренный день и время.\r\nПеревозка тела покойного может быть не только внутренней, но и международной. В каждой стране существуют свои законы и правила, которые необходимо соблюдать при перевозке тела, если речь идет о дальнобойной доставки тела усопшего. Одним из основных требований является наличие комплекта документов на покойного человека, который включает в себя: смертный акт, медицинское заключение о причинах смерти и другие документы.\r\nПодготовка тела к перевозке также требует особого внимания. Оно должно быть помещено в герметичный и специально предназначенный для этого контейнер. Кроме того, на тело должна быть наложена специальная противомозговая повязка, чтобы предотвратить выделение гниющих газов и запаха. Это все касается междугородних перевозок, внутригородские проходят значительно проще, об этом готовы проконсультировать по телефону.', 'price' => 2600.00, 'quantity' => 9999, 'category_id' => 6, 'path' => 'Product/19/19_1714497057.jpg' ],
            [ 'name' => 'Катафалк', 'description' => 'В функциональном отношении катафалк предназначен для службы похорон и перевозки умершего из дома или больницы до кладбища. Кроме того, такой автомобиль может использоваться в качестве элемента траурной церемонии. Катафалки существуют с различным уровнем окраски и декорации, в зависимости от религиозных и культурных принципов, но как правило, все они представляют собой строгий, но очень красивый элемент траурной обстановки.\r\nХотя использование катафалка многим людям может показаться несколько запрещённым и странным делом, но в реальности это является принятой практикой в многих странах мира, где траурные обряды проводятся с большим уважением и почтением к умершему.\r\nЗаказать Катафалк для перевозки тела усопшего в Томске\r\nАренда катафалка в Томске - неотъемлемая часть для организации церемонии проводов родственника. Перевозка гроба с покойным чаще осуществляется специализированным похоронным транспортом, который предоставляется нашим агентством в границах области.', 'price' => 6500.00, 'quantity' => 9999, 'category_id' => 6, 'path' => 'Product/20/20_1714497077.jpg'],
            [ 'name' => 'Омовение, одеяние покойного', 'description' => 'Омовение и одевание покойного являются важной частью процесса похоронных обрядов. Эти этапы позволяют прощаться с ушедшим близким и подготовить тело к похоронам. Омовение покойного, также известное как орошение или орошение водой, является одним из старейших похоронных обрядов. Это обряд, при котором тело покойного тщательно очищается водой или другой жидкостью. Омовение производится для устранения любых остатков загрязнений или радости, которые могут остаться на теле.\r\nРитуал омовения и облачения покойного в одежду перед укладкой в гроб требует соблюдения некоторых правил данной процедуры, с которыми знаком не каждый. Поэтому для выполнения таких работ приглашают людей, которые хорошо знакомы с процессом. Обычно это пожилые женщины, но не обязательно. С этой услугой часто покупают и ритуальные товары, и памятники.', 'price' => 4000.00, 'quantity' => 9999, 'category_id' => 6, 'path' => 'Product/21/21_1714497123.jpg'],
            [ 'name' => 'Укладка тела в гроб', 'description' => 'Подготовка к укладке тела начинается с момента поступления его в морг. Специалисты производят внешний осмотр, определяют причину смерти и состояние тела. Все эти данные необходимы для того, чтобы правильно подготовить тело и убедиться в его готовности к укладке в гроб.\r\nПосле укладки тела в гроб, его переносят в комнату, где происходит прощание. Родственники и близкие могут провести здесь свои последние минуты с усопшим, выразив свой скорбный отпуск и прощание. Определенное количество времени отводится на последний прощальный привет усопшему, и только потом гроб закрывают и направляют на кладбище для дальнейшей церемонии погребения. То как тело было подготовлено и уложено в гроб психологически влияет на общий процесс всей церемонии, на это в свою очередь может влиять стоимость услуг укладки тела в гроб.', 'price' => 300.00, 'quantity' => 9999, 'category_id' => 6, 'path' => 'Product/22/22_1714497144.jpeg'],
            [ 'name' => 'Установка креста', 'description' => 'Установка креста на кладбище – это непростой процесс, требующий серьезной подготовки. Во-первых, необходимо выбрать подходящее место для установки креста. Во-вторых, крест необходимо подготовить перед установкой, обработав его специальными растворами или лаками, чтобы он не портился со временем, поэтому этим должны заниматься опытные люди со своей ценой на установку крестов на могилу.\r\nНо главное, что нужно учитывать при установке креста на кладбище – это уважение к погибшему. Это трагичный момент в жизни родственников и близких усопшего, поэтому важно сделать все максимально качественно и соответствующим образом, чтобы это осталось на долгое время в памяти всех, кто ушел в мир иной.', 'price' => 1000.00, 'quantity' => 9999, 'category_id' => 6, 'path' => 'Product/23/23_1714497162.jpg'],
        ]);

        // Заполнение таблицы roles
        DB::table('roles')->insert([
            ['name' => 'Администратор', 'code' => 'admin'],
            ['name' => 'Клиент', 'code' => 'user'],
        ]);
        // Заполнение таблицы пользователи
        DB::table('users')->insert([
           ['name' => 'Алексей', 'surname' => 'Смирнов', 'patronymic' => 'Владимирович', 'login' => 'savayaqu',     'password' => Hash::make('savayaqu'), 'email' => 'savayaqu@mail.ru', 'telephone' => '88005553535', 'api_token' => 'savayaqu', 'role_id' => 1,],
           ['name' => 'Елена', 'surname' => 'Иванова', 'patronymic' => 'Сергеевна', 'login' => 'admin',             'password' => Hash::make('admin'), 'email' => 'admin@mail.ru', 'telephone' => '89061902635', 'api_token' => 'admin', 'role_id' => 1,         ],
           ['name' => 'Иван', 'surname' => 'Кузнецов', 'patronymic' => 'Николаевич', 'login' => 'ivan',             'password' => Hash::make('ivan'), 'email' => 'ivan@mail.ru', 'telephone' => '89134597126', 'api_token' => 'ivan', 'role_id' => 2,            ],
           ['name' => 'Ольга', 'surname' => 'Попова', 'patronymic' => 'Анатольевна', 'login' => 'user1',            'password' => Hash::make('user1'), 'email' => 'user1@mail.ru', 'telephone' => '89112538619', 'api_token' => 'user1', 'role_id' => 2,         ],
           ['name' => 'Дмитрий', 'surname' => 'Лебедев', 'patronymic' => 'Игоревич', 'login' => 'user2',            'password' => Hash::make('user2'), 'email' => 'user2@mail.ru', 'telephone' => '89168120459', 'api_token' => 'user2', 'role_id' => 2,         ],
           ['name' => 'Екатерина', 'surname' => 'Морозова', 'patronymic' => 'Владимировна', 'login' => 'user3',     'password' => Hash::make('user3'), 'email' => 'user3@mail.ru', 'telephone' => '89065551254', 'api_token' => 'user3', 'role_id' => 2,         ],
        ]);
        // Заполнение таблицы заказы
        DB::table('orders')->insert([
            ['date_order' => '2023-04-22 15:14:15', 'user_id' => 3,],
            ['date_order' => '2023-06-18 12:16:05', 'user_id' => 4,],
            ['date_order' => '2023-07-03 20:20:11', 'user_id' => 5,],
            ['date_order' => '2024-02-21 05:53:35', 'user_id' => 3,]
        ]);
        // Заполнение таблицы состав заказа
        DB::table('compounds')->insert([
            ['quantity' => 2, 'total_price' => 3400, 'order_id' => 1, 'product_id' => 9],
            ['quantity' => 3, 'total_price' => 600, 'order_id' => 2, 'product_id' => 13],
            ['quantity' => 1, 'total_price' => 6500, 'order_id' => 2, 'product_id' => 20],
            ['quantity' => 1, 'total_price' => 300, 'order_id' => 3, 'product_id' => 22],
            ['quantity' => 2, 'total_price' => 16000, 'order_id' => 4, 'product_id' => 5],
            ['quantity' => 1, 'total_price' => 31000, 'order_id' => 3, 'product_id' => 4],
            ['quantity' => 3, 'total_price' => 6900, 'order_id' => 4, 'product_id' => 11],
            ['quantity' => 1, 'total_price' => 3000, 'order_id' => 1, 'product_id' => 7],
            ['quantity' => 2, 'total_price' => 6000, 'order_id' => 1, 'product_id' => 7],
            ['quantity' => 3, 'total_price' => 9000, 'order_id' => 1, 'product_id' => 7],
            ['quantity' => 3, 'total_price' => 18000, 'order_id' => 1, 'product_id' => 6],
        ]);
        // Заполнение таблицы отзывов
        DB::table('reviews')->insert([
            ['rating' => 5, 'description' => 'Отличный венок, очень красивый', 'user_id' => 3, 'product_id' => 9],
            ['rating' => 4, 'description' => 'Хороший крест, но немного дороговат', 'user_id' => 3, 'product_id' => 5],
            ['rating' => 3, 'description' => 'Не плохой крест, но не очень качественный', 'user_id' => 3, 'product_id' => 5],
            ['rating' => 5, 'description' => 'Вполне хороший венок за свою цену', 'user_id' => 3, 'product_id' => 9],
            ['rating' => 2, 'description' => 'Очень плохой товар, не рекомендую', 'user_id' => 5, 'product_id' => 22],
        ]);

    }
}
