<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\JournalAuthor */

$this->title = 'Create Journal Author';
$this->params['breadcrumbs'][] = ['label' => 'Journal Authors', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="journal-author-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
