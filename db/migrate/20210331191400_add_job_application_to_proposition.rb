class AddJobApplicationToProposition < ActiveRecord::Migration[6.1]
  def change
    add_reference :propositions, :job_application, foreign_key: true
  end
end
