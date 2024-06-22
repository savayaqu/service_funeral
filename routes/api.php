<?php

use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\AuthController;
use \App\Http\Controllers\NewsController;
use \App\Http\Controllers\AdminController;
use \App\Http\Controllers\ShiftController;
use \App\Http\Controllers\CompoundController;
use \App\Http\Controllers\RoleController;
             // Функционал пользователя
//Регистрация
Route::post('/register', [UserController::class, 'create']);
//Авторизация
Route::post('/login', [AuthController::class, 'login' ]);
//Просмотр всех товаров
Route::get('/products', [ProductController::class, 'index']);
//Просмотр отзывов у товара
Route::get('/product/{id}/reviews', [ReviewController::class, 'show']);
            // Функционал авторизированного пользователя
Route::middleware('auth:api')->group(function () {
    //Выход
    Route::get('/logout', [AuthController::class, 'logout']);
    //Просмотр профиля
    Route::get('/profile', [UserController::class, 'this']);
    //Создание отзыва для купленного товара
    Route::post('/product/{id}/review/create', [ReviewController::class, 'createReview']);
});
            // Функционал администратора
Route::middleware('auth:api', 'role:admin')->group(function () {
            //CRUD PRODUCTS
   //Создание товара
    Route::post('/product/create', [ProductController::class, 'create']);
    //Редактирование товара
    Route::post('/product/{id}/update', [ProductController::class, 'update']);
    //Удаление товара
    Route::delete('/product/{id}/delete', [ProductController::class, 'delete']);
            //CRUD категорий
    //Создание категории
    Route::post('/category/create'       , [AdminController::class, 'createCategory']);
    //Обновление категории
    Route::post('/category/{id}/update' , [AdminController::class, 'updateCategory']);
    //Удаление категории
    Route::delete('/category/{id}/delete', [AdminController::class, 'deleteCategory']);


    //Просмотр всех пользователей
    Route::get('/users',[AdminController::class, 'getUsers']);
});
