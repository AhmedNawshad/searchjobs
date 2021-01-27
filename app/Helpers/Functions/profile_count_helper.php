<?php
	
	/**
	 * add custom functions for calculate point of user profile
	 * uploaded cv and there profile counting with standard counting system
	 *
	 * @add dev krishna sharma
	 */
	if(!function_exists('profile_counter')){
		
		function profile_counter($profile_image=null,$resumes=null){
			   $values=0;
		 if(!empty($profile_image)){
			 $values += config('basic_profile_counter.progress_marking.profile_image_value');
			}  	   
		
//			if(!empty($resumes)){
//				$values += config('basic_profile_counter.progress_marking.resume_complete_value');
//			}
           if($resumes->user_type_id == 2){
              
			if(!empty($resumes->name)){
				$values += config('basic_profile_counter.progress_marking.resume_detail_value.name');
			}
			if(!empty($resumes->email)){
				$values += config('basic_profile_counter.progress_marking.resume_detail_value.email');
			}
			if(!empty($resumes->phone)){
				$values += config('basic_profile_counter.progress_marking.resume_detail_value.phone');
			}
			if(!empty($resumes->age)){
				$values += config('basic_profile_counter.progress_marking.resume_detail_value.age');
			}
			if(!empty($resumes->gender)){
				$values += config('basic_profile_counter.progress_marking.resume_detail_value.gender');
			}
			if(!empty($resumes->location)){
				$values += config('basic_profile_counter.progress_marking.resume_detail_value.location');
			}
			if(!empty($resumes->qualification) || !empty($resumes->extra_experiences)){
				$values += config('basic_profile_counter.progress_marking.resume_detail_value.qualification');
			}
			if(!empty($resumes->experience) || !empty($resumes->extra_educations)){
				$values += config('basic_profile_counter.progress_marking.resume_detail_value.experience');
			}
			if(!empty($resumes->salary)){
				$values += config('basic_profile_counter.progress_marking.resume_detail_value.salary');
			}
			if(!empty($resumes->skills)|| !empty($resumes->extra_skills)){
				$values += config('basic_profile_counter.progress_marking.resume_detail_value.skills');
			}
           }else{
            
               
        	if(!empty($resumes->username)){
			$values += config('basic_profile_counter.progress_marking.employer_marking_profile_value.username');
	    	}   
         	if(!empty($resumes->name)){
			$values += config('basic_profile_counter.progress_marking.employer_marking_profile_value.name');
	    	}
			if(!empty($resumes->email)){
				$values += config('basic_profile_counter.progress_marking.employer_marking_profile_value.email');
			}
			if(!empty($resumes->phone)){
				$values += config('basic_profile_counter.progress_marking.employer_marking_profile_value.phone');
			}
			if(!empty($resumes->gender_id)){
				$values += config('basic_profile_counter.progress_marking.employer_marking_profile_value.gender');
			}
// 		
               
           }
			
			return $values;
		}
		
		
	}
		if(!function_exists('progress_status_color')){
		
		function progress_status_color($value){
			       $default='yellow';
			       if(!empty($value)) {
			       	
				       $colors_status=config('basic_profile_counter.color_statuses');
				       if($value<=30):
				       $color_status=$colors_status[30];
				       elseif ($value >31 || $value<=70):
					       $color_status=$colors_status[70];
				       elseif ($value>71 || $value<=100):
					       $color_status=$colors_status[100];
				       else:
					       $default='yellow';
				       endif;
				       
			       }
	    	$color=	($color_status)?$color_status:$default;
			return $color;
		}
		
		
	}