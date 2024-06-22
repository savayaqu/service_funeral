<?php

namespace App\Http\Controllers;

use App\Exceptions\ApiException;
use App\Http\Requests\AdminCreatePaymentRequest;
use App\Http\Requests\AdminCreateReviewRequest;
use App\Http\Requests\AdminCreateUserRequest;
use App\Http\Requests\AdminUpdateOrderRequest;
use App\Http\Requests\AdminUpdatePaymentRequest;
use App\Http\Requests\AdminUpdateReviewRequest;
use App\Http\Requests\AdminUpdateUserRequest;
use App\Http\Requests\CreateNewsRequest;
use App\Http\Requests\CreateRoleRequest;
use App\Http\Requests\UpdateNewsRequest;
use App\Http\Requests\UpdateRoleRequest;
use App\Models\Category;
use App\Models\Compound;
use App\Models\News;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Product;
use App\Models\Review;
use App\Models\Role;
use App\Models\StatusOrder;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function getUsers()
    {
        $users = User::all();
        if($users->isEmpty()) {
            throw new ApiException(404, 'Пользователи не найдены');
        }
        return response()->json(['data' => $users])->setStatusCode(200);
    }
    public function createCategory(AdminCreatePaymentRequest $request)
    {
        $category = new Category($request->all());
        $category->save();
        return response()->json(['message' => 'Категория успешно сохранена'])->setStatusCode(201);
    }
    public function updateCategory(AdminUpdatePaymentRequest $request, int $categoryId)
    {
        $category = Category::where('id', $categoryId)->first();
        if(!$category) {
            throw new ApiException(404, 'Не найдено');
        }
        $category->fill($request->all());
        $category->save();
        return response()->json(['message' => 'Категория ' .$categoryId. ' обновлена'])->setStatusCode(200);
    }
    public function deleteCategory(int $categoryId)
    {
        $category = Category::where('id', $categoryId)->first();
        if(!$category) {
            throw new ApiException(404, 'Не найдено');
        }
        $category->delete();
        return response()->json(['message' => 'Категория ' .$categoryId. ' удалён'])->setStatusCode(200);
    }
}
