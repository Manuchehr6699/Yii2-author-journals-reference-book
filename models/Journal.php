<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "journal".
 *
 * @property int $id
 * @property string $name
 * @property string|null $description
 * @property string|null $photo
 * @property string|null $publish_date
 * @property int|null $status
 *
 * @property JournalAuthor[] $journalAuthors
 */
class Journal extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'journal';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['publish_date'], 'safe'],
            [['status'], 'integer'],
            [['name', 'description'], 'string', 'max' => 255],
            [['photo'], 'file', 'skipOnEmpty' => true, 'extensions'=>['png', 'jpg'], 'checkExtensionByMimeType'=>false, 'maxSize'=>1024 * 1024 * 2],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Название',
            'description' => 'Описание',
            'photo' => 'Картинка',
            'publish_date' => 'Дата выпуска',
            'status' => 'Статус',
        ];
    }

    public function upload()
    {
        if ($this->validate()) {
            $fileName = $this->photo->baseName.'.'.$this->photo->extension;
            $this->photo->saveAs('uploads/'.$fileName);
            $this->photo = $fileName;
            return true;
        } else {
            return false;
        }
    }

    /**
     * Gets query for [[JournalAuthors]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getJournalAuthors()
    {
        return $this->hasMany(JournalAuthor::className(), ['journal_id' => 'id']);
    }
}
