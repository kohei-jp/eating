class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :live, :string
    add_column :users, :intro, :string
    add_column :users, :image, :string
  end
end