class JobApplication < ApplicationRecord
    belongs_to :job
    belongs_to :user
    enum status: { 'pendente de avaliação': 5 , 'aprovado': 10, 'negado': 15 }

    def accept_application
    end

    def deny_application
    end
end 