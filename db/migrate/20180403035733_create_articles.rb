class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.string :author                # 原创作者
      t.string :translator            # 翻译者
      t.string :original_author       # 原文作者
      t.string :original_url          # 原文地址
      t.string :source_url            # 首发地址
      t.string :article_type
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
