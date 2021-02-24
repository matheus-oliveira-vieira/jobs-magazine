class AddCompanyToJob < ActiveRecord::Migration[6.1]
  def change
    add_reference :jobs, :company, foreign_key: true
  end
end
