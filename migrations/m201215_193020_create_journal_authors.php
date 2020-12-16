<?php

use yii\db\Migration;

/**
 * Class m201215_193020_create_journal_authors
 */
class m201215_193020_create_journal_authors extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%journal_author}}', [
            'id' => $this->primaryKey(),
            'journal_id' => $this->integer(11),
            'author_id' => $this->integer(11),
            'status' => $this->tinyInteger(2),
        ]);
        $this->addForeignKey('FK_journal_id',    'journal_author',  'journal_id',   'journal',  'id', 'CASCADE', 'CASCADE');
        $this->addForeignKey('FK_author_id',    'journal_author',  'author_id',   'author',  'id', 'CASCADE', 'CASCADE');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m201215_193020_create_journal_authors cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m201215_193020_create_journal_authors cannot be reverted.\n";

        return false;
    }
    */
}
