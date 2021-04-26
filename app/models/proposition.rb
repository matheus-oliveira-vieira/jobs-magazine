class Proposition < ApplicationRecord
  belongs_to :job_application
  after_update :update_status
  def update_status
    accepted ? job_application.aprovado! : job_application.negado!
  end
end
