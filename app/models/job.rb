class Job < ApplicationRecord
  belongs_to :company

  def active_or_inactive(boolean)
    boolean ? 'Ativa' : 'Inativa'
  end
end
