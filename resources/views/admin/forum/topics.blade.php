@extends('layouts.admin')
@section('page-title','')
@section('breadcrumb')
    @include('admin.partials.crumb',[
    'crumbs'=>[
            route('admin.dashboard')=>__('default.dashboard'),
            '#'=>isset($pageTitle)?$pageTitle:''
        ]])
@endsection

@section('content')
@if($lecture)
<div>
    <p class="lead">
        {{__lang('lecture')}}: {{$lecture->lecture_title}}
    </p>
</div>
@endif
<!--breadcrumb-section ends-->
<!--container starts-->
<div class="container_" style="background-color: white; min-height: 400px;   padding-bottom:50px; margin-bottom: 10px;   " >
    <!--primary starts-->

    <div class="card-body">
        <div>
            <a target="{{ @$target }}" class="btn btn-primary" href="{{ adminUrl(['controller'=>'forum','action'=>'addtopic','id'=>$id])}}"><i class="fa fa-plus"> Add Topic</i></a>
        </div>
        <div class="table-responsive">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>{{__lang('topic')}}</th>
                    <th>{{__lang('created-by')}}</th>
                    <th>{{__lang('added-on')}}</th>
                    <th >{{__lang('replies')}}</th>
                    <th>{{__lang('last-reply')}}</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                @php foreach($topics as $row):  @endphp

                <tr>
                    <td>{{ $row->topic_title }}</td>
                    <td>
                        {{ forumUser($row->topic_owner,$row->topic_owner_type)['name'] }}
                    </td>
                    <td>{{date('d/M/Y',$row->created_on)}}</td>
                    <td>{{($row->forumPosts->count()-1) }}</td>
                    <td>@php if($row->forumPosts->count()-1 > 0): @endphp
                        {{date('D, d M Y g:i a',$row->forumPosts()->orderBy('forum_post_id','desc')->first()->post_created_on) }}
                        @php endif;  @endphp
                    </td>
                    <td class="text-end">
                        <a  target="{{ @$target }}"  class="btn btn-primary" href="{{$_url('application/default',['controller'=>'forum','action'=>'topic','id'=>$row->forum_topic_id])}}">{{__lang('view')}}</a>

                        @if($student->student_id==$row->topic_owner && $row->topic_owner_type=='s')
                            <a onclick="return confirm('{{__lang('topic-delete-confirm')}}')" class="btn btn-danger" href="{{ $_url('application/default',['controller'=>'forum','action'=>'deletetopic','id'=>$row->forum_topic_id]) }}">{{__lang('delete-topic')}}</a>
                        @endif
                    </td>
                </tr>

                @php endforeach;  @endphp

                </tbody>
            </table>
        </div>
        @php
        // add at the end of the file after the table
        echo $topics->links();
        @endphp
    </div>


</div>

<!--container ends-->

@endsection
