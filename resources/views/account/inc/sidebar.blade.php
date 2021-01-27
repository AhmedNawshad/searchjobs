<aside>
    <div class="inner-box">
        <div class="user-panel-sidebar">

            @if (isset($user))
            <div class="collapse-box">
                <h5 class="collapse-title no-border">
                    {{ t('My Account') }}&nbsp;
                    <a href="#MyClassified" data-toggle="collapse" class="pull-right"><i
                            class="fa fa-angle-down"></i></a>
                </h5>
                <div class="panel-collapse collapse show" id="MyClassified">
                    <ul class="acc-list">
                        <li>
                            <a {!! ($pagePath=='' ) ? 'class="active"' : '' !!} href="{{ lurl('account') }}">
                                <i class="icon-home"></i> {{ t('Personal Home') }}
                            </a>
                        </li>
                    </ul>
                </div>
                @include('account.inc.profile_meter')
            </div>
            <!-- /.collapse-box  -->
          <!--{{var_dump('resumes')}}-->
            @if (!empty($user->user_type_id) and $user->user_type_id != 0)
            <div class="collapse-box">
                <h5 class="collapse-title">
                    {{ t('My Ads') }}&nbsp;
                    <a href="#MyAds" data-toggle="collapse" class="pull-right"><i class="fa fa-angle-down"></i></a>
                </h5>
                <div class="panel-collapse collapse show" id="MyAds">
                    <ul class="acc-list">
                        <!-- COMPANY -->
                        @if (in_array($user->user_type_id, [1]))
                        <li>
                            <a{!! ($pagePath=='companies' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/companies') }}">
                                <i class="icon-town-hall"></i> {{ t('My companies') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countCompanies) ? \App\Helpers\Number::short($countCompanies) : 0 }}
                                </span>
                                </a>
                        </li>
                        <li>
                            <a{!! ($pagePath=='my-posts' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/my-posts') }}">
                                <i class="icon-docs"></i> {{ ('Manage jobs') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countMyPosts) ? \App\Helpers\Number::short($countMyPosts) : 0 }}
                                </span>
                                </a>
                        </li>
                         <li>
                            <a{!! ($pagePath=='pending' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/pending') }}">
                                  <i class="icon-hourglass"></i> {{ ('Pending Approval') }}&nbsp;
                                <span class="badge badge-pill badge-important">
                                    {{ isset($countPendingPosts) ? \App\Helpers\Number::short($countPendingPosts) : 0 }}
                                </span>
                                </a>
                                </a>
                        </li>
                        <li>
                            <a{!! ($pagePath=='connected' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/connected') }}">
                                <i class="icon-mail-1"></i> {{ ('Connected applicants') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countConnexions) ? \App\Helpers\Number::short($countConnexions) : 0 }}
                                </span>
                                </a>
                        </li>
                                                
               
                         <li>
                            <a{!! ($pagePath=='transactions' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/meetings') }}">
                                <i class="icon-bell"></i>Interview&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($meetingsCount) ? \App\Helpers\Number::short($meetingsCount) : 0 }}
                                </span>
                                </a>
                        </li>
                                                                        <li>
                            <a{!! ($pagePath=='applicants' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/hired') }}">
                                <i class="icon-users"></i> {{ ('Hired') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countTransactions) ? \App\Helpers\Number::short($countTransactions) : 0 }}
                                </span>
                                </a>
                        </li>
                       
                        <li>
                            <a{!! ($pagePath=='conversations' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/conversations') }}">
                                <i class="icon-mail-1"></i> {{ t('Messages') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countConversations) ? \App\Helpers\Number::short($countConversations) : 0 }}
                                </span>&nbsp;
                                <span
                                    class="badge badge-pill badge-important count-conversations-with-new-messages">0</span>
                                </a>
                        </li>
                        <li>
                            <a{!! ($pagePath=='transactions' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/transactions') }}">
                                <i class="icon-money"></i> {{ t('Transactions') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countTransactions) ? \App\Helpers\Number::short($countTransactions) : 0 }}
                                </span>
                                </a>
                        </li>


                        <!-- CUSTOM ###$ -->                       </li>
                                                <li>
                            <a{!! ($pagePath=='applicants' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/applicants') }}">
                                <i class="icon-users"></i> {{ ('Saved Candidates') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countTransactions) ? \App\Helpers\Number::short($countTransactions) : 0 }}
                                </span>
                                </a>
                        </li>
                        
                                              
                        <li>
                            <a{!! ($pagePath=='reviews' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/reviews') }}">
                                <i class="icon-star"></i> {{ ('Reviews') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countTransactions) ? \App\Helpers\Number::short($countTransactions) : 0 }}
                                </span>
                                </a>
                        </li>


                        <li>
                            <a{!! ($pagePath=='followers' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/company-followers') }}">
                                <i class="icon-thumbs-up"></i> {{ ('Followers') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($companyFollowersCount) ? \App\Helpers\Number::short($companyFollowersCount) : 0 }}
                                </span>
                                </a>
                        </li>
                        
                         <li>
                            <a{!! ($pagePath=='applicants' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/package') }}">
                                <i class="icon-hourglass"></i> {{ ('Package') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countPendingPosts) ? \App\Helpers\Number::short($countTransactions) : 0 }}
                                </span>
                                </a>
                        </li>
                        
                       
                        <li>
                            <a{!! ($pagePath=='pending-approval' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/pending-approval') }}">
                                  <i class="icon-hourglass"></i> {{ ('Change password') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countPendingPosts) ? \App\Helpers\Number::short($countPendingPosts) : 0 }}
                                </span>
                                </a>
                        </li>

                        <!-- EOF CUSTOM ### -->
                        @endif
                        <!-- CANDIDATE -->
                        @if (in_array($user->user_type_id, [2]))
                        <li>
                            <a{!! ($pagePath=='resumes' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/resumes') }}">
                                <i class="icon-attach"></i> {{ t('My resumes') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countResumes) ? \App\Helpers\Number::short($countResumes) : 0 }}
                                </span>
                                </a>
                        </li>
                        <li>
                            <a{!! ($pagePath=='resumes' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/resumes') }}">
                                <i class="icon-attach"></i> {{ ('Cover letter') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countResumes) ? \App\Helpers\Number::short($countResumes) : 0 }}
                                </span>
                                </a>
                        </li>
                        <li>
                            <a{!! ($pagePath=='my-posts' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/my-posts') }}">
                                <i class="icon-docs"></i> {{ ('Applied jobs') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countMyPosts) ? \App\Helpers\Number::short($countMyPosts) : 0 }}
                                </span>
                                </a>
                        </li>
                         <li>
                            <a{!! ($pagePath=='pending-approval' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/applicants') }}">
                                  <i class="icon-hourglass"></i> {{ ('Pending aprproval') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countPendingApplicants) ? \App\Helpers\Number::short($countPendingApplicants) : 0 }}
                                </span>
                                </a>
                        </li>
                        <li>
                            <a{!! ($pagePath=='connected-companies' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/connected-companies') }}">
                                  <i class="icon-mail-1"></i> {{ ('Connected Companies') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countConnectedApplicants) ? \App\Helpers\Number::short($countConnectedApplicants) : 0 }}
                                </span>
                                </a>
                        </li>
                         <li>
                            <a{!! ($pagePath=='transactions' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/meetings') }}">
                                <i class="icon-bell"></i>Interview&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($meetingsCount) ? \App\Helpers\Number::short($meetingsCount) : 0 }}
                                </span>
                                </a>
                        </li>
                        <li>
                            <a{!! ($pagePath=='favourite' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/favourite') }}">
                                <i class="icon-heart"></i> {{ t('Favourite jobs') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countFavouritePosts) ? \App\Helpers\Number::short($countFavouritePosts) : 0 }}
                                </span>
                                </a>
                        </li>
                        <li>
                            <a{!! ($pagePath=='reviews' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/reviews') }}">
                                <i class="icon-star"></i> {{ ('Reviews') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($reviewsCount) ? \App\Helpers\Number::short($reviewsCount) : 0 }}
                                </span>
                                </a>
                        </li>


                        <li>
                            <a{!! ($pagePath=='followers' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/followers') }}">
                                <i class="icon-thumbs-up"></i> {{ ('Following') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($followingCompaniesCount) ? \App\Helpers\Number::short($followingCompaniesCount) : 0 }}
                                </span>
                                </a>
                        </li>
                        
                        <li>
                            <a{!! ($pagePath=='jobAlerts' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/alerts') }}">
                                <i class="icon-bell-1"></i> {{ ('Job Alerts') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($alertsCount) ? \App\Helpers\Number::short($alertsCount) : 0 }}
                                </span>
                                </a>
                        </li>
                       
                        <li>
                            <a{!! ($pagePath=='conversations' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/conversations') }}">
                                <i class="icon-mail-1"></i> {{ t('Conversations') }}&nbsp;
                                <span class="badge badge-pill">
                                    {{ isset($countConversations) ? \App\Helpers\Number::short($countConversations) : 0 }}
                                </span>&nbsp;
                                <span class="badge badge-important count-conversations-with-new-messages">0</span>
                                </a>
                        </li>
                        @endif
                        @if (config('plugins.apijc.installed'))
                        <li>
                            <a{!! ($pagePath=='api-dashboard' ) ? ' class="active"' : '' !!}
                                href="{{ lurl('account/api-dashboard') }}">
                                <i class="icon-cog"></i> {{ trans('api::messages.Clients & Applications') }}&nbsp;
                                </a>
                        </li>
                        @endif
                    </ul>
                </div>
            </div>
            <!-- /.collapse-box  -->

            <div class="collapse-box">
                <h5 class="collapse-title">
                    {{ t('Terminate Account') }}&nbsp;
                    <a href="#TerminateAccount" data-toggle="collapse" class="pull-right"><i
                            class="fa fa-angle-down"></i></a>
                </h5>
                <div class="panel-collapse collapse show" id="TerminateAccount">
                    <ul class="acc-list">
                        <li>
                            <a {!! ($pagePath=='close' ) ? 'class="active"' : '' !!} href="{{ lurl('account/close') }}">
                                <i class="icon-cancel-circled "></i> {{ t('Close account') }}
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- /.collapse-box  -->
            @endif
            @endif

        </div>
    </div>
    <!-- /.inner-box  -->
</aside>