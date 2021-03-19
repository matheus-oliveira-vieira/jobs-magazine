class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { administrator:5, employee: 10, candidate: 15 }
  belongs_to :company, optional: true
  has_many :job_applications
 before_save :employee_or_candidate

  private
    def employee_or_candidate
      if employee?
        company_website = email.split('@').last
        company = Company.find_by(website: company_website)
        if company.present?
          self.company = company
        else
          self.role = 'administrator'
        end
      else
        self.role = 'candidate'
      end

      end

end