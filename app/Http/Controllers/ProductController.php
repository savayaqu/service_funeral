<?php

namespace App\Http\Controllers;

use App\Exceptions\ApiException;
use App\Http\Requests\CreatePhotoProductRequest;
use App\Http\Requests\CreateProductRequest;
use App\Http\Requests\UpdatePhotoProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Models\Product;
use App\Models\PhotoProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class  ProductController extends Controller
{
    //Создание товара
    public function create(CreateProductRequest $request) {
        $product = new Product($request->except('path'));
        $product->save();
        if ($request->hasFile('path')) {
            Product::createPhoto($request->file('path'), $product->id);
        }
        return response()->json(['message' => 'Товар создан'])->setStatusCode(201);
    }
    //Редактирование товара
    public function update(UpdateProductRequest $request, int $productId) {
        $product = Product::where('id', $productId)->first();
        if(!$product) {
            throw new ApiException(404, 'Товар не найден');
        }
        $product->fill($request->except('path'));
        $product->save();
        if ($request->hasFile('path')) {
            Product::createPhoto($request->file('path'), $product->id);
        }
        return response()->json(['message' => 'Товар обновлён'])->setStatusCode(200);
    }
    //Удаление товара
    public function delete(int $productId) {
        $product = Product::where('id', $productId)->first();
        if(!$product) {
            throw new ApiException(404, 'Товар не найден');
        }
        $product->delete();
        return response()->json(['message' => 'Товар удалён'])->setStatusCode(200);
    }

    //Метод просмотра всех товаров
    public function index() {
        $products = Product::with('categories')->get();

        if($products->isEmpty()) {
            throw new ApiException(404, 'Товары не найдены');
        } else {
            // Массив для хранения данных о продуктах с категориями
            $formattedProducts = [];
            // Проходим по каждому продукту и формируем данные для ответа
            foreach ($products as $product) {
                $formattedProduct = [
                    'id' => $product->id,
                    'name' => $product->name,
                    'description' => $product->description,
                    'price' => $product->price,
                    'quantity' => $product->quantity,
                    'category_id' => $product->category_id,
                    'category_name' => $product->categories->name ?? null,
                    'path' => $product->path
                ];
                // Добавляем сформированный продукт в массив
                $formattedProducts[] = $formattedProduct;
            }
            // Возвращаем данные о продуктах с категориями
            return response()->json([
                'data' => $formattedProducts,
            ]);
        }
    }
    //Метод просмотра конкретного товара
    public function show(int $id) {
        $product = Product::where('id', $id)->first();
        if(!$product) throw new ApiException(404, 'Не найдено');
        return response()->json([
            'data' => $product,
        ])->setStatusCode(200);
    }
}
