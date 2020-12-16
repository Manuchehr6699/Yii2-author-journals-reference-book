<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\AuthorSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Авторы';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="author-index">

    <h2><?= Html::encode($this->title) ?></h2>

    <p>
        <?= Html::a('Добавить', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            [
                'attribute' => 'surname',
                'format' => 'html',
                'value' => function ($data) {
                    return Html::a($data->surname, \yii\helpers\Url::to(['/journal/author/', 'slug' => $data->slug]));
                },
            ],
            'name',
            'patronomic',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
