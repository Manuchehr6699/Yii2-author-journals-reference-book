<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Journal */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="journal-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
    <div class="row">
        <div class="col-md-6"><?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?></div>
        <div class="col-md-6"><?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <?php
            echo $form->field($authors, 'author_id')->widget(\kartik\select2\Select2::classname(), [
                'data' => $data,
                'options' => ['placeholder' => 'Выбрать автора ...'],

                'pluginOptions' => [
                    'allowClear' => true,
                    'multiple' => true,
                ],
            ])->label('Авторы');
            ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6"><?= $form->field($model, 'publish_date')->textInput(['type' => 'date']) ?></div>
        <div class="col-md-6"><?= $form->field($model, 'photo')->fileInput() ?></div>
    </div>

    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
