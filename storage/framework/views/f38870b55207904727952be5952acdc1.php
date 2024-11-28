
<?php $__env->startSection('pageTitle',$pageTitle); ?>
<?php $__env->startSection('innerTitle',$pageTitle); ?>
<?php $__env->startSection('breadcrumb'); ?>
    <?php echo $__env->make('admin.partials.crumb',[
    'crumbs'=>[
            route('student.dashboard')=>__lang('dashboard'),
            '#'=>$pageTitle
        ]], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="card">
        <div class="card-body">
            <form     method="post" action="<?php echo e(route('student.student.save-billing')); ?>">
                <?php echo csrf_field(); ?>
                <div class="mb-3">
                    <label for="billing_firstname"><?php echo e(__lang('firstname')); ?></label>
                    <input name="billing_firstname" value="<?php echo e(old('billing_firstname',$user->billing_firstname)); ?>" type="text" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="billing_lastname"><?php echo e(__lang('lastname')); ?></label>
                    <input name="billing_lastname" value="<?php echo e(old('billing_lastname',$user->billing_lastname)); ?>" type="text" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="billing_country_id"><?php echo e(__('default.country')); ?></label>

                    <select name="billing_country_id" id="billing_country_id" class="form-select select2">
                        <option value=""></option>
                        <?php $__currentLoopData = $countries; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $country): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option <?php if(old('billing_country_id',$user->billing_country_id)==$country->id): ?> selected <?php endif; ?> value="<?php echo e($country->id); ?>"><?php echo e($country->name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="billing_state"><?php echo e(__('default.state')); ?></label>
                    <input name="billing_state" value="<?php echo e(old('billing_state',$user->billing_state)); ?>" type="text" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="billing_city"><?php echo e(__('default.city')); ?></label>
                    <input name="billing_city" value="<?php echo e(old('billing_city',$user->billing_city)); ?>" type="text" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="billing_address_1"><?php echo e(__('default.address-1')); ?></label>
                    <input name="billing_address_1" value="<?php echo e(old('billing_address_1',$user->billing_address_1)); ?>" type="text" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="billing_address_2"><?php echo e(__('default.address-2')); ?></label>
                    <input name="billing_address_2" value="<?php echo e(old('billing_address_2',$user->billing_address_2)); ?>" type="text" class="form-control">
                </div>

                <div class="mb-3">
                    <label for="billing_zip"><?php echo e(__('default.zip')); ?></label>
                    <input name="billing_zip" value="<?php echo e(old('billing_zip',$user->billing_zip)); ?>" type="text" class="form-control">
                </div>
                <div class="form-footer"  >
                    <button type="submit" class="btn btn-primary float-end"><?php echo e(__lang('Save Changes')); ?></button>
                </div>
            </form>


        </div>
    </div>

<?php $__env->stopSection(); ?>





<?php echo $__env->make(studentLayout(), \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\ALAIN\Desktop\traineasy\traineasy\traineasy\resources\views/student/student/billing.blade.php ENDPATH**/ ?>