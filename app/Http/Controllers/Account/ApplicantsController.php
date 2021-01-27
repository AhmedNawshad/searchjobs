<?php

namespace App\Http\Controllers\Account;

use App\Models\User;
use App\Helpers\UrlGen;
use App\Models\Message;
use App\Models\Applicants;
use App\Notifications\ReplySent;
use App\Http\Requests\ReplyMessageRequest;
use Torann\LaravelMetaTags\Facades\MetaTag;

class ApplicantsController extends AccountBaseController
{
    
    	public function __construct()
	{
		parent::__construct();
		
		$this->perPage = (is_numeric(config('settings.listing.items_per_page'))) ? config('settings.listing.items_per_page') : $this->perPage;
	}

    public function index()
    {


        //$applicants = Applicants::all();
        
        $applicants =  $this->pendingApplicants->paginate($this->perPage);
        

        return view('account.applicants', ['applicants' => $applicants]);
    }
    
    public function connected()
    {
        view()->share('pagePath', 'connected-companies');
        $applicants =  $this->connectedApplicants->paginate($this->perPage);


        return view('account.connected-company', ['applicants' => $applicants]);
    }
}