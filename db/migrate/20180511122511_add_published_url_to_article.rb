class AddPublishedUrlToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :published_url, :string, :default => ""
  end
end
