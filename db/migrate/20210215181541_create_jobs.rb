class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.decimal :salary
      t.string :level
      t.text :requirements
      t.date :expiration_date
      t.integer :qty_candidates

      t.timestamps
    end
  end
end
