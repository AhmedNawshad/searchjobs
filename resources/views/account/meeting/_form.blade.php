<?php
// From Company's Form
$classLeftCol = 'col-md-3';
$classRightCol = 'col-md-9';

if (isset($originForm)) {
    // From User's Form
    if ($originForm == 'user') {
        $classLeftCol = 'col-md-3';
        $classRightCol = 'col-md-7';
    }

    // From Post's Form
    if ($originForm == 'post') {
        $classLeftCol = 'col-md-3';
        $classRightCol = 'col-md-8';
    }
}
?>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<div id="companyFields">
    <!-- subject -->
    <?php $subjectError = (isset($errors) and $errors->has('subject')) ? ' is-invalid' : ''; ?>
    <div class="form-group row required">
        <label class="{{ $classLeftCol }} control-label" for="subject">Meeting subject <sup>*</sup></label>
        <div class="{{ $classRightCol }}">
            <input name="subject"
                   placeholder="Subject here..."
                   class="form-control input-md {{ $subjectError }}"
                   type="text"
                   value="{{ old('subject') }}"/>
        </div>
    </div>


    <!-- company -->
    <?php $postError = (isset($errors) and $errors->has('post_id')) ? ' is-invalid' : ''; ?>
    <div class="form-group row required">
        <label class="{{ $classLeftCol }} control-label{{ $postError }}" for="post_id">Post</label>
        <div class="{{ $classRightCol }}">
            <select id="post_id" name="post_id" class="form-control sselecter{{ $postError }}">                
                @foreach ($posts as $post)
                <option value="{{ $post->id }}">
                    {{ $post->title }}
                </option>
                @endforeach
            </select>
        </div>
    </div>


    <!-- country_code -->
    <?php $candidateError = (isset($errors) and $errors->has('candidate_id')) ? ' is-invalid' : ''; ?>
    <div class="form-group row required">
        <label class="{{ $classLeftCol }} control-label{{ $candidateError }}" for="company.country_code">Candidate <sup>*</sup></label>
        <div class="{{ $classRightCol }}">
            <select id="countryCode" name="candidate_id" class="form-control sselecter{{ $candidateError }}">                
                @foreach ($candidates as $candidate)
                <option value="{{ $candidate->id }}">
                    {{ $candidate->name }}
                </option>
                @endforeach
            </select>
        </div>
    </div>

    <!-- time -->
    <?php $dateError = (isset($errors) and $errors->has('date')) ? ' is-invalid' : ''; ?>
    <div class="form-group row required">
        <label class="{{ $classLeftCol }} control-label" for="date">Date Time <sup>*</sup></label>
        <div class="{{ $classRightCol }}">
            <div class="row form-group">
                <div class="col-md-4">
                    Date: <input type="text" id="datepicker" name="date" class="form-control"/>
                </div>
                <div class="col-md-4">
                    From: <input type="time" id="m_from" name="m_from" class="form-control"/>
                </div>
                <div class="col-md-4">
                    To: <input type="time" id="m_to" name="m_to" class="form-control"/>
                </div>        
            </div>                
        </div>
    </div>

    <!-- location -->
    <?php $locationError = (isset($errors) and $errors->has('m_location')) ? ' is-invalid' : ''; ?>
    <div class="form-group row required">
        <label class="{{ $classLeftCol }} control-label" for="date"> location </label>
        <div class="{{ $classRightCol }}">
            <input name="m_location"
                   id="datepicker"
                   placeholder="meeting location"
                   class="form-control input-md{{ $dateError }}"
                   type="text" >                 
        </div>
    </div>

    <!-- description -->
    <?php $messageError = (isset($errors) and $errors->has('message')) ? ' is-invalid' : ''; ?>
    <div class="form-group row required">
        <label class="{{ $classLeftCol }} control-label" for="message">{{ t('message') }} </label>
        <div class="{{ $classRightCol }}">
            <textarea class="form-control {{ $messageError }}" name="message" rows="10">{{ old('message') }}</textarea>
            <small id="" class="form-text text-muted">
                A custom message for the candidate
            </small>
        </div>
    </div>


</div>

@section('after_styles')
@parent
<style>
    #companyFields .select2-container {
        width: 100% !important;
    }
    .file-loading:before {
        content: " {{ t('Loading') }}...";
    }
    .krajee-default.file-preview-frame .kv-file-content {
        height: auto;
    }
    .krajee-default.file-preview-frame .file-thumbnail-footer {
        height: 30px;
    }
</style>
@endsection

@section('after_scripts')
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function () {
    $("#datepicker").datepicker();
});
</script>
@endsection