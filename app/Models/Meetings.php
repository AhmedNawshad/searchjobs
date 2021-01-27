<?php

namespace App\Models;

use App\Helpers\Number;
use App\Models\Scopes\ActiveScope;
use App\Models\Scopes\LocalizedScope;
use App\Models\Traits\CountryTrait;
use App\Observer\CityObserver;
use Larapen\Admin\app\Models\Crud;

class Meetings extends BaseModel {

    protected $fillable = [
        'my_id',
        'title',
        'candidate_id',
        'm_date',
        'm_from',
        'm_to',
        'm_location',
        'post_id',
        'message',
    ];

    public function candidate() {
        return $this->belongsTo(User::class, 'candidate_id');
    }

    public function employer() {
        return $this->belongsTo(User::class, 'my_id');
    }

}
