{{--
//
--}}
@extends('layouts.master')

@section('content')
@include('common.spacer')
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<div class="main-container">
    <div class="container">
        <div class="row">

            @if (Session::has('flash_notification'))
            <div class="col-xl-12">
                <div class="row">
                    <div class="col-xl-12">
                        @include('flash::message')
                    </div>
                </div>
            </div>
            @endif

            <div class="col-md-3 page-sidebar">
                @include('account.inc.sidebar')
            </div>
            <!--/.page-sidebar-->

            <div class="col-md-9 page-content">
                <div class="inner-box">
                    <h2 class="title-2">
                        <i class="icon-users"></i> {{ 'Meetings' }}
                    </h2>
                    <div class="mb-2">
                        <a href="{{ lurl('account/meetings/new') }}" class="btn btn-primary float-right">New Metting</a>
                    </div>

                    <div style="clear:both"></div>

                    <form name="listForm" method="POST" action="{{ lurl('account/meetings/shedule') }}">
                        {!! csrf_field() !!}

                        @if(auth()->user()->user_type_id == 1)
                        <div class="row form-group">
                            <div class="col-md-3">
                                Date: <input type="text" id="datepicker" name="date" class="form-control"/>
                            </div>
                            <div class="col-md-2">
                                From: <input type="time" id="m_from" name="m_from" class="form-control"/>
                            </div>
                            <div class="col-md-2">
                                To: <input type="time" id="m_to" name="m_to" class="form-control"/>
                            </div>
                            <div class="col-md-3">
                                Location: <input type="text" id="m_to" name="m_location" class="form-control"/>
                            </div>
                            <div class="col-md-2">
                                <div class="mt-3">
                                    <button class="btn btn-default" type="submit">Schedule</button>
                                </div>
                            </div>
                        </div>
                        @endif

                        <div class="table-responsive">
                            <div class="table-action">
                                <label for="checkAll">
                                    <input type="checkbox" id="checkAll">
                                    {{ t('Select') }}: {{ t('All') }} |
                                    <button type="submit" class="btn btn-sm btn-default delete-action">
                                        <i class="fa fa-trash"></i> {{ t('Delete') }}
                                    </button>
                                </label>
                                <div class="table-search pull-right col-sm-7">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-sm-5 control-label text-right">{{ t('Search') }} <br>
                                                <a title="clear filter" class="clear-filter" href="#clear">[{{ t('clear') }}]</a>
                                            </label>
                                            <div class="col-sm-7 searchpan">
                                                <input type="text" class="form-control" id="filter">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <table id="addManageTable" class="table table-striped table-bordered add-manage-table table demo" data-filter="#filter" data-filter-text-only="true">
                                <thead>
                                    <tr>
                                        <th style="width:2%" data-type="numeric" data-sort-initial="true"></th>
                                        <th style="width:22%" data-sort-ignore="true">{{ ('Title') }}</th>
                                        <th style="width:22%" data-sort-ignore="true">{{ ('Employer') }}</th>
                                        <th style="width:22%" data-sort-ignore="true">{{ ('Candidate') }}</th>
                                        <th style="width:22%" data-sort-ignore="true">{{ ('Time') }}</th>
                                        <th style="width:22%" data-sort-ignore="true">{{ ('Date') }}</th>
                                        <th style="width:22%" data-sort-ignore="true">{{ ('Location') }}</th>
                                        <th style="width:10%">{{ t('Option') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    if (isset($meetings) && $meetings->count() > 0) :
                                        foreach ($meetings as $key => $meeting) :
                                            ?>
                                            <tr>
                                                <td class="add-img-selector">
                                                    <div class="checkbox">
                                                        <label><input type="checkbox" name="entries[]" value="{{ $meeting->id }}"/></label>
                                                    </div>
                                                </td>

                                                <td>
                                                    {{ $meeting->title }}
                                                </td>
                                                <td>
                                                    {{ $meeting->employer->name }}
                                                </td>
                                                <td>
                                                    {{ $meeting->candidate->name }}
                                                </td>
                                                <td>
                                                    {{ $meeting->m_from }} - {{ $meeting->m_to }}
                                                </td>
                                                <td>
                                                    {{$meeting->m_date  }} 
                                                </td>
                                                <td>
                                                    {{$meeting->m_location  }} 
                                                </td>
                                                <td class="action-td">
                                                    <div>
                                                        <p>
                                                            <a class="btn btn-default btn-sm" onclick="document.location = 'https://searchjobs.global/search-talent/seeker/2'">

                                                                <i class="icon-eye"></i> {{ t('View') }}
                                                            </a>
                                                        </p>
                                                        <p>
                                                            <a class="btn btn-danger btn-sm delete-action" href="{{ lurl('account/conversations/' . $meeting->id . '/delete') }}">

                                                                <i class="fa fa-trash"></i> {{ t('Delete') }}
                                                            </a>
                                                        </p>
                                                    </div>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </form>



                    <nav class="" aria-label="">

                    </nav>

                    <div style="clear:both"></div>

                </div>
            </div>
            <!--/.page-content-->

        </div>
        <!--/.row-->
    </div>
    <!--/.container-->
</div>
<!-- /.main-container -->

@endsection

@section('after_scripts')
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
                                                                $(function () {
                                                                    $("#datepicker").datepicker();
                                                                });
</script>
<script src="{{ url('assets/js/footable.js?v=2-0-1') }}" type="text/javascript"></script>
<script src="{{ url('assets/js/footable.filter.js?v=2-0-1') }}" type="text/javascript"></script>
<script type="text/javascript">
                                                                $(function () {
                                                                    $('#addManageTable').footable().bind('footable_filtering', function (e) {
                                                                        var selected = $('.filter-status').find(':selected').text();
                                                                        if (selected && selected.length > 0) {
                                                                            e.filter += (e.filter && e.filter.length > 0) ? ' ' + selected : selected;
                                                                            e.clear = !e.filter;
                                                                        }
                                                                    });

                                                                    $('.clear-filter').click(function (e) {
                                                                        e.preventDefault();
                                                                        $('.filter-status').val('');
                                                                        $('table.demo').trigger('footable_clear_filter');
                                                                    });

                                                                    $('#checkAll').click(function () {
                                                                        checkAll(this);
                                                                    });

                                                                    $('a.delete-action, button.delete-action').click(function (e) {
                                                                        e.preventDefault(); /* prevents the submit or reload */
                                                                        var confirmation = confirm("{{ t('confirm_this_action') }}");

                                                                        if (confirmation) {
                                                                            if ($(this).is('a')) {
                                                                                var url = $(this).attr('href');
                                                                                if (url !== 'undefined') {
                                                                                    redirect(url);
                                                                                }
                                                                            } else {
                                                                                $('form[name=listForm]').submit();
                                                                            }
                                                                        }

                                                                        return false;
                                                                    });
                                                                });

</script>
<!-- include custom script for ads table [select all checkbox]  -->
<script>
    function checkAll(bx) {
        var chkinput = document.getElementsByTagName('input');
        for (var i = 0; i < chkinput.length; i++) {
            if (chkinput[i].type == 'checkbox') {
                chkinput[i].checked = bx.checked;
            }
        }
    }

</script>
@endsection
