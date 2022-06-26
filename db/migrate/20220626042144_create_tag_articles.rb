class CreateTagArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_articles do |t|
      t.integer :tag_id
      t.integer :article_id

      t.timestamps
      add_index :tag_articles, :article, unique: true
    end
  end
end
