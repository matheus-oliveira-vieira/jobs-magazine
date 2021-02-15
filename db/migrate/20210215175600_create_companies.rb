class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :cnpj
      t.string :website
      t.string :founded

      t.timestamps
    end
  end
end
