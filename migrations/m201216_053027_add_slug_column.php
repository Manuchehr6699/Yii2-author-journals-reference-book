<?php

use yii\db\Migration;

/**
 * Class m201216_053027_add_slug_column
 */
class m201216_053027_add_slug_column extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('author', 'slug', 'varchar(255)');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m201216_053027_add_slug_column cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m201216_053027_add_slug_column cannot be reverted.\n";

        return false;
    }
    */
}
