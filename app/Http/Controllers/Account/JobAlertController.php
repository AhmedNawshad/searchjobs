<?php

namespace App\Http\Controllers\Account;

use App\Models\JobAlert;
use App\Models\User;
use App\Models\PostType;
use Illuminate\Http\Request;
use App\Http\Requests\JobAlertRequest;
use Torann\LaravelMetaTags\Facades\MetaTag;

class JobAlertController extends AccountBaseController {

    private $perPage = 12;

    public function __construct() {
        parent::__construct();

        $this->perPage = (is_numeric(config('settings.listing.items_per_page'))) ? config('settings.listing.items_per_page') : $this->perPage;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $pagePath = 'jobAlerts';
        $data = [];
        $data['alerts'] = $this->alerts->paginate($this->perPage);
        //dd($data['alerts'][1]);

        // Meta Tags
        MetaTag::set('title', t('My Job Alerts'));
        MetaTag::set('description', t('My Job Alerts on :app_name', ['app_name' => config('settings.app.app_name')]));
        view()->share('pagePath', $pagePath);
        return view('account.alerts', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(JobAlertRequest $request) {
        //dd($request);
        $userId = auth()->user() ? auth()->user()->id : null;
        $data = [
            "user_id" => $userId,
            "name" => $request->name,
            "email" => $request->email,
            "period" => $request->frequency,
            "city_id" => request()->filled('l') ? $request->l : null,
            "postedDate" => request()->filled('postedDate') ? $request->postedDate : null,
            "maxSalary" => request()->filled('maxSalary') ? $request->maxSalary : null,
            "minSalary" => request()->filled('minSalary') ? $request->minSalary : null,
            "category_id" => request()->filled('c') ? $request->c : null,
            "url" => $request->fullUrlWithQuery(['name' => $request->name, 'email' => $request->email]),
        ];
        $postTypes =[];
        if(request()->filled('type')){
            foreach($request->type as $type){
                $postType = PostType::find($type);
                if($postType){
                    $postTypes[] = $postType->name;
                }
            }
        }
        if(count($postTypes)){
            $data['jobtypes'] = json_encode($postTypes);
        }
        
        JobAlert::create($data);

        flash("Your alert have been successfully updated. Thank you!")->success();
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function show(Review $review) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function edit(Review $review) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Review $review) {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Review  $review
     * @return \Illuminate\Http\Response
     */
    public function destroy(Review $review) {
        //
    }

}
