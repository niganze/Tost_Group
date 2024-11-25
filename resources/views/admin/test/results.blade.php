@extends('layouts.admin')
@section('page-title','')
@section('breadcrumb')
    @include('admin.partials.crumb',[
    'crumbs'=>[
            route('admin.dashboard')=>__('default.dashboard'),
            route('admin.test.index')=>__lang('tests'),
            '#'=>isset($pageTitle)?$pageTitle:''
        ]])
@endsection
@section('search-form')
    <form class="d-flex align-items-center me-auto" method="get" action="{{ adminUrl(array('controller'=>'test','action'=>'results','id'=>$row->id)) }}">
        <ul class="navbar-nav me-3">
            <li><a href="#" data-bs-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
            <li><a href="#" data-bs-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
        </ul>
        <div class="search-element  d-flex align-items-center me-auto">
            <input value="{{ request()->get('filter') }}"   name="filter" class="form-control" type="search" placeholder="{{ __lang('search') }}" aria-label="{{ __lang('search') }}" data-width="250">
            <button class="btn" type="submit"><i class="fas fa-search"></i></button>
        </div>
    </form>
@endsection
@section('content')
<div>


    <div >
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                    <div class="card-icon bg-success">
                        <i class="far fa-thumbs-up"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>{{ __lang('passed') }}</h4>
                        </div>
                        <div class="card-body">
                            {{ $passed }}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                    <div class="card-icon bg-danger">
                        <i class="far fa-thumbs-down"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>{{ __lang('failed') }}</h4>
                        </div>
                        <div class="card-body">
                            {{ $failed }}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                    <div class="card-icon bg-warning">
                        <i class="far fa-chart-bar"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>{{ __lang('average-score') }}</h4>
                        </div>
                        <div class="card-body">
                            {{ $average }}%
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-12">



            </div>
        </div>


    <div >


        <div class="dropdown d-inline me-2">
            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-download"></i>   {{ __lang('export') }}
            </button>
            <div class="dropdown-menu wide-btn">
                <a class="dropdown-item" href="{{ adminUrl(['controller'=>'test','action'=>'exportresult','id'=>$row->id]) }}?type=pass&start={{ $start }}&end={{ $end }}" ><i class="fa fa-thumbs-up"></i> {{ __lang('export-passed') }}</a>
                <a class="dropdown-item"  href="{{ adminUrl(['controller'=>'test','action'=>'exportresult','id'=>$row->id]) }}?type=fail&start={{ $start }}&end={{ $end }}"><i class="fa fa-thumbs-down"></i> {{ __lang('export-failed') }}</a>

            </div>
        </div>

        <button class="btn btn-success"  data-bs-toggle="collapse" href="#collapseFilter" role="button" aria-expanded="false" aria-controls="collapseFilter"><i class="fa fa-filter"></i> {{ __lang('filter') }}</button>
        <br> <br>
        <div class="collapse" id="collapseFilter">
            <div class="card card-body">
                <form id="filterform"    role="form"  method="get" action="{{ adminUrl(array('controller'=>'test','action'=>'results','id'=>$row->id)) }}">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="visually-hidden" for="filter">{{ __lang('filter') }}</label>

                                <input placeholder="{{ __lang('search') }}" name="filter" class="form-control" type="text" value="{{ @$_GET['filter'] }}"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="visually-hidden" for="start">{{ __lang('start-date') }}</label>

                                <input name="start" placeholder="{{ __lang('start-date') }}" class="form-control date" type="text" value="{{ @$_GET['start'] }}"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label class="visually-hidden" for="end">{{ __lang('end-date') }}</label>

                                <input name="end" placeholder="{{ __lang('end-date') }}" class="form-control date" type="text" value="{{ @$_GET['end'] }}"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-primary">{{ __lang('filter') }}</button>
                            <button type="button" onclick="$('#filterform input, #filterform select').val(''); $('#filterform').submit();" class="btn btn-secondary">{{ __lang('clear') }}</button>

                        </div>

                    </div>






                </form>


            </div>
        </div>


        <div class="card">

            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>{{ __lang('student') }}</th>
                        <th>{{ __lang('date-taken') }}</th>
                        <th>{{ __lang('score') }}</th>
                        <th>{{ __lang('grade') }}</th>
                        <th class="text-end">{{__lang('actions')}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @php foreach($paginator as $row):  @endphp
                        <tr>
                            <td>{{ $row->first_name }} {{ $row->last_name }}</td>
                            <td>{{ showDate('d/M/Y',$row->created_at) }}</td>
                            <td>{{ $row->score }}%</td>
                            <td>@php if($row->score >= $row->passmark):  @endphp
                                <span style="color:green">{{ __lang('passed') }}</span>
                                @php else:  @endphp
                                    <span style="color:red">{{ __lang('failed') }}</span>
                                @php endif;  @endphp
                            </td>

                            <td class="text-end">
                                 <a onclick="openModal('{{ $row->first_name }} {{ $row->last_name }}','{{ adminUrl(array('controller'=>'test','action'=>'testresult','id'=>$row->id)) }}')"  href="javascript:;" class="btn btn-xs btn-primary btn-equal" data-bs-toggle="tooltip" data-bs-placement="top" data-original-title="{{ __lang('view-result') }}"><i class="fa fa-eye"></i></a>
                                <a onclick="return confirm('{{__lang('delete-confirm')}}')" href="{{ adminUrl(array('controller'=>'test','action'=>'deleteresult','id'=>$row->id)) }}"  class="btn btn-xs btn-primary btn-equal" data-bs-toggle="tooltip" data-bs-placement="top" data-original-title="{{__lang('delete')}}"><i class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                    @php endforeach;  @endphp

                    </tbody>
                </table>

                @php
                // add at the end of the file after the table
                echo paginationControl(
                // the paginator object
                    $paginator,
                    // the scrolling style
                    'sliding',
                    // the partial to use to render the control
                    null,
                    // the route to link to when a user clicks a control link
                    array(
                        'route' => 'admin/default',
                        'controller'=>'test',
                        'action'=>'results',
                        'id'=>$testID
                    )
                );
                @endphp
            </div><!--end .box-body -->
        </div><!--end .box -->
    </div><!--end .col-lg-12 -->
</div>


<!-- START SIMPLE MODAL MARKUP --><!-- /.modal -->
<!-- END SIMPLE MODAL MARKUP -->

@endsection

@section('header')
    <link rel="stylesheet" href="{{ asset('client/vendor/pickadate/themes/default.date.css') }}">
    <link rel="stylesheet" href="{{ asset('client/vendor/pickadate/themes/default.time.css') }}">
    <link rel="stylesheet" href="{{ asset('client/vendor/pickadate/themes/default.css') }}">
    <link rel="stylesheet" href="{{ asset('client/vendor/datatables/media/css/jquery.dataTables.min.css') }}">
@endsection

@section('footer')
    <script type="text/javascript" src="{{ asset('client/vendor/pickadate/picker.js') }}"></script>
    <script type="text/javascript" src="{{ asset('client/vendor/pickadate/picker.date.js') }}"></script>
    <script type="text/javascript" src="{{ asset('client/vendor/pickadate/picker.time.js') }}"></script>
    <script type="text/javascript" src="{{ asset('client/vendor/pickadate/legacy.js') }}"></script>
    <script type="text/javascript">
        jQuery('.date').pickadate({
            format: 'yyyy-mm-dd'
        });
    </script>
@endsection
