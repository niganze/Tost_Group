@extends('layouts.admin')
@section('page-title','')
@section('breadcrumb')
    @include('admin.partials.crumb',[
    'crumbs'=>[
            route('admin.dashboard')=>__('default.dashboard'),
            route('admin.session.groups')=>__lang('course-categories'),
            '#'=>isset($pageTitle)?$pageTitle:''
        ]])
@endsection

@section('content')
    <div >
        <div class="card">

            <div class="card-body">

                    <form method="post" action="{{ adminUrl(array('controller'=>'session','action'=>$action,'id'=>$id)) }}">
                        @csrf





                <div class="mb-3">
                    {{ formLabel($form->get('name')) }}
                    {{ formElement($form->get('name')) }}   <p class="help-block">{{ formElementErrors($form->get('name')) }}</p>

                </div>




                <div class="mb-3">
                    {{ formLabel($form->get('description')) }}
                    {{ formElement($form->get('description')) }}   <p class="help-block">{{ formElementErrors($form->get('description')) }}</p>

                </div>



                <div class="mb-3">
                    {{ formLabel($form->get('sort_order')) }}
                    {{ formElement($form->get('sort_order')) }}   <p class="help-block">{{ formElementErrors($form->get('sort_order')) }}</p>

                </div>



                <div class="mb-3">
                            {{ formLabel($form->get('parent_id')) }}
                            {{ formElement($form->get('parent_id')) }}
                            <p class="help-block">{{  formElementErrors($form->get('parent_id')) }}</p>

                </div>

                <div class="mb-3">
                    {{ formLabel($form->get('enabled')) }}
                    {{ formElement($form->get('enabled')) }}   <p class="help-block">{{ formElementErrors($form->get('enabled')) }}</p>

                </div>






                <div class="form-footer">
                    <button type="submit" class="btn btn-primary">{{__lang('save-changes')}}</button>
                </div>
                    </form>
            </div>
        </div><!--end .box -->
    </div><!--end .col-lg-12 -->


@endsection
