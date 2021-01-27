<?php

namespace App\Http\Controllers\Account;

use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Request;

class ReviewController extends AccountBaseController {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        //
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
    public function store(Request $request, $id) {
        $user = User::findOrFail($id);
        $comment = $request->comment;
        $review = Review::where("user_id", $user->id)->where("reviewer_id", auth()->user()->id)->first();
        if ($review) {
            $review->comment = $comment;
            $review->save();
        } else {
            Review::create([
                "user_id" => $user->id,
                "reviewer_id" => auth()->user()->id,
                "comment" => $comment,
            ]);
        }
        flash(t("Your review have been successfully updated. Thank you!"))->success();
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
