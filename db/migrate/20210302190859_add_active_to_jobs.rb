class AddActiveToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :active, :boolean
  end
end
