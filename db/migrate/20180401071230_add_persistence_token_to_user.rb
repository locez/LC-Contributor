class AddPersistenceTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :persistence_token, :string
  end
end
