<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Journal */

$this->title = 'Добавить журнала';
$this->params['breadcrumbs'][] = ['label' => 'Журналы', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="journal-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'data' => $data,
        'authors' => $authors
    ]) ?>

</div>
