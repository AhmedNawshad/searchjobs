<?php

/**
//
 */

namespace App\Http\Controllers\Account;

use App\Http\Controllers\FrontController;
use App\Models\Company;
use App\Models\Post;
use App\Models\Message;
use App\Models\Payment;
use App\Models\Resume;
use App\Models\SavedPost;
use App\Models\Meetings;
use App\Models\SavedSearch;
use App\Models\Scopes\VerifiedScope;
use App\Models\Scopes\ReviewedScope;
use App\Helpers\Localization\Helpers\Country as CountryLocalizationHelper;
use App\Helpers\Localization\Country as CountryLocalization;

abstract class AccountBaseController extends FrontController {

    public $countries;
    public $myPosts;
    public $archivedPosts;
    public $favouritePosts;
    public $pendingPosts;
    public $conversations;
    public $transactions;
    public $companies;
    public $resumes;
    public $connexions;
    public $followingCompanies;
    public $companyFollowers;
    public $reviews;
    public $alerts;
    public $meetings;

    /**
     * AccountBaseController constructor.
     */
    public function __construct() {
        parent::__construct();

        $this->middleware(function ($request, $next) {
            $this->leftMenuInfo();
            return $next($request);
        });

        view()->share('pagePath', '');
    }

    public function leftMenuInfo() {
        // Get & Share Countries
        $this->countries = CountryLocalizationHelper::transAll(CountryLocalization::getCountries());
        view()->share('countries', $this->countries);

        // Share User Info
        view()->share('user', auth()->user());

        // My Posts
        $this->myPosts = Post::currentCountry()
                ->where('user_id', auth()->user()->id)
                ->verified()
                ->unarchived()
                ->reviewed()
                ->with(['city', 'latestPayment' => function ($builder) {
                        $builder->with(['package']);
                    }])
                ->orderByDesc('id');
        view()->share('countMyPosts', $this->myPosts->count());

        // Archived Posts
        $this->archivedPosts = Post::currentCountry()
                ->where('user_id', auth()->user()->id)
                ->archived()
                ->with(['city', 'latestPayment' => function ($builder) {
                        $builder->with(['package']);
                    }])
                ->orderByDesc('id');
        view()->share('countArchivedPosts', $this->archivedPosts->count());

        // Favourite Posts
        $this->favouritePosts = SavedPost::whereHas('post', function($query) {
                    $query->currentCountry();
                })
                ->where('user_id', auth()->user()->id)
                ->with(['post.city'])
                ->orderByDesc('id');
        view()->share('countFavouritePosts', $this->favouritePosts->count());

        // Pending Approval Posts

        $this->pendingPosts = Message::with('latestReply')
                ->whereHas('post', function($query) {
                    $query->currentCountry();
                })
                ->byUserId(auth()->user()->id)
                ->where('parent_id', 0)
                ->where('is_approved', 0)
                ->orderByDesc('id');

        /*
          $this->pendingPosts = Post::withoutGlobalScopes([VerifiedScope::class, ReviewedScope::class])
          ->currentCountry()
          ->where('user_id', auth()->user()->id)
          ->unverified()
          ->with(['city', 'latestPayment' => function ($builder) { $builder->with(['package']); }])
          ->orderByDesc('id');
         */
        view()->share('countPendingPosts', $this->pendingPosts->count());

        // Save Search
        $savedSearch = SavedSearch::currentCountry()
                ->where('user_id', auth()->user()->id)
                ->orderByDesc('id');
        view()->share('countSavedSearch', $savedSearch->count());

        // Conversations
        $this->conversations = Message::with('latestReply')
                /*
                  ->whereHas('post', function($query) {
                  $query->currentCountry();
                  })
                 */
                ->byUserId(auth()->user()->id)
                ->where('parent_id', 0)
                ->orderByDesc('id');
        view()->share('countConversations', $this->conversations->count());


        // connexions
        $this->connexions = Message::with('latestReply')
                ->whereHas('post', function($query) {
                    $query->currentCountry();
                })
                ->byUserId(auth()->user()->id)
                ->where('parent_id', 0)
                ->where('is_approved', 1)
                ->orderByDesc('id');
        view()->share('countConnexions', $this->connexions->count());

        // Payments
        $this->transactions = Payment::whereHas('post', function($query) {
                    $query->currentCountry()->whereHas('user', function($query) {
                        $query->where('user_id', auth()->user()->id);
                    });
                })
                ->with(['post', 'paymentMethod', 'package' => function ($builder) {
                        $builder->with(['currency']);
                    }])
                ->orderByDesc('id');
        view()->share('countTransactions', $this->transactions->count());

        // Companies
        $this->companies = Company::where('user_id', auth()->user()->id)->orderByDesc('id');
        view()->share('countCompanies', $this->companies->count());

        // Resumes
        $this->resumes = Resume::where('user_id', auth()->user()->id)->orderByDesc('id');
        view()->share('countResumes', $this->resumes->count());

        $this->pendingApplicants = Message::with('latestReply')
                ->byUserId(auth()->user()->id)
                ->where('parent_id', 0)
                ->where('is_approved', 0)
                ->where('subject', "LIKE", "New Connexion request")
                ->orderByDesc('id');
        view()->share('countPendingApplicants', $this->pendingApplicants->count());

        $this->connectedApplicants = Message::with('latestReply')
                ->byUserId(auth()->user()->id)
                ->where('parent_id', 0)
                ->where('is_approved', 1)
                ->where('subject', "LIKE", "New Connexion request")
                ->orderByDesc('id');
        view()->share('countConnectedApplicants', $this->connectedApplicants->count());
        
        $this->followingCompanies = auth()->user()->followingCompanies;
        view()->share('followingCompaniesCount', $this->followingCompanies->count());
        
        $this->companyFollowers = auth()->user()->myCompaniesFollowers;
        view()->share('companyFollowersCount', $this->companyFollowers->count());

//        if (auth()->user()->user_type_id == 1) {
//            $this->reviews = auth()->user()->myReviews;
//        } else {
//            $this->reviews = auth()->user()->reviews;
//        }
        $this->reviews = auth()->user()->myReviews;
        view()->share('reviewsCount', $this->reviews->count());
        
        $this->alerts = auth()->user()->jobAlerts();
        view()->share('alertsCount', $this->alerts->count());
        
        $this->meetings = Meetings::where('candidate_id', auth()->user()->id)->orWhere('my_id', auth()->user()->id);
        view()->share('meetingsCount', $this->meetings->count());
    }

}
