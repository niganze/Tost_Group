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
<div>
			<div >
				<div class="card">
					<div class="card-header">
						<header>
                            {{ __lang('fields-help') }}


                        </header>
                        <a class="btn btn-primary float-end" href="{{ adminUrl(array('controller'=>'setting','action'=>'addfield')) }}"><i class="fa fa-plus"></i> {{ __lang('Add Field') }}</a>


					</div>
					<div class="card-body">

                        <table class="table table-hover">
							<thead>
								<tr>
									<th>{{ __lang('name') }}</th>
									<th>{{ __lang('sort-order') }}</th>
                                    <th>{{ __lang('type') }}</th>
                                    <th>{{ __lang('student-editable') }}</th>
									<th>{{__lang('actions')}}</th>
								</tr>
							</thead>
							<tbody>
                            @php foreach($paginator as $row):  @endphp
								<tr>
								 	<td>{{ $row->name }}</td>
									<td>{{ $row->sort_order }}</td>
								    <td>{{ $row->type }}</td>
									 <td>{{boolToString($row->enabled)}}</td>
									<td >
										<a href="{{ adminUrl(array('controller'=>'setting','action'=>'editfield','id'=>$row->id)) }}" class="btn btn-xs btn-primary btn-equal" data-bs-toggle="tooltip" data-bs-placement="top" data-original-title="{{__lang('edit')}}"><i class="fa fa-edit"></i></a>

										<a onclick="return confirm('{{__lang('delete-confirm')}}')" href="{{ adminUrl(array('controller'=>'setting','action'=>'deletefield','id'=>$row->id)) }}"  class="btn btn-xs btn-danger btn-equal" data-bs-toggle="tooltip" data-bs-placement="top" data-original-title="{{__lang('delete')}}"><i class="fa fa-trash"></i></a>
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
		 'controller'=>'setting',
		 'action'=>'fields',
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
