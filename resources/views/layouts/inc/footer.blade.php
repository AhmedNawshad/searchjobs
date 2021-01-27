<?php
if (
	config('settings.other.ios_app_url') ||
	config('settings.other.android_app_url') ||
	config('settings.social_link.facebook_page_url') ||
	config('settings.social_link.twitter_url') ||
	config('settings.social_link.google_plus_url') ||
	config('settings.social_link.linkedin_url') ||
	config('settings.social_link.pinterest_url') ||
	config('settings.social_link.instagram_url')
) {
	$colClass1 = 'col-lg-2 col-md-2 col-sm-2 col-xs-12';
	$colClass2 = 'col-lg-4 col-md-4 col-sm-4 col-xs-12';
	$colClass3 = 'col-lg-2 col-md-2 col-sm-2 col-xs-12';
	$colClass4 = 'col-lg-3 col-md-3 col-sm-3 col-xs-6';
} else {
	$colClass1 = 'col-lg-4 col-md-4 col-sm-3 col-xs-12';
	$colClass2 = 'col-lg-4 col-md-4 col-sm-5 col-xs-12';
	$colClass3 = 'col-lg-4 col-md-4 col-sm-4 col-xs-12';
	$colClass4 = 'col-lg-4 col-md-4 col-sm-4 col-xs-6';
}
?>
<footer class="main-footer" >
	<div class="footer-content"">
		<div class="container">
			<div class="row">
				
				@if (!config('settings.footer.hide_links'))
					<div class="{{ $colClass1 }}">
						<div class="footer-col">
							<h4 style="color:white !important;" class="footer-title">{{ t('About us') }}</h4>
							<ul class="list-unstyled footer-nav">
								@if (isset($pages) and $pages->count() > 0)
									@foreach($pages as $page)
										<li>
											<?php
												$linkTarget = '';
												if ($page->target_blank == 1) {
													$linkTarget = 'target="_blank"';
												}
											?>
											@if (!empty($page->external_link))
												<a style="color:white !important;"  href="{!! $page->external_link !!}" rel="nofollow" {!! $linkTarget !!}> {{ $page->name }} </a>
											@else
												<a style="color:white !important;" href="{{ \App\Helpers\UrlGen::page($page) }}" {!! $linkTarget !!}> {{ $page->name }} </a>
											@endif
										</li>
									@endforeach
								@endif
							</ul>
						</div>
					</div>
					
					<div class="{{ $colClass2 }}">
						<div class="footer-col">
							<h4 style="color:white !important;" class="footer-title">{{ ('About Search Jobs') }}</h4>
							<ul class="list-unstyled footer-nav">
							<p style="text-align:start; color:white; font-size:12px">We are one of Sri Lanka’s leading online employment marketplaces.Helping facilitate the matching and communication of job opportunities between candidates and employers in Sri Lanka and around the world.</p>
							</ul>
						</div>
					</div>
					
					<div class="{{ $colClass3 }}">
						<div class="footer-col">
							<h4 style="color:white !important;" class="footer-title">{{ ('For Account') }}</h4>
							<ul class="list-unstyled footer-nav">
								@if (!auth()->user())
									<li>
										@if (config('settings.security.login_open_in_modal'))
											<a style="color:white !important;" href="#quickLogin" data-toggle="modal"> {{ t('Log In') }} </a>
										@else
											<a style="color:white !important;" href="{{ lurl(trans('routes.login')) }}"> {{ t('Log In') }} </a>
										@endif
									</li>
									<li><a style="color:white !important;" href="{{ lurl(trans('routes.register')) }}"> {{ t('Register') }} </a></li>
								@else
									<li><a style="color:white !important;" href="{{ lurl('account') }}"> {{ t('Personal Home') }} </a></li>
									@if (isset(auth()->user()->user_type_id))
										@if (in_array(auth()->user()->user_type_id, [1]))
											<li><a style="color:white !important;" href="{{ lurl('account/my-posts') }}"> {{ ('My Jobs') }} </a></li>
											<li><a style="color:white !important;" href="{{ lurl('account/companies') }}"> {{ ('My Companies') }} </a></li>
											<li><a style="color:white !important;" href="{{ lurl(trans('routes.contact')) }}"> {{ t('Contact') }} </a></li>
										@endif
										@if (in_array(auth()->user()->user_type_id, [2]))
											<li><a style="color:white !important;" href="{{ lurl('account/resumes') }}"> {{ ('Upload resumes') }} </a></li>
											<li><a style="color:white !important;" href="{{ lurl('account/favourite') }}"> {{ ('Search jobs') }} </a></li>
											<li><a style="color:white !important;" href="{{ lurl(trans('routes.contact')) }}"> {{ t('Contact') }} </a></li>
										@endif
									@endif
								@endif
							</ul>
						</div>
					</div>
					
					@if (
						config('settings.other.ios_app_url') or
						config('settings.other.android_app_url') or
						config('settings.social_link.facebook_page_url') or
						config('settings.social_link.twitter_url') or
						config('settings.social_link.google_plus_url') or
						config('settings.social_link.linkedin_url') or
						config('settings.social_link.pinterest_url') or
						config('settings.social_link.instagram_url')
						)
						<div class="{{ $colClass4 }}">
							<div class="footer-col row">
								<?php
									$footerSocialClass = '';
									$footerSocialTitleClass = '';
								?>
								{{-- @todo: API Plugin --}}
								@if (config('settings.other.ios_app_url') or config('settings.other.android_app_url'))
									<div class="col-sm-12 col-xs-6 col-xxs-12 no-padding-lg">
										<div class="mobile-app-content">
											<h4 style="color:white !important;" class="footer-title">{{ t('Mobile Apps') }}</h4>
											<div class="row ">
												@if (config('settings.other.ios_app_url'))
													<div class="col-xs-12 col-sm-6">
														<a class="app-icon" target="_blank" href="{{ config('settings.other.ios_app_url') }}">
															<span class="hide-visually">{{ t('iOS app') }}</span>
															<img src="{{ url('images/site/app-store-badge.svg') }}" alt="{{ t('Available on the App Store') }}">
														</a>
													</div>
												@endif
												@if (config('settings.other.android_app_url'))
													<div class="col-xs-12 col-sm-6">
														<a class="app-icon" target="_blank" href="{{ config('settings.other.android_app_url') }}">
															<span class="hide-visually">{{ t('Android App') }}</span>
															<img src="{{ url('images/site/google-play-badge.svg') }}" alt="{{ t('Available on Google Play') }}">
														</a>
													</div>
												@endif
											</div>
										</div>
									</div>
									<?php
										$footerSocialClass = 'hero-subscribe';
										$footerSocialTitleClass = 'no-margin';
									?>
								@endif
								
								@if (
									config('settings.social_link.facebook_page_url') or
									config('settings.social_link.twitter_url') or
									config('settings.social_link.google_plus_url') or
									config('settings.social_link.linkedin_url') or
									config('settings.social_link.pinterest_url') or
									config('settings.social_link.instagram_url')
									)
									<div class="col-sm-12 col-xs-6 col-xxs-12 no-padding-lg">
										<div class="{!! $footerSocialClass !!}">
											<h4 style="color:white !important; text-align: left;" class="footer-title {!! $footerSocialTitleClass !!}">{{ t('Follow us on') }}</h4>
											<ul class="list-unstyled list-inline footer-nav social-list-footer social-list-color footer-nav-inline">
												@if (config('settings.social_link.facebook_page_url'))
													<li>
														<a class="icon-color fb" title="" data-placement="top" data-toggle="tooltip" href="{{ config('settings.social_link.facebook_page_url') }}" data-original-title="Facebook">
															<i class="fab fa-facebook"></i>
														</a>
													</li>
												@endif
												@if (config('settings.social_link.twitter_url'))
													<li>
														<a class="icon-color tw" title="" data-placement="top" data-toggle="tooltip" href="{{ config('settings.social_link.twitter_url') }}" data-original-title="Twitter">
															<i class="fab fa-twitter"></i>
														</a>
													</li>
												@endif
												@if (config('settings.social_link.instagram_url'))
													<li>
														<a class="icon-color pin" title="" data-placement="top" data-toggle="tooltip" href="{{ config('settings.social_link.instagram_url') }}" data-original-title="Instagram">
															<i class="icon-instagram-filled"></i>
														</a>
													</li>
												@endif
												@if (config('settings.social_link.google_plus_url'))
													<li>
														<a class="icon-color gp" title="" data-placement="top" data-toggle="tooltip" href="{{ config('settings.social_link.google_plus_url') }}" data-original-title="Google+">
															<i class="fab fa-google-plus"></i>
														</a>
													</li>
												@endif
												@if (config('settings.social_link.linkedin_url'))
													<li>
														<a class="icon-color lin" title="" data-placement="top" data-toggle="tooltip" href="{{ config('settings.social_link.linkedin_url') }}" data-original-title="Linkedin">
															<i class="fab fa-linkedin"></i>
														</a>
													</li>
												@endif
												@if (config('settings.social_link.pinterest_url'))
													<li>
														<a class="icon-color pin" title="" data-placement="top" data-toggle="tooltip" href="{{ config('settings.social_link.pinterest_url') }}" data-original-title="Pinterest">
															<i class="fab fa-pinterest-p"></i>
														</a>
													</li>
												@endif
											</ul>
										</div>
									</div>
								@endif
							</div>
						</div>
					@endif
					
					<div style="clear: both"></div>
				@endif
				
				<div class="col-xl-12">
					@if (!config('settings.footer.hide_payment_plugins_logos') and isset($paymentMethods) and $paymentMethods->count() > 0)
						<div class="text-center paymanet-method-logo">
							{{-- Payment Plugins --}}
							@foreach($paymentMethods as $paymentMethod)
								@if (file_exists(plugin_path($paymentMethod->name, 'public/images/payment.png')))
									<img src="{{ url('images/' . $paymentMethod->name . '/payment.png') }}" alt="{{ $paymentMethod->display_name }}" title="{{ $paymentMethod->display_name }}">
								@endif
							@endforeach
						</div>
					@else
						@if (!config('settings.footer.hide_links'))
							<hr>
						@endif
					@endif
					
					<div style="color:white !important;text-align: center; font-size: small;" class="copy-info text-center" >
						©️ Searchjobs.global all rights reserved. Designed and Developed by Adage Digital.
					</div>
				</div>
			
			</div>
		</div>
	</div>
</footer>
