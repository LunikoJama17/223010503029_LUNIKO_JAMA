<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\modul2controller;
use App\Http\Controllers\headercontroller;

Route::get('/', function () {
    return view('welcome');
});

//route resource for products
Route::resource('/products', \App\Http\Controllers\ProductController::class);

Route::get('/Tugas-mod2', [modul2controller::class, 'index'])->name('modul-2');
Route::post('login', [modul2controller::class, 'login'])->name('login');

/**
 * route resource posts
 */
Route::resource('/posts', App\Http\Controllers\PostController::class);