class AddStatusToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :status, :string, :default => "待投稿"
  end
end
