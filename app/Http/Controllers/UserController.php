<?php

namespace App\Http\Controllers;

use App\Exceptions\ApiException;
use App\Http\Requests\CreateUserRequest;
use App\Http\Requests\UpdateUserRequest;
use App\Models\Payment;
use App\Models\Role;
use App\Models\StatusOrder;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    //Метод регистрации
    public function create(CreateUserRequest $request)
    {
        $userData = $request->except('password');
        $user = new User($userData);
        $role = Role::where('code', 'user')->first();
        $user->role_id = $role->id;
        $user->password = Hash::make($request->input('password'));
        $user->save();
        return response()->json()->setStatusCode(201);
    }
    //Метод просмотра текущего профиля
    public function this()
    {
        $user=auth()->user()->load('shifts');
        return response()->json(['data'=>$user])->setStatusCode(200);
    }
}
