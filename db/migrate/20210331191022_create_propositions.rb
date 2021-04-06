class CreatePropositions < ActiveRecord::Migration[6.1]
  def change
    create_table :propositions do |t|
      t.text :message
      t.boolean :accepted

      t.timestamps
    end
  end
end
