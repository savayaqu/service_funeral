<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AdminUpdatePaymentRequest extends ApiRequest
{

    public function rules(): array
    {
        return [
            'name' => 'string|max:64'
        ];
    }
}
