class ChangeStatusToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :job_applications, :status, :integer
  end
end
