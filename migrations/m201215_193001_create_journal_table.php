<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%journal}}`.
 */
class m201215_193001_create_journal_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%journal}}', [
            'id' => $this->primaryKey(),
            'name' => $this->string(255)->notNull(),
            'description' => $this->string(255),
            'photo' => $this->string(255),
            'publish_date' => $this->date(),
            'status' => $this->tinyInteger()
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%journal}}');
    }
}
