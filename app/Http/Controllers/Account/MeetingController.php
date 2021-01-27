<?php

namespace App\Http\Controllers\Account;

use App\Models\User;
use App\Helpers\UrlGen;
use App\Models\Message;
use App\Models\Meetings;
use App\Models\Applicants;
use App\Notifications\ReplySent;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\ReplyMessageRequest;
use App\Http\Requests\MeetingRequest;
use Torann\LaravelMetaTags\Facades\MetaTag;
use Illuminate\Http\Request;
use App\Notifications\InterviewNotification;

class MeetingController extends AccountBaseController {

    public function index() {

        $mettings = Meetings::where('candidate_id', auth()->user()->id)->orWhere('my_id', auth()->user()->id)->paginate(10);


        return view('account.meetings', ['meetings' => $mettings]);
    }

    public function create() {

        $candidates = User::verified()->where('user_type_id', 2)->get();
        $posts = auth()->user()->myCompaniesPosts;
        //dd($candidates);
        // Meta Tags
        MetaTag::set('title', t('Create a new meeting'));
        MetaTag::set('description', t('Create a new meeting - :app_name', ['app_name' => config('settings.app.app_name')]));

        return view('account.meeting.create', ['candidates' => $candidates, 'posts' => $posts]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(MeetingRequest $request) {
        //dd($request->all());
        $userId = auth()->user() ? auth()->user()->id : null;
        $data = [
            "my_id" => $userId,
            "title" => $request->subject,
            "candidate_id" => $request->candidate_id,
            "m_date" => new \Date($request->input('date')),
            "m_from" => $request->m_from,
            "m_to" => $request->m_to,
            "m_location" => request()->filled('m_location') ? $request->m_location : null,
            "post_id" => request()->filled('post_id') ? $request->post_id : null,
            "message" => request()->filled('message') ? $request->message : null,
        ];

        $meeting = Meetings::create($data);
        $candidate = User::find($meeting->candidate_id);
        if ($candidate) {
            $candidate->notify(new InterviewNotification($meeting));
        }
        
        flash("Your meeting have been successfully created. Thank you!")->success();
        return redirect('account/meetings');
    }

    public function shedule(Request $request) {
        //dd($request->all());
        if ($request->filled('entries')) {
            foreach ($request->input('entries') as $entry) {
                $meeting = Meetings::findOrFail($entry);
                $meeting->m_date = new \Date($request->input('date'));
                $meeting->m_from = $request->input('m_from');
                $meeting->m_to = $request->input('m_to');
                $meeting->m_location = $request->input('m_location');
                $meeting->save();

                $candidate = User::find($meeting->candidate_id);
                if ($candidate) {
                    $candidate->notify(new InterviewNotification($meeting));
                }
            }
            flash(t("Meetings have been sheduled"))->success();
        }
        return redirect()->back();
    }

}
