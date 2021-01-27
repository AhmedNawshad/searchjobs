<?php

namespace App\Http\Controllers\Search;

use App\Helpers\Search;
use App\Http\Controllers\Search\Traits\PreSearchTrait;
use App\Models\User;
use App\Models\Message;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use phpseclib\Crypt\Base;
use Torann\LaravelMetaTags\Facades\MetaTag;
use App\Models\Review;
use App\Models\Post;

class SearchTalentController extends BaseController
{
    use PreSearchTrait;

    public $isIndexSearch = true;

    protected $cat = null;
    protected $subCat = null;
    protected $city = null;
    protected $admin = null;


    protected $filters = [
        'salary_from' => [
            'field' => 'salary',
            'condition' => '>=',
        ],
        'salary_to' => [
            'field' => 'salary',
            'condition' => '<=',
        ],
        'age_from' => [
            'field' => 'age',
            'condition' => '>=',
        ],
        'age_to' => [
            'field' => 'age',
            'condition' => '<=',
        ],
        'gender' => [
            'field' => 'gender',
            'condition' => '=',
        ],
        'experience' => [
            'field' => 'experience',
            'condition' => '=',
        ],
        'sector_id' => [
            'field' => 'sector_id',
            'condition' => '=',
        ],
        'qualifications' => [
            'field' => 'qualifications',
            'condition' => 'LIKE',
        ],
        'skills' => [
            'field' => 'skills',
            'condition' => 'LIKE',
        ],
    ];

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request)
    {
        //age
        //gender
        //location
        //sector_id
        //qualifications
        //experience
        //salary
        //skills

        $users = $this->getUsers($request);

        $count =  User::where('user_type_id', 2)->count();

        // Get Titles
        $title = $this->getTitle();
        $this->getBreadcrumb();
        $this->getHtmlTitle();

        // Meta Tags
        MetaTag::set('title', 'Talents');
        MetaTag::set('description', $title);

        return view('customs.talents.index')->with('users', $users)->with('count', $count);
    }

    /**
     * @param Request $request
     * @return mixed
     */
    protected function getUsers(Request $request)
    {
        $builder = User::where('user_type_id', 2)->latest();

        foreach ($this->filters as $filter => $options) {
            if ($value = $request->{$filter}) {
                $value = $options['condition'] == 'LIKE' ? $value . '%' : $value;
                $builder->where($options['field'], $options['condition'], $value);
            }
        }

        if ($request->q) {
            $builder->where(function($query) use($request){
                $query->where('name', 'LIKE', $request->q . '%')
                    ->orWhere('skills', 'LIKE', $request->q . '%')
                    ->orWhere('qualifications', 'LIKE', $request->q . '%');
            });
        }

        if ($request->location) {
            $builder->where('location', 'LIKE', $request->location . '%');
        }

        return $builder->paginate(25);
    }

    public function show($id)
    {
        $user = User::find($id);
    
        if(! $user){
            flash(t("User not found"))->error();

            return redirect('/search-talent');
        }
        
        $review = auth()->user() ? Review::where("reviewer_id", auth()->user()->id)->where("user_id", $user->id)->first() : false;
        $count = $user->endorsements()->count();
        $comment = $review ? $review->comment : '';
        $jobs=Post::where('user_id',auth()->id())->get();
     //   dd($jobs);
        return view('customs.talents.show', ['comment' => $comment,'jobs'=>$jobs, 'user' => $user, 'endorsementCount' => $count]);
    }
    
    public function connect($id, Request $request)
    {
        
       // dd($request->all());
        $user = User::find($id);
        $jobs=Post::find($request->job_id);

        if(! $user){
            flash(t("User not found"))->error();

            return redirect('/search-talent');
        }
        
        
		// New Message
		$message = new Message();
		$input = $request->only($message->getFillable());
		foreach ($input as $key => $value) {
			$message->{$key} = $value;
		}
		
		$message->from_user_id = auth()->check() ? auth()->user()->id : 0;
		$message->from_name = auth()->check() ? auth()->user()->name : NULL;
		$message->from_email = auth()->check() ? auth()->user()->email : NULL;
		$message->from_phone = auth()->check() ? auth()->user()->phone : NULL;
		$message->to_user_id = $user->id;
		$message->to_name = $user->name;
		$message->to_email = $user->email;
		$message->to_phone = $user->phone;
		$message->subject = "New Connexion request";
		$message->message = auth()->user()->username . " Wants to connect with You";
		if(!empty($jobs)):
		$message->post_id=$jobs->id;
		$message->job_title=$jobs->title;
		endif;
		//$message->message = $request->input('message');
		
		// Save
		$message->save();
		
		$msg = "Connexion request sent successfully to " .$user->name;
			flash($msg)->success();
        

        return redirect()->back();
    }
}
