<?php
	
	
	namespace App\Models;
	
	
	use Larapen\Admin\app\Models\Crud;
	
	class SaveCandidate extends BaseModel
	{
		use Crud;
		
	    /**
	     * The table associated with the model.
	     *
	     * @var string
	     */
	    protected $table = 'saved_candidates';
	    
	    /**
	     * The primary key for the model.
	     *
	     * @var string
	     */
	    // protected $primaryKey = 'id';
	    
	    /**
	     * Indicates if the model should be timestamped.
	     *
	     * @var boolean
	     */
	    // public $timestamps = false;
	    
	    /**
	     * The attributes that aren't mass assignable.
	     *
	     * @var array
	     */
	    protected $guarded = ['id'];
	    
	    /**
	     * The attributes that are mass assignable.
	     *
	     * @var array
	     */
	    protected $fillable = ['user_id', 'candidate_id'];
	    
	    /**
	     * The attributes that should be hidden for arrays
	     *
	     * @var array
	     */
	    // protected $hidden = [];
	    
	    /**
	     * The attributes that should be mutated to dates.
	     *
	     * @var array
	     */
	    // protected $dates = [];
	    
	    /*
	    |--------------------------------------------------------------------------
	    | FUNCTIONS
	    |--------------------------------------------------------------------------
	    */
		protected static function boot()
		{
			parent::boot();
		}
	    
	    /*
	    |--------------------------------------------------------------------------
	    | RELATIONS
	    |--------------------------------------------------------------------------
	    */
	    public function candidates()
	    {
	        return $this->belongsTo(Post::class, 'candidate_id');
	    }
	    
	    public function user()
	    {
	        return $this->belongsTo(User::class, 'user_id');
	    }
	    
	    /*
	    |--------------------------------------------------------------------------
	    | SCOPES
	    |--------------------------------------------------------------------------
	    */
	    
	    /*
	    |--------------------------------------------------------------------------
	    | ACCESSORS
	    |--------------------------------------------------------------------------
	    */
	    
	    /*
	    |--------------------------------------------------------------------------
	    | MUTATORS
	    |--------------------------------------------------------------------------
	    */
	}
