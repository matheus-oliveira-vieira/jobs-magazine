class Job < ApplicationRecord
  belongs_to :company
  has_many :job_applications

  def active_or_inactive(boolean)
    boolean ? 'Ativa' : 'Inativa'
  end
end
