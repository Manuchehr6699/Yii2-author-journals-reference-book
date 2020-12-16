<?php

namespace app\controllers;

use app\models\Author;
use app\models\JournalAuthor;
use Yii;
use app\models\Journal;
use app\models\JournalSearch;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * JournalController implements the CRUD actions for Journal model.
 */
class JournalController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Journal models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new JournalSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Journal model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Journal model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Journal();
        $authors = new JournalAuthor();
        $data = ArrayHelper::map(Author::find()->asArray()->all(), 'id', function ($item){
            return $item['surname'].' '.$item['name'].' '.$item['patronomic'];
        });

        if ($model->load(Yii::$app->request->post())) {

            $model->photo = UploadedFile::getInstance($model, 'photo');
            $model->upload();
            if($model->status=1 && $model->save() && !empty(Yii::$app->request->post('JournalAuthor'))){
                foreach (Yii::$app->request->post('JournalAuthor')['author_id'] as $author){
                    $journalAuthor = new JournalAuthor();
                    $journalAuthor->author_id = $author;
                    $journalAuthor->journal_id = $model->id;
                    $journalAuthor->status = 1;
                    $journalAuthor->save();
                }
                Yii::$app->session->setFlash('success', 'Журнал успешно сохранен!');
            }else{
                Yii::$app->session->setFlash('warning', 'Не удалось сохранить журнал! :(');
            }

            return $this->redirect(['index']);
        }

        return $this->render('create', [
            'model' => $model,
            'authors' => $authors,
            'data' => $data
        ]);
    }

    /**
     * Updates an existing Journal model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Journal model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    public function actionAuthor($slug){
        $author = Author::getAuthorBySlug($slug);
        $searchModel = new JournalSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['journal_author.author_id' => $author['id']]);
//        journalAuthors
        return $this->render('author-journals', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'author' => $author
        ]);
    }

    /**
     * Finds the Journal model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Journal the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Journal::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
