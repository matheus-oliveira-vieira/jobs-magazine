class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :cpf, :string
    add_column :users, :phone, :string
    add_column :users, :biography, :string
  end
end
