class JobApplication < ApplicationRecord
    enum status: { 'pendente de avaliação': 5 , 'aprovado': 10, 'negado': 15 }
end