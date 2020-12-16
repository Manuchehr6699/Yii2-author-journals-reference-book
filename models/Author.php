<?php

namespace app\models;

use Cocur\Slugify\Slugify;
use Yii;

/**
 * This is the model class for table "author".
 *
 * @property int $id
 * @property string|null $surname
 * @property string|null $name
 * @property string|null $patronomic
 * @property string|null $slug
 *
 * @property JournalAuthor[] $journalAuthors
 */
class Author extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'author';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['surname', 'name', 'patronomic', 'slug'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'surname' => 'Фамилия',
            'name' => 'Имя',
            'patronomic' => 'Отчество',
        ];
    }

    public function setSlug(){
        $slugify = new Slugify();
        $slug = $slugify->slugify($this->surname.' '.$this->name.' '.$this->patronomic);
        if(self::find()->where(['slug' => $slug])->count() > 0){
            $slug .= '_'.time();
            $this->slug = $slug;
        }else{
            $this->slug = $slug;
        }
    }

    public static function getAuthorBySlug($slug){
        return self::find()->where(['slug' => $slug])->asArray()->one();
    }

    /**
     * Gets query for [[JournalAuthors]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getJournalAuthors()
    {
        return $this->hasMany(JournalAuthor::className(), ['author_id' => 'id']);
    }
}
