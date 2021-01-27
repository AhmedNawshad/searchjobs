<?php

namespace App\Http\Controllers\Account;

use App\Models\User;
use App\Helpers\UrlGen;
use App\Models\Message;
use App\Models\Package;
use App\Notifications\ReplySent;
use App\Http\Requests\ReplyMessageRequest;
use Torann\LaravelMetaTags\Facades\MetaTag;

class PackageController extends AccountBaseController
{

    public function index()
    {


        $applicants = Package::all();


        return view('account.package', ['applicants' => $applicants]);
    }
}