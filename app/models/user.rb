class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { administrator:5, employee: 10, candidate: 15 }
  
  #before_save :employee_or_candidate

  # private
  #   def employee_or_candidate
  #     if :role == 10
  #     elsif :role == 15
  #       puts 'ololololol'
  #     end
  #   end

end
