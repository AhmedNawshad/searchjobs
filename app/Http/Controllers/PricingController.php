<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Torann\LaravelMetaTags\Facades\MetaTag;
class PricingController extends Controller
{
    public function index(){
          // Meta Tags
        MetaTag::set('title', t('Pricing'));
        MetaTag::set('description', t('Pricing - :app_name', ['app_name' => config('settings.app.app_name')]));

        return view('customs.pricing.index');
    }
}
