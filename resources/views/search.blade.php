@extends('layouts.app')
@section('title', 'Search')
@section('content')

<div class="container">
    <h2 class="lead" style="margin:1em; margin-left:0;">Showing {{ $products->count() }} results for {{ $query }} out of {{ $products->total() }}</h2>
    @if ($products->total() == 0)
        <div class="alert alert-primary">
            لا توجد منتجات لبحثك
        </div>
    @else    
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">الإسم</th>
                    <th scope="col">السعر</th>
                    <th scope="col">التفاصيل</th>
                    <th scope="col">الوصف</th>
                    <th scope="col">صورة</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($products as $product)
                    <tr>
                        <th><a href="{{ route('shop.show', $product->slug) }}" class="text-decoration-none">{{ $product->name }}</a></th>
                        <td>${{ format($product->price) }}</td>
                        <td>{{ $product->details }}</td>
                        <td>{{ str_limit($product->description, 70) }}</td>
                        <td><img src="{{ productImage($product->image) }}" width="70" height="70"></td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endif
    {{ $products->links() }}
</div>

@endsection